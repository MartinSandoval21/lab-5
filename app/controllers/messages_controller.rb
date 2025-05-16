class MessagesController<ApplicationController
    before_action :set_message, only: [:show, :edit]
    def edit
    end
    def update
        @message = Message.includes(:user, :chat).find(params[:id])
        if @message.update(message_params)
            redirect_to message_path(@message), notice: "Message updated successfully."
        else
            flash[:alert] = @message.errors.full_messages.join(", ")
            redirect_to edit_message_path(@message)
        end
    end
    def new
        @message = Message.new
    end
    def create
        @message = Message.new(message_params)
        if @message.save
            redirect_to message_path(@message), notice: "Message created successfully."
        else
            flash[:alert] = @message.errors.full_messages.join(", ")
            redirect_to new_message_path
        end
    end
    def index
        @messages = Message.all
    end
    def show
    end
    private
    def message_params
        params.require(:message).permit(:chat_id, :user_id,:body)
    end
    def set_message
        @message = Message.includes(:user, :chat).find(params[:id])
    end
end