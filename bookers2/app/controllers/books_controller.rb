class BooksController < ApplicationController
    
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        @user = User.find(current_user.id)
        @books = Book.all
        if @book.save
            redirect_to book_path(@book.id)
        else 
            render :index
        end
    end
    def index
        @user = User.find(current_user.id)
        @book = Book.new
        @books = Book.all
    end
    def show
        @book = Book.find(params[:id])
    end
    private
    def book_params
        params.require(:book).permit(:title,:body,:user_id)
    end
end
