FactoryBot.define do
  factory :student do
    email { Faker::Internet.free_email }
    password = Faker::Internet.password(min_length: 6)
    password {password}
    password_confirmation {password}
    name {"田中太郎"}
    grade {1}
    team {1}
    number {1}
  end
end
