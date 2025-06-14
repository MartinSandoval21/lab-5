class Ability
  include CanCan::Ability

  def initialize(user)
    return unless user.present?

    # Chats
    can [:create], Chat
    can [:new,:read,:edit,:update,:destroy],Chat , sender_id: user.id
    can [:new,:read,:edit,:update,:destroy],Chat , receiver_id: user.id



    # Messages
    can :read, Message
    can :create, Message do |message|
      if message.chat.present?
        true
      else
        false  # El chat no existe
      end
    end
    can [:new, :edit, :update, :destroy], Message, user_id: user.id

    # User
    can :read, User
    can [:new,:read,:update, :edit,:destroy], User, id: user.id
  end
end