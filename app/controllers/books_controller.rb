class BooksController < ApplicationController
  before_action :set_book, only: [:show, :edit, :update, :destroy]
  before_action :check_editable, only: [:edit, :update, :destroy]

  def index
    @books = Book.all
    render layout: 'mypage'
  end

  def show
    @user = @book.user
    render layout: 'user_page'
  end

  def edit
    render layout: 'centering'
  end

  def create
    @book = current_user.books.build(book_params)
    if @book.save
      redirect_to @book, notice: 'You have creatad book successfully.'
    else
      @books = Book.all
      render :index, layout: 'mypage'
    end
  end

  def update
    if @book.update(book_params)
      redirect_to @book, notice: 'You have updated book successfully.'
    else
      render :edit, layout: 'centering'
    end
  end

  def destroy
    @book.destroy
    redirect_to books_url, notice: 'Book was successfully destroyed.'
  end

  private
    def set_book
      @book = Book.find(params[:id])
    end

    def book_params
      params.require(:book).permit(:title, :body)
    end

    def check_editable
      unless @book.user == current_user
        redirect_to books_path
      end
    end
end
