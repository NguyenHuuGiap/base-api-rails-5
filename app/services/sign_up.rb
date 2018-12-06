class SignUp
  include Base

  def perform! account_params
    ActiveRecord::Base.transaction do
      account = Account.new account_params
      account.save!
      AuthToken.generate! account
    end
  end
end
