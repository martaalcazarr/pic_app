# # This file should contain all the record creation needed to seed the database with its default values.
# # The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
# #
# # Examples:
# #
# #   movies = Movie.create([{ name: "Star Wars" }, { name: "Lord of the Rings" }])
# #   Character.create(name: "Luke", movie: movies.first)
# User.create(email: "faker@mail.com", password: "123456", password_confirmation: "123456", name: "Persona", image: Image.create(context: "foto1" url: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/A-Cat.jpg/800px-A-Cat.jpg?20101227100718"))
# Post.create(name: "foto 1", description: "description 1", image: Image.create(context: "foto1", url: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/A-Cat.jpg/800px-A-Cat.jpg?20101227100718"))
# Comment.create(content: "comentario 1", user: User.last, picture: Picture.last)

# Creación de un usuario con su imagen de perfil y un post (picture) asociado

# Crea un usuario de ejemplo
# db/seeds.rb

# Crea un usuario de ejemplo
user = User.find_or_create_by(email: "faker@mail.com") do |u|
    u.password = "123456"
    u.password_confirmation = "123456"
    u.name = "Persona"
  end
  # Crea una imagen de ejemplo para el usuario
  user.images.find_or_create_by!(
    url: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/A-Cat.jpg/800px-A-Cat.jpg?20101227100718"
  ) do |image|
    image.context = "imagen de perfil de usuario"
  end
  
  # Crea un post (picture) de ejemplo asociado al usuario
  picture = user.pictures.find_or_create_by!(
    name: "foto 1",
    description: "description 1",
  )
  
  # Luego, crea la imagen y asóciala a la picture recién creada
  image = picture.images.find_or_create_by!(
    url: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/A-Cat.jpg/800px-A-Cat.jpg?20101227100718"
  )
  
  # Crea comentarios de ejemplo para el post (picture)
  picture.comments.find_or_create_by!(
    content: "comentario 1",
    user: user
  )
  
  picture.comments.find_or_create_by!(
    content: "QUE BONITO",
    user: user
  )
  
  picture.comments.find_or_create_by!(
    content: "ME GUSTA",
    user: user
  )
  
  picture.comments.find_or_create_by!(
    content: "GUAPO",
    user: user
  )
  