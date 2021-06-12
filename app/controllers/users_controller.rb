class UsersController < ApplicationController
    
    def show
        @user = User.find(params[:id])
        @books = Book.all
    end
    
    def index
        @users = User.page(params[:page]).reverse_order
        @user = current_user
    
    end
    
end
