class UsersController < ApplicationController
    before_action :set_user, only: [:show, :edit]
    def edit
    end
    def update
        @user = User.find(params[:id])
        if @user.update(user_params)
            redirect_to user_path(@user), notice: "User updated successfully."
        else
            flash[:alert] = @user.errors.full_messages.join(", ")
            redirect_to edit_user_path(@user)
        end
    end
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to user_path(@user), notice: "User created successfully."
        else
            flash[:alert] = @user.errors.full_messages.join(", ")
            redirect_to new_user_path(@user)
        end
    end
    def index
        @users = User.all
        @users = User.includes(:messages).all
    end
    def show
        @chats = @user.chats.includes(:sender, :receiver, :messages).order(updated_at: :desc)
    end
    private
  
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name)
    end
    def set_user
        @user = User.find(params[:id])
    end
end