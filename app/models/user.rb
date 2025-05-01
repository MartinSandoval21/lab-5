class User < ApplicationRecord
  has_many :sent_messages, class_name: 'Message', foreign_key: 'user_id'
  has_many :receive_messages, class_name: 'Message', through: :Chats
  validates :email, presence: true, uniqueness: true
  end