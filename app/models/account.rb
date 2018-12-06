class Account < ApplicationRecord
  include SecuredGenStrConcern

  has_secure_password

  validates :account, uniqueness: {case_sensitive: true}, length: {maximum: 255}, presence: true
  validates :password, confirmation: true, length: {minimum: 8, maximum: 40}, presence: true
  validates :password_confirmation, presence: true

  has_one :auth_token

  enum staff_role: {owner: 0, store_manager: 1, staff: 2, cast: 3, driver: 4, clerical: 5,
                    call_center: 6, admin: 7, cs: 8}
  enum account_div: {disable: 0, enable: 1, default: 2}
  enum account_lock: {block: 0, active: 1, normal: 2}
end
