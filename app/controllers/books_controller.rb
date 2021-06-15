class BooksController < ApplicationController
    
    def index
        @books = Book.page(params[:page]).reverse_order
        @book1 = Book.new
    
    end
  
    def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      
      if @book.save
      flash[:success]= "successfully created!"
       redirect_to book_path(@book.id)
      else
       @book1 = @book
       @books = Book.page(params[:page]).reverse_order
       render :index 
      end
    end
  
  def show
    @book = Book.find(params[:id])
    @book1 = Book.new
    @user = @book.user
  end
  
  def edit
    @book = Book.find(params[:id])
  end
  
  def update
    @book = Book.find(params[:id])
    if @book.update(book_params)
      flash[:success]= "successfully update!"
       redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  
  def destroy
    @book = Book.find(params[:id])
    @book.destroy
    redirect_to books_path
  end
  
  private
  
  def book_params
    params.require(:book).permit(:title, :opinion)
  end
  
end
