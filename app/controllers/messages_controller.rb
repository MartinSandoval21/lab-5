class MessagesController<ApplicationController
    def new
        @message = Message.new
    end
    def create
        @message = Message.new(message_params)
        if @message.save
            redirect_to @message, notice: 'Message successfully created.'
        else
            render :new
        end
    end
    def index
        @messages = Message.all
    end
    def show
        @message = Message.find(params[:id])
    end
    private
    def message_params
        params.require(:message).permit(:chat_id, :user_id,:body)
    end
end