class BooksController < ApplicationController
    
    def index
        @books = Book.page(params[:page]).reverse_order
        @book = Book.new
    end
  
    def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      @book.save
      redirect_to books_path
    end
  
  def show
    @book = Book.find(params[:id])
    @user = @book.user
  end
  
  def edit
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
  
end
