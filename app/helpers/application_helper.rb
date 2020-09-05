module ApplicationHelper
  def favorite_link(book, user)
    book.favorited_by?(user) ?
      unfavoritize_link(book) : favoritize_link(book)
  end

  def fav_users_tag(book)
    tag.div(
      class: 'fav-users',
      data: {
        book_id: book.id,
        fetched: block_given?,
        fetch_path: pickup_book_favorites_path(book),
      }
    ) do
      yield if block_given?
    end
  end

  private
    def favoritize_link(book)
      link_to book.favorites.size, book_favorite_path(book), {
        remote: true,
        data: {book_id: book.id},
        method: :post,
        class: "glyphicon glyphicon-heart-empty btn btn-default fav-count",
      }
    end

    def unfavoritize_link(book)
      link_to book.favorites.size, book_favorite_path(book), {
        remote: true,
        data: {book_id: book.id},
        method: :delete,
        class: "glyphicon glyphicon-heart btn btn-default fav-count",
      }
    end
end
