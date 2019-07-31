FactoryBot.define do
  factory :user do
    first_name { "Fake" }
    last_name { "User" }
    username { "fakeuser" }
    email { "fakeuser@til.com" }
    admin { true }
  end
end
