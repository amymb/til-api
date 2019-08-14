FactoryBot.define do
  factory :nugget do
    title { Faker::Hacker.say_something_smart }
    description { Faker::Quote.matz }
    external_link { Faker::Internet.url }
    user_id { 1 }
  end
end
