# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

10.times do |i|
  User.create(email: "user#{i}@gmail.com", first_name: "User", last_name: "#{i}")
end
  
10.times do |i|
  Chat.create(sender_id: 20, receiver_id: 20)
end

10.times do |i|
  Message.create(chat_id: 15+i, user_id: 11+i, body: " Example #{i}")
end

  