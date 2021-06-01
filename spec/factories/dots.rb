FactoryBot.define do
  factory :dot do
    title { "タイトル" }
    acted_at { Faker::Date.backward }
    category { 1 }
    sentence = Faker::Lorem.sentence
    introduction { sentence }
    effort { sentence }
    study { sentence }
    association :student
  end
end
