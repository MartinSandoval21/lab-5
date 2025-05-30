# This file should ensure the existence of records required to run the application in every environment (production,
# development, test). The code here should be idempotent so that it can be executed at any point in every environment.
# The data can then be loaded with the bin/rails db:seed command (or created alongside the database with db:setup).
#
# Example:
#
#   ["Action", "Comedy", "Drama", "Horror"].each do |genre_name|
#     MovieGenre.find_or_create_by!(name: genre_name)
#   end

# db/seeds.rb

# Limpiar la base de datos primero
puts "Limpiando la base de datos..."
Message.destroy_all
Chat.destroy_all
User.destroy_all

# Crear usuarios
puts "Creando usuarios..."
users = [
  { email: "usuario1@example.com", first_name: "Juan", last_name: "Pérez", password: "password123" },
  { email: "usuario2@example.com", first_name: "María", last_name: "Gómez", password: "password123" },
  { email: "usuario3@example.com", first_name: "Carlos", last_name: "López", password: "password123" },
  { email: "usuario4@example.com", first_name: "Ana", last_name: "Martínez", password: "password123" }
]

created_users = users.map do |user_data|
  User.create!(user_data)
end

# Crear chats entre usuarios
puts "Creando chats..."
chats = [
  { sender: created_users[0], receiver: created_users[1] },
  { sender: created_users[0], receiver: created_users[2] },
  { sender: created_users[1], receiver: created_users[3] }
]

created_chats = chats.map do |chat_data|
  Chat.create!(
    sender_id: chat_data[:sender].id,
    receiver_id: chat_data[:receiver].id
  )
end

# Crear mensajes en los chats
puts "Creando mensajes..."
messages = [
  { chat: created_chats[0], user: created_users[0], body: "Hola María, ¿cómo estás?" },
  { chat: created_chats[0], user: created_users[1], body: "Hola Juan, estoy bien. ¿Y tú?" },
  { chat: created_chats[0], user: created_users[0], body: "Todo bien por aquí, gracias por preguntar." },
  { chat: created_chats[1], user: created_users[0], body: "Carlos, ¿viste el partido ayer?" },
  { chat: created_chats[1], user: created_users[2], body: "Sí, estuvo increíble. Ese último gol fue espectacular." },
  { chat: created_chats[2], user: created_users[1], body: "Ana, ¿vamos al cine mañana?" },
  { chat: created_chats[2], user: created_users[3], body: "Claro, ¿a qué hora quieres que nos encontremos?" }
]

messages.each do |message_data|
  Message.create!(
    chat_id: message_data[:chat].id,
    user_id: message_data[:user].id,
    body: message_data[:body]
  )
end

puts "¡Semilla completada con éxito!"
puts "Se crearon:"
puts "- #{User.count} usuarios"
puts "- #{Chat.count} chats"
puts "- #{Message.count} mensajes"

  