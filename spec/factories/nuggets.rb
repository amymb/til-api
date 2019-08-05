FactoryBot.define do
  factory :nugget do
    title { "What ||= means" }
    description { "Whatever preceds the || either exists OR is equal to whatever is on the right." }
    external_link { "https://orequals.amy.com" }
    user_id { 1 }
  end
end
