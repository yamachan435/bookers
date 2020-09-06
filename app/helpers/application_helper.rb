module ApplicationHelper
  def favorite_link(book, user)
    book.favorited_by?(user) ?
      unfavoritize_link(book) : favoritize_link(book)
  end

  module FavUsers
    attr_accessor :book

    def tag_string(name, content = nil, escape_attributes: true, **options, &block)
      options.merge!({
        class: [options[:class]].compact.push('fav-users'),
        data: (options[:data] || {}).merge({
          book_id: book.id,
        }),
      })
      super
    end
  end

  def fav_users_tag(book)
    ActionView::Helpers::TagHelper::TagBuilder.new(self).extend(FavUsers).tap { |b| b.book = book }
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
