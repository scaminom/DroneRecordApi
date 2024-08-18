FactoryBot.define do
  factory :user do
    username { Faker::Internet.unique.username(specifier: 5..10) }
    email { Faker::Internet.unique.email }
    password { Faker::Internet.password(min_length: 6) }
    role { :user }
    first_name { Faker::Name.first_name.gsub(/[^a-zA-Z]/, '') }
    last_name { Faker::Name.last_name.gsub(/[^a-zA-Z]/, '') }
  end
end
