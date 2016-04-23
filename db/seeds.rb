# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all

u1 = User.create!(email: "paddy@paddy.com", 
                  password: "password", 
                  username: "paddydeklee", 
                  first_name: "Paddy", 
                  last_name: "de Klee", 
                  image: "http://fillmurray.com/300/300", 
                  role: "admin")

u2 = User.create!(email: "patient1@paddy.com", 
                  password: "password", 
                  username: "patient1", 
                  first_name: "Patient", 
                  last_name: "One", 
                  image: "http://fillmurray.com/300/301", 
                  role: "patient")


u3 = User.create!(email: "patient2@paddy.com", 
                  password: "password", 
                  username: "patient2", 
                  first_name: "Patient", 
                  last_name: "Two", 
                  image: "http://fillmurray.com/300/302", 
                  role: "patient")


u4 = User.create!(email: "patient3@paddy.com", 
                  password: "password", 
                  username: "patient3", 
                  first_name: "Patient", 
                  last_name: "Three", 
                  image: "http://fillmurray.com/300/303", 
                  role: "patient")


u5 = User.create!(email: "doctor1@paddy.com", 
                  password: "password", 
                  username: "doctor1", 
                  first_name: "Doctor", 
                  last_name: "One", 
                  image: "http://fillmurray.com/300/304", 
                  role: "doctor")

u6 = User.create!(email: "doctor2@paddy.com", 
                  password: "password", 
                  username: "doctor2", 
                  first_name: "Doctor", 
                  last_name: "Two", 
                  image: "http://fillmurray.com/300/305", 
                  role: "doctor")

