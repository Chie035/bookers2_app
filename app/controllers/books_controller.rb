class BooksController < ApplicationController
    
    def index
        @books = Book.all
        @book = Book.new
    
    end
  
    def create
      @book = Book.new(book_params)
      @book.user_id = current_user.id
      
      if @book.save
         flash[:success]= "successfully created!"
         redirect_to book_path(@book.id)
      else
         @books = Book.all
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
    #直入力だとeditにアクセスできてしまうので以下の文は
    if @book.user != current_user
      redirect_to books_path
    end
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
    params.require(:book).permit(:title, :body)
  end
  
end
