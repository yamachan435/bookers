class Book < ApplicationRecord
  validates :title, :body, presence: true
  validates :body, length: { maximum: 200 }

  belongs_to :user
  has_many :favorites
  has_many :favoriting_users, through: :favorites, source: :user

  def favorited_by?(user)
    favoriting_users.include?(user)
  end
end
