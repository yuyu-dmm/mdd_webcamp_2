class BooksController < ApplicationController
  # すべて見る
  def index
    @books = Book.all
    @book = Book.new
  end

  def new
    @book = Book.new(list_params)
    if @book.save
      flash[:notice] = "Book was successfully created."
      redirect_to book_path(@book.id)
    else
      @books = Book.all
      render :index
    end
  end
  def destroy
    book = Book.find(params[:id])
    book.destroy
    flash[:notice] = "Book was successfully destroyed."
    redirect_to :index
  end

  def edit
    @book = Book.find(params[:id])
  end
  def update
    @book = Book.find(params[:id])
    if @book.update(list_params)
      flash[:notice] = "Book was successfully updated."
      redirect_to book_path(@book.id)
    else
      render :edit
    end
  end
  def show
    @book = Book.find(params[:id])
  end
  def list_params
    params.require(:book).permit(:title, :body)
  end
end
