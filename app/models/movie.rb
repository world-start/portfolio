class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  belongs_to :genre
  attachment :image
  # enum genre_id: { action: 0, comedy: 1, horror: 2, mystery: 3, romance: 4, sf: 5 }

  validates :title, presence: true
  # validates :image_id, presence: true
  validates :created_year, presence: true
  validates :director, presence: true
  validates :cast, presence: true
  validates :introduction, presence: true

  def self.search(method,word)
    if method == "forward_match"
            @movies = Movie.where(["title LIKE ? OR created_year LIKE ? OR introduction LIKE ? OR director LIKE ? OR `cast` LIKE ?","#{word}%","#{word}%","#{word}%","#{word}%","#{word}%"])
    elsif method == "backward_match"
            @movies = Movie.where(["title LIKE ? OR created_year LIKE ? OR introduction LIKE ? OR director LIKE ? OR `cast` LIKE ?","%#{word}","%#{word}","%#{word}","%#{word}","%#{word}"])
    elsif method == "perfect_match"
            @movies = Movie.where(["title LIKE ? OR created_year LIKE ? OR introduction LIKE ? OR director LIKE ? OR `cast` LIKE ?","#{word}","#{word}","#{word}","#{word}","#{word}"])
    elsif method == "partial_match"
            @movies = Movie.where(["title LIKE ? OR created_year LIKE ? OR introduction LIKE ? OR director LIKE ? OR `cast` LIKE ?","%#{word}%","%#{word}%","%#{word}%","%#{word}%","%#{word}%"])
    else
            @movies = Movie.all
    end
  end
end
