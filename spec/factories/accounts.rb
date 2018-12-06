FactoryBot.define do
  factory :account do
    account{Faker::Internet.unique.email}
    password{"Password123"}
    password_confirmation{"Password123"}
    init_password{"Password123"}
    before_password{"Password123"}
  end
end
