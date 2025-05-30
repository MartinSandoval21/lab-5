class Message < ApplicationRecord
    belongs_to :chat
    belongs_to :user
    validates :chat, presence: true
    validates :user_id, presence: true
    validates :body, presence: true
    validate :user_belongs_to_chat

    private

    def user_belongs_to_chat
        unless [chat.sender_id, chat.receiver_id].include?(user_id)
            errors.add(:base, "You can only send messages to chats you participate in")
        end
    end
end