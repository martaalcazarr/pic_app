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
User.transaction do
    user = User.new(email: "fakeri@mail.com", password: "123456", password_confirmation: "123456", name: "Persona")
    user.save!
  
    user_image = user.images.create!(context: "foto1", url: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/A-Cat.jpg/800px-A-Cat.jpg?20101227100718")
  
    user.pictures.create!(context: "foto1", url: "https://upload.wikimedia.org/wikipedia/commons/thumb/7/74/A-Cat.jpg/800px-A-Cat.jpg?20101227100718")
  
    # Creación de un comentario relacionado con el usuario y el post (picture) creados anteriormente
    Comment.create!(content: "comentario 1", user: user, picture: user_image)
  end
  