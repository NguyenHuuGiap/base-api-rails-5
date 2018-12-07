class SignIn
  include Base

  def perform! sign_in_params
    account = Account.find_by account: sign_in_params[:account]
    raise ApiError::AccountNotFound unless account
    raise ApiError::Unauthenticated unless account&.authenticate(sign_in_params[:password])

    AuthToken.generate! account
  end
end
