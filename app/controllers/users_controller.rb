class UsersController < ApplicationController
    def new
        @user = User.new
    end
    def create
        @user = User.new(user_params)
        if @user.save
            redirect_to @user, notice: 'User successfully created.'
        else
            render :new
        end
    end
    def index
        @users = User.all
    end
    def show
        @user = User.find(params[:id])
    end
    private
  
    def user_params
      params.require(:user).permit(:email, :first_name, :last_name)
    end
end