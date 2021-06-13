class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @book = Book.new
        @books = @user.books.page(params[:page]).reverse_order
    end
    
    def index
        @users = User.page(params[:page]).reverse_order
        @user = current_user
        @book = Book.new
    end
    
end
