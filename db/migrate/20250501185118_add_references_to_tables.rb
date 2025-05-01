class AddReferencesToTables < ActiveRecord::Migration[8.0]
  def change
    add_foreign_key :chats, :users, column: :sender_id
    add_foreign_key :chats, :users, column: :receiver_id
    add_foreign_key :messages, :users, column: :user_id
    add_foreign_key :messages, :chats, column: :chat_id
    
  end
end
