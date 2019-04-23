class Account < ApplicationRecord
  include SecuredGenStrConcern

  has_secure_password

  has_one :auth_token, dependent: :destroy

  validates :email, uniqueness: {case_sensitive: true}, length: {maximum: 255}, presence: true,
    format: {with: Settings.validations.email_regex}
  validates :password, confirmation: true, length: {minimum: 8, maximum: 40}, presence: true, on: :create
  validates :password_confirmation, presence: true, on: :create

  enum state: {active: "active", deactive: "deactive"}
end
