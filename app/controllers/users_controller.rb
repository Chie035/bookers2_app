class UsersController < ApplicationController
   
    
    def show
        @user = User.find(params[:id])
        @book1 = Book.new
        #@book = Book.find(params[:id])
        @books = @user.books.all
    end
    
    def index
        @users = User.all
        @user = current_user
        @book = Book.new
    end
    
    def edit
        @user = User.find(params[:id])
        if @user != current_user 
           redirect_to user_path(current_user)
        end
              
    end
    
    def update
      @user = User.find(params[:id])
      if  @user.update(user_params)
          flash[:success]= "successfully update!"
          redirect_to user_path(@user.id)
      else
          render :edit
      end
            
    end
    
   
    
    private
    def user_params
        params.require(:user).permit(:name, :profile_image, :introduction)
    end
    
    
end
