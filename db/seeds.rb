# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

User.destroy_all
Consultation.destroy_all
Treatment.destroy_all
TreatmentType.destroy_all

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

c1 = u1.consultations.create!(type_of: "Orthopaedic",
                              brief: "I fell over yesterday and banged my knee. It's really swollen but I can't get an appointment with my GP until two weeks time. Should I go to A&E?",
                              image: "http://teamdoctorsblog.com/wp-content/uploads/2012/05/KneePain.jpg")

c2 = u1.consultations.create!(type_of: "Heart",
                              brief: "I have very bad heartburn. I usually get a subscription but I don't want to wait to see my GP. Can I see a consultant to get a consultation?",
                              image: "http://www.noahhealth.org/wp-content/uploads/2015/01/heartburn-2.jpg")

c3 = u2.consultations.create!(type_of: "Orthopaedic",
                              brief: "Ooooh me bones are chilly, such chilly bonesies anyone know how to makem warmem again brrr...?",
                              image: "http://skeletonpictures.org/large/3/Skeleton-Pictures-3.jpg")


e1 = Enquiry.create!(
                         type_of: "Orthopaedic",
                         brief: "I have another problem with my bones but I want to see a specialist about this one so I have contacted you directly",
                         image: "http://skeletonpictures.org/large/3/Skeleton-Pictures-3.jpg",
                         sender_id: u1.id,
                         receiver_id: u5.id)

tt1 = TreatmentType.create!(   name: "Surgery",
                         image_path: "/Users/paddydeklee/desktop/development/wdi-project-2/app/assets/images/surgery.png")

tt2 = TreatmentType.create!(   name: "Therapy",
                         image_path: "/Users/paddydeklee/desktop/development/wdi-project-2/app/assets/images/therapy.png")

tt3 = TreatmentType.create!(   name: "Medicine",
                         image_path: "/Users/paddydeklee/desktop/development/wdi-project-2/app/assets/images/medicine.png")

tt4 = TreatmentType.create!(   name: "Other",
                         image_path: "/Users/paddydeklee/desktop/development/wdi-project-2/app/assets/images/surgery.png")

t1 = Treatment.create!(consultation_id: c1.id,
                         treatment_for: "This patients bones are wack. They need replacing asap. It's a miracle they have lasted this long",
                         treatment_name: "Entire bone replacement therapy",
                         treatment_type_id: tt1.id,
                         treatment_quantity: "One off",
                         accepted: 0)




