class Book < ApplicationRecord
	belongs_to :user

	has_many :favorites, dependent: :destroy
	has_many :book_comments, dependent: :destroy

  def favorited_by?(user)
    favorites.where(user_id: user.id).exists?
  end

  def self.search(search, keyword)
    if search == "forword_match"
      @books = Book.where("title LIKE?","#{keyword}%")
    elsif search == "backword_match"
      @books = Book.where("title LIKE?","%#{keyword}")
    elsif search == "perfect_match"
      @books = Book.where(title: keyword)
    elsif search == "partial_match"
      @books = Book.where("title LIKE?","%#{keyword}%")
    end
  end



	validates :title, presence: true
	validates :body, presence: true, length: {maximum: 200}
end
