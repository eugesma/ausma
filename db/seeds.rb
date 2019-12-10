# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rails db:seed command (or created alongside the database with db:setup).
#
# Examples:
#
#   movies = Movie.create([{ name: 'Star Wars' }, { name: 'Lord of the Rings' }])
#   Character.create(name: 'Luke', movie: movies.first)
eugeUser = User.new(
  :username              => "eugesma",
  :password              => "12345678",
  :password_confirmation => "12345678"
)
eugeUser.add_role :admin
eugeUser.save!

Career.create(name: "TUEV", year_duration: 3)
Career.create(name: "TUF", year_duration: 3)