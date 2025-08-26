# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

Product.create!([
  {
    name: "Dark Archangel T-shirt",
    description: "Black washed cotton t-shirt featuring an illustration of a hooded angel surrounded by roses, framed in a gothic arch. Perfect for dark and alternative outfits.",
    price: 30000,
    stock: 20,
    image_src: "tshirt1.webp"
  },
  {
    name: "Death Guardian T-shirt",
    description: "White on black design depicting a grim figure holding a sword, framed within a gothic portal. A mysterious and elegant piece for a bold style.",
    price: 35000,
    stock: 20,
    image_src: "tshirt2.webp"
  },
  {
    name: "Steel Wings T-shirt",
    description: "Minimalist yet powerful: black t-shirt with a central sword adorned with white wings. A symbol of strength and freedom with an epic aesthetic.",
    price: 30000,
    stock: 20,
    image_src: "tshirt3.webp"
  },
  {
    name: "Eternal Sun T-shirt",
    description: "Black t-shirt featuring a radiant sun with tribal-inspired design in white. A fusion of cosmic energy and alternative fashion.",
    price: 35000,
    stock: 20,
    image_src: "tshirt4.webp"
  }
])
