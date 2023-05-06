class Book < ApplicationRecord
  belongs_to :user
  has_many :favorites, dependent: :destroy
  has_many :book_comments, dependent: :destroy
  validates :title,presence:true
  validates :body,presence:true,length:{maximum:200}

  def favorited_by?(user)
    favorites.exists?(user_id: user.id)
  end

  def self.looks(method, word)
    if method == "perfect"
      @book = Book.where("title LIKE?", "#{word}")
    elsif method == "forword"
      @book = Book.where("title LIKE?", "#{word}%")
    elsif method == "backward"
      @book = Book.where("title LIKE?", "%#{word}")
    elsif method == "partial"
      @book = Book.where("title LIKE?", "%#{word}%")
    else
      @user = Book.all
    end
  end

end
