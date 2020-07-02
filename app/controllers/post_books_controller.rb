class PostBooksController < ApplicationController
    
    before_action :correct_user, only: [:edit, :update,:destroy]
    
    def create
         @post_book = PostBook.new(book_params)
         @post_book.user_id = current_user.id
        if @post_book.save
            flash[:notice] = "You have creatad book successfully."
            redirect_to post_book_path(@post_book.id)
        else
            @user = current_user
            @books = PostBook.all
            render action: :index
        end
    end
    
    def index
        @user = current_user
        @post_book = PostBook.new
        @books = PostBook.all
    end
    
    def show
        @post_book = PostBook.new
        @book = PostBook.find(params[:id])
        @user = User.find(@book.user_id)
    end
    
    def destroy
        book = PostBook.find(params[:id])
        book.destroy
        redirect_to post_books_path
    end

    def edit
        @book = PostBook.find(params[:id])
    end
    
    def update
      @book = PostBook.find(params[:id])
        if @book.update(book_params)
            flash[:notice] = "You have updated book successfully."
            redirect_to post_book_path(@book.id)
        else
            render action: :edit
        end
    end
    
private

    def correct_user
      user = User.find(PostBook.find(params[:id]).user_id)
      if current_user != user
        redirect_to post_books_path
      end
    end
  
  def book_params
    params.require(:post_book).permit(:book_name, :book_comment)
  end
end
