# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
#   Character.create(name: "Luke", movie: movies.first)


puts "Cleaning database..."
Bike.destroy_all
User.destroy_all

puts "Creating users..."
elodie = User.create!({ first_name: "Elodie", last_name:"Faure", email: "efaure@bla.com", password: "azerty" })
david = User.create!({ first_name: "David", last_name:"Berchier", email: "david-b@bla.com", password: "azerty" })


puts "Creating bikes..."
electro = {name: "Electro", brand:"O2feel", address: "Bordeaux", category: "électrique", description: "on l'appelle speedy", accessories: "panier", user_id: elodie.id}
bolide =  {name: "Bolide", brand:"Peugeot", address: "Paris", category: "VTT", description: "géniale en forêt", accessories: "anti-vol", user_id: david.id }

[electro, bolide].each do |attributes|
  bike = Bike.create!(attributes)
  puts "Created #{bike.name}"
end
puts "Finished!"
