class UsersController < ApplicationController
  
  
    before_action :authenticate_user!
    before_action :correct_user, only: [:edit, :update]
    
    def show
      @user = User.find(params[:id])
      @post_book = Book.new
      @post_books = Book.where(user_id: params[:id])
    end
    
    def index
      @user =  current_user
      @post_book = Book.new
      @users = User.all
    end
    
    def edit
        @user = current_user
    end
    
    def update
      @user = User.find(params[:id])
      if @user.update(user_params)
        flash[:notice] = "You have update user successfully."
        redirect_to user_path(@user.id)
      else
        render action: :edit
      end
    end
    
  private
  
    def correct_user
      user = User.find(params[:id])
      if current_user != user
        redirect_to user_path(current_user.id)
      end
    end
    
    def user_params
      params.require(:user).permit(:name, :profile_image,:introduction)
    end
end
