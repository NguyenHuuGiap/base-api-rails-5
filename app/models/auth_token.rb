class AuthToken < ApplicationRecord
  include SecuredGenStrConcern

  belongs_to :account

  validates :token, presence: true, length: {maximum: Settings.auth_tokens.token.max_length}
  validates :expired_at, presence: true

  class << self
    def generate! account
      token = find_or_initialize_by account: account
      token.renew!
    end

    def from_token token
      find_by(token: token).tap{|t| raise ApiError::TokenExpired if t&.expired?}
    end
  end

  def renew!
    update! token: unique_random(:token),
      expired_at: Settings.auth_tokens.public_send(:short_expires_in).seconds.from_now
    token
  end

  def expired?
    expired_at <= Time.zone.now
  end

  def expire!
    update! expired_at: Time.zone.now
  end
end
