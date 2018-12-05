class AuthToken < ApplicationRecord
  include SecuredGenStrConcern

  belongs_to :user

  validates :token, presence: true, length: {maximum: Settings.validations.strings.max_length}
  validates :expired_at, presence: true

  class << self
    def generate! user, remember = false
      token = find_or_initialize_by user: user
      token.renew! remember
    end

    def from_token token
      find_by(token: token).tap{|t| raise Error::TokenExpired if t&.expired?}
    end
  end

  def renew! remember = false
    update! token: unique_random(:token), expired_at: Settings.auth_tokens.public_send(remember ? :expires_in : :short_expires_in).seconds.from_now
    self
  end

  def expired?
    expired_at <= Time.zone.now
  end

  def expire!
    update! expired_at: Time.zone.now
  end
end
