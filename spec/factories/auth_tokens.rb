FactoryBot.define do
  factory :auth_token do
    association :account
    token{Faker::Lorem.characters(8)}
    expired_at{1.day.from_now}
  end
end
