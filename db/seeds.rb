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

PostType.create(name: "Libro", credit: 96)
PostType.create(name: "Capítulo de libro", credit: 48)
PostType.create(name: "Publicación científica en revista", credit: 48)
PostType.create(name: "Publicación técnica en revista", credit: 24)
PostType.create(name: "Publicación en revista de divulgación", credit: 8)
PostType.create(name: "Trabajo en congreso, jornada, simposio", credit: 24)
PostType.create(name: "Resumen en congreso, jornada, simposio", credit: 8)

TeacherFormationRole.create(name: "Asistente", plus_percentage: 0)
TeacherFormationRole.create(name: "Asistente y aprobado", plus_percentage: 50)
TeacherFormationRole.create(name: "Expositor", plus_percentage: 50)
TeacherFormationRole.create(name: "Organizador", plus_percentage: 100)
TeacherFormationRole.create(name: "Evaluador", plus_percentage: 50)