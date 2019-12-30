class MigratePostType < ActiveRecord::Migration[5.2]
  def change
    PostType.create(name: "Libro", credit: 96)
    PostType.create(name: "Capítulo de libro", credit: 48)
    PostType.create(name: "Publicación científica en revista", credit: 48)
    PostType.create(name: "Publicación técnica en revista", credit: 24)
    PostType.create(name: "Publicación en revista de divulgación", credit: 8)
    PostType.create(name: "Trabajo en congreso, jornada, simposio", credit: 24)
    PostType.create(name: "Resumen en congreso, jornada, simposio", credit: 8)
  end
end
