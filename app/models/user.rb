class User < ApplicationRecord
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable, :trackable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :rememberable, :validatable
  has_many :sent_messages, class_name: 'Message', foreign_key: 'user_id'
  has_many :chats_as_sender, class_name: 'Chat', foreign_key: 'sender_id'
  has_many :chats_as_receiver, class_name: 'Chat', foreign_key: 'receiver_id'
  has_many :messages, dependent: :destroy
  
  validates :email, presence: true, uniqueness: true
  validates :first_name, presence: true
  validates :last_name, presence: true
  def chats
    Chat.where("sender_id = ? OR receiver_id = ?", id, id)
  end
end