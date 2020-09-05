class Books::FavoritesController < ApplicationController
  before_action :fetch_book

  def index
  end

  def create
    @book.favorites.create!({user: current_user})
  end

  def destroy
    @book.favorites.find_by!({user: current_user}).destroy
  end

  def pickup
    render layout: false
  end

  private
    def fetch_book
      @book = ::Book.find(book_id)
    end

    def book_id
      params.require(:book_id)
    end
end
