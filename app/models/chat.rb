class Chat < ApplicationRecord
    has_many :messages
    belongs_to :sender, class_name: 'User'
    belongs_to :receiver, class_name: 'User'
    validates :sender_id, :receiver_id, presence: true
    validate :different_users
    validate :unique_participants_pair

    private
    def different_users
        return unless sender && receiver 
    
        if sender == receiver
            errors.add(:base, "Sender and receiver must be different users")
        end
    end
    def unique_participants_pair
        if Chat.where.not(id: id)
            .where("(sender_id = ? AND receiver_id = ?) OR (sender_id = ? AND receiver_id = ?)", 
                    sender_id, receiver_id, receiver_id, sender_id)
            .exists?
        errors.add(:base, "A chat between these users already exists")
        end
    end

end