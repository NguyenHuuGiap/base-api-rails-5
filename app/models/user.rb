class User < ApplicationRecord
  has_secure_password

  validates_presence_of :name
  validates :email, uniqueness: {case_sensitive: true}, length: {maximum: 255}, presence: true,
    format: {with: Settings.validations.email_regex}
  validates :password, confirmation: true, length: { minimum: 8, maximum: 40 }, presence: true
  validates :password_confirmation, presence: true
  enum status: [:inactive, :active]

  has_many :auth_tokens
end