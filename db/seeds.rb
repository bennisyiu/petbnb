# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
require 'faker'
require 'open-uri'

Booking.destroy_all
Pet.destroy_all
User.destroy_all


dognames = %w(Brody Bruno Brutus Bubba Lucky Luke Mac Marley Max Thor Toby Tucker Tyson Ollie Oreo Oscar)

dogbreed = ["Shiba Inu", "Bichon Frise", "Poodle", "Beagle", "Siberian husky", "Afghan hound", "Dachshund", "Labradoodle", "Chihuahua"]

pet_descriptions =
["Personality: energetic, smart, enjoys the company of people, gets jealous if you choose to play with other dogs", "Personality: playful, Fetch is his favorite game, Would bring the ball back to you.", "Personality: smart, outgoing, masters simple obedience commands", "Personality: smart, playful, loves to take her toys around looking for someone to play with", "Forms strong bonds with those she learns to trust, enjoys company of strangers.", "Personality: happy, playful, loves to take her toys around,looking for someone to play with", "Fetch and tug of war are her favorite games", "Personality: playful, smart, enjoys the company of people", "Loves to take her toys around, looking for someone to play with"]

20.times do
  User.create!(name: Faker::Name.name)
  puts "#{User.name} created!"
end

4.times do
  user = User.all.sample.id
  Pet.create!(user_id: user,
              name: dognames.sample,
              age: rand(1..9),
              breed: dogbreed.sample,
              gender: ["Male", "Female"].sample,
              neutered: [true, false].sample,
              price: rand(50..450),
              description: pet_descriptions.sample)
  end


4.times do
  pet = Pet.all.sample
  user = User.where.not(id: pet.user.id).sample
  Booking.create!(user: user, pet: pet,
                  start_date: Faker::Date.between(from: '2020-09-23', to: '2020-10-10'),
                  end_date: Faker::Date.between(from: '2020-10-23', to: '2020-12-25'))
  end















