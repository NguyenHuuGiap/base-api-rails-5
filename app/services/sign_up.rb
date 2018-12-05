class SignUp
  include Base

  def perform! user_params
    ActiveRecord::Base.transaction do
      user = User.new user_params
      user.save!
      AuthToken.generate! user
    end
  end
end
