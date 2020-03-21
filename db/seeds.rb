# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

7.times do
  Provider.create!(
    name: Faker::Name.name,
    description: Faker::Quote.matz,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.unique.email,
    street: Faker::Address.street_address,
    postal_code: Faker::Address.zip_code,
    city: Faker::Address.city,
    confirmation_token: Faker::Alphanumeric.alphanumeric(number: 15),
    confirmed_at: Faker::Date.between(from: 5.days.ago, to: Date.today),
    terms_of_service: true
  )
end

42.times do
  Consumer.create!(
    name: Faker::Name.name,
    description: Faker::Quote.matz,
    phone: Faker::PhoneNumber.phone_number,
    email: Faker::Internet.unique.email,
    street: Faker::Address.street_address,
    postal_code: Faker::Address.zip_code,
    city: Faker::Address.city,
    confirmation_token: Faker::Alphanumeric.alphanumeric(number: 15),
    confirmed_at: Faker::Date.between(from: 5.days.ago, to: Date.today),
    terms_of_service: true
  )
end