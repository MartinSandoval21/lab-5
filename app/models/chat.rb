class Chat < ApplicationRecord
    has_many :messages
    belongs_to :sender, class_name: 'User'
    belongs_to :receiver, class_name: 'User'
    validates :sender_id, :receiver_id, presence: true
    validate :different_users

    private
    def different_users
        return unless sender && receiver 
    
        if sender == receiver
            errors.add(:base, "Sender and receiver must be different users")
        end
    end
end