class BooksController < ApplicationController
    
    before_action :authenticate_user!
    
    before_action :correct_user, only: [:edit, :update,:destroy]
    
    def create
         @post_book = Book.new(book_params)
         @post_book.user_id = current_user.id
        if @post_book.save
            flash[:notice] = "You have creatad book successfully."
            redirect_to book_path(@post_book.id)
        else
            @user = current_user
            @books = Book.all
            render action: :index
        end
    end
    
    def index
        @user = current_user
        @post_book = Book.new
        @books = Book.all
    end
    
    def show
        @post_book = Book.new
        @book = Book.find(params[:id])
        @user = User.find(@book.user_id)
    end
    
    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to books_path
    end

    def edit
        @book = Book.find(params[:id])
    end
    
    def update
      @book = Book.find(params[:id])
        if @book.update(book_params)
            flash[:notice] = "You have updated book successfully."
            redirect_to book_path(@book.id)
        else
            render action: :edit
        end
    end
    
private

    def correct_user
      user = User.find(Book.find(params[:id]).user_id)
      if current_user != user
        redirect_to books_path
      end
    end
  
  def book_params
    params.require(:book).permit(:title, :body)
  end
end
