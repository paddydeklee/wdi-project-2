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