# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end
Book.create!(
  [
    { title: "My Potato", author: "Charity Jones",
    price: 2.50, publish_date: "2000-09-25" },
    { title: "Knickerbocker", author: "Nyoo Yawk",
    price: 2.50, publish_date: "1998-01-01" },
    { title: "Moonie B Jones", author: "Courtney Love",
    price: 2.50, publish_date: "1984-02-28" },
    { title: "Hector's Bell", author: "Hector Salamanca",
    price: 2.50, publish_date: "09-09-2009" },
    { title: "Final Destination", author: "Your Mind",
    price: 2.50, publish_date: "09-25-2001" }
  ]
)
