class BooksController < ApplicationController
    before_action :authenticate_user!
    def create
        @book = Book.new(book_params)
        @book.user_id = current_user.id
        @user = User.find(current_user.id)
        @books = Book.all
        if @book.save
            flash[:notice] = "new book creating successfully"
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
        @book = Book.new
        @target = Book.find(params[:id])
        @user = User.find(current_user.id)
    end
    def edit
        @book = Book.find(params[:id])
        if @book.user_id != current_user.id
            redirect_to "/books"
        end
        
    end
    def update
        book = Book.find(params[:id])
        if book.update(book_params)
            flash[:notice] = "book edit successfully"
            redirect_to book_path
        else
            flash[:notice] = "book edit error"
            redirect_to book_path
        end
    end
    def destroy
        book = Book.find(params[:id])
        book.destroy
        redirect_to "/books"
    end
    private
    def book_params
        params.require(:book).permit(:title,:body,:user_id)
    end
end
