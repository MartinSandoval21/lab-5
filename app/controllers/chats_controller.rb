class ChatsController<ApplicationController
    before_action :set_chat, only: [:show, :edit]
    def edit
    end
    def update
        @chat = Chat.find(params[:id])
        if @chat.update(chat_params)
            redirect_to chat_path(@chat), notice: "Chat updated successfully."
        else
            flash[:alert] = @chat.errors.full_messages.join(", ")
            redirect_to edit_chat_path(@chat)
        end
    end
    def new
        @chat = Chat.new
    end
    def create
        @chat = Chat.new(chat_params)
        if @chat.save
            redirect_to chat_path(@chat), notice: "Chat created successfully."
        else
            flash[:alert] = @chat.errors.full_messages.join(", ")
            redirect_to new_chat_path
        end
    end
    def index
        @chats = Chat.all
    end
    def show
        @chat = Chat.includes(:sender, :receiver, :messages).find(params[:id])
        @messages = @chat.messages.order(created_at: :asc)
    end
    private
    def chat_params
        params.require(:chat).permit(:sender_id, :receiver_id)
    end
    def set_chat
        @chat = Chat.find(params[:id])
    end
end