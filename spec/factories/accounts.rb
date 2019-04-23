FactoryBot.define do
  factory :account do
    email{Faker::Internet.unique.email}
    password{"Password123"}
    password_confirmation{"Password123"}
    state{"active"}
  end
end
