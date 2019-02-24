# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)

1000.times do 
    User.create!(
        first: Faker::Name.first_name, 
        last: Faker::Name.last_name, 
        username: Faker::Internet.user_name,
        birthday: Faker::Date.birthday(18, 65),
        favorite_pokemon: Faker::Pokemon.name,
        favorite_programming_language: Faker::ProgrammingLanguage.name,
        last_sign_in_ip: Faker::Internet.ip_v4_address
    )
end

Search.create!(query: "Is this the password field? MCA{just_browsin'_my_search_history}")

100.times do 
    Search.create!(query: Faker::Name.first_name)
end