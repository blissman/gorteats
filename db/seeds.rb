# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.create({name: "Fil", email: "filips@gmail.com", password: "fil"})
User.create({name: "Frances", email: "f@c.com", password: "frances"})
User.create({name: "Chris", email: "cstaikos@gmail.com", password: "chris"})
User.create({name: "Bliss", email: "b@m.com", password: "bliss"})

Restaurant.create({name: "Fil's Diner", location: "Toronto", price: 5, description: "The best diner ever.", owner_id: 1, capacity: 40})

Restaurant.create({name: "Frances' Bistro", location: "Liberty Village", price: 5, description: "You probably haven't heard of it.", owner_id: 2, capacity: 30})

Reservation.create({date_time: Time.now, party_size: 6, restaurant_id: 1, user_id: 2})
