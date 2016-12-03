# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)


User.create(email: "lacey.hike@gmail.com", password: "password", password_confirmation: "password", user_type: 1)

def create_items
  Item.find_or_create_by(name: "Wallets (set of 8) - $7.00", photo_type: "Photo")
  Item.find_or_create_by(name: "4 X 6 - $3.00", photo_type: "Photo")
  Item.find_or_create_by(name: "4 X 5 - $3.00", photo_type: "Photo")
  Item.find_or_create_by(name: "5 X 7 - $5.00", photo_type: "Photo")
  Item.find_or_create_by(name: "8 X 10 - $10.00", photo_type: "Photo")
  Item.find_or_create_by(name: "8 X 12 - $13.00", photo_type: "Photo")
  Item.find_or_create_by(name: "10 X 13 - $15.00", photo_type: "Photo")
  Item.find_or_create_by(name: "10 X 15 - $16.00", photo_type: "Photo")
  Item.find_or_create_by(name: "11 X 14 - $20.00", photo_type: "Photo")
  Item.find_or_create_by(name: "12 X 18 - $26.00", photo_type: "Photo")
  Item.find_or_create_by(name: "16 X 20 - $35.00", photo_type: "Photo")
  Item.find_or_create_by(name: "16 X 24 - $45.00", photo_type: "Photo")
  Item.find_or_create_by(name: "20 X 24 - $47.00", photo_type: "Photo")
  Item.find_or_create_by(name: "20 X 30 - $55.00", photo_type: "Photo")
  Item.find_or_create_by(name: "30 X 40 - $90.00", photo_type: "Photo")
  Item.find_or_create_by(name: "8 X 8 Square Print - $9.00", photo_type: "Photo")
  Item.find_or_create_by(name: "10 X 10 Square Print - $15.00", photo_type: "Photo")
  Item.find_or_create_by(name: "12 X 12 Square Print - $20.00", photo_type: "Photo")
  Item.find_or_create_by(name: "20 X 20 Square Print - $50.00", photo_type: "Photo")
  Item.find_or_create_by(name: "30 X 30 Square Print - $80.00", photo_type: "Photo")
  Item.find_or_create_by(name: "5 X 10 Wide Print - $8.00", photo_type: "Photo")
  Item.find_or_create_by(name: "10 X 20 Wide Print - $25.00", photo_type: "Photo")
  Item.find_or_create_by(name: "12 X 24 Wide Print - $30.00", photo_type: "Photo")
  Item.find_or_create_by(name: "Accordion Book - $22.00")
  Item.find_or_create_by(name: "Artistry Accordion Book - $38.00")
  Item.find_or_create_by(name: "Mouse Pads - $12.00")
  Item.find_or_create_by(name: "1 Coaster - $12.00")
  Item.find_or_create_by(name: "Coaster (Set of 4) - $35.00")
  Item.find_or_create_by(name: "iPhone 4 or 4S Hard Cover Case - $20.00")
end

create_items