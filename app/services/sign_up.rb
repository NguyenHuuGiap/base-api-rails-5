class SignUp
  include Base

  def perform! account_params
    account_params[:init_password] = account_params[:before_password] = account_params[:password]
    ActiveRecord::Base.transaction do
      account = Account.new account_params
      account.save!
      AuthToken.generate! account
    end
  end
end
