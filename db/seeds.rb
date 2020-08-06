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

Pet.create!(name: 'Oscar', breed: 'Poodle', gender: 'Male', neutered: true, price: 167, description: "Personality: smart, outgoing, masters simple obedience commands", age: 4, photo: "http://lc-IeNhaFtr.cn-n1.lcfile.com/46f25669e0395b160189/Labradoodle.png", user_id: User.all.sample.id)
Pet.create!(name: 'Brody', breed: 'Bichon Frise', gender: 'Female', neutered: false, price: 373, description: "Personality: smart, outgoing, masters simple obedience commands", age: 1, photo: "http://lc-IeNhaFtr.cn-n1.lcfile.com/6807991364ab4e04ed91/Bichon%20Frise.jpeg", user_id: User.all.sample.id)
Pet.create!(name: 'Luke', breed: 'Afghan Hound', gender: 'Male', neutered: true, price: 286, description: "Forms strong bonds with those she learns to trust, enjoys company of strangers.", age: 8, photo: "http://lc-IeNhaFtr.cn-n1.lcfile.com/8abc1d14338078b269d2/afghan%20hound.png", user_id: User.all.sample.id)
Pet.create!(name: 'Bubba', breed: 'Beagle', gender: 'Female', neutered: false, price: 179, description: "Personality: happy, playful, loves to take her toys around,looking for someone to play with", age: 9, photo: "http://lc-IeNhaFtr.cn-n1.lcfile.com/431d86755d579c25e637/beagle.png", user_id: User.all.sample.id)
Pet.create!(name: 'Fluffy', breed: 'Chihuahua', gender: 'Female', neutered: false, price: 50, description: "smart, active, playful and fluffy of course ..", age: 2, photo: "http://lc-IeNhaFtr.cn-n1.lcfile.com/bbc4227355b7a845e558/Chihuahua.png", user_id: User.all.sample.id)
Pet.create!(name: 'Doggie', breed: 'Afghan Hound', gender: 'Male', neutered: false, price: 50, description: "Loves to take his toys around, looking for someone to play with", age: 3, photo: "http://lc-IeNhaFtr.cn-n1.lcfile.com/8abc1d14338078b269d2/afghan%20hound.png", user_id: User.all.sample.id)

booking1 = Booking.create!(user_id: User.all.sample.id, pet_id: Pet.all.sample.id, start_date: "2020-08-10", end_date: "2020-08-17")
days1 = (booking1.end_date - booking1.start_date).to_i
booking1.update(total: booking1.pet.price * days1)
puts "booking1 created!"

booking2 = Booking.create!(user_id: User.all.sample.id, pet_id: Pet.all.sample.id, start_date: "2020-09-02", end_date: "2020-09-07")
days2 = (booking2.end_date - booking2.start_date).to_i
booking2.update(total: booking2.pet.price * days2)
puts "booking2 created!"

booking3 = Booking.create!(user_id: User.all.sample.id, pet_id: Pet.all.sample.id, start_date: "2020-08-20", end_date: "2020-08-25")
days3 = (booking3.end_date - booking3.start_date).to_i
booking3.update(total: booking3.pet.price * days3)
puts "booking3 created!"

booking4 = Booking.create!(user_id: User.all.sample.id, pet_id: Pet.all.sample.id, start_date: "2020-10-20", end_date: "2020-12-24")
days4 = (booking4.end_date - booking4.start_date).to_i
booking4.update(total: booking4.pet.price * days4)
puts "booking4 created!"










