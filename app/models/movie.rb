class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  attachment :image
  enum genre_id: { action: 0, comedy: 1, horror: 2, mystery: 3, romance: 4, sf: 5 }
  # def self.search(keyword)
  #   where(["title like? OR cast like?", "%#{keyword}%", "%#{keyword}%"])
  # end

  def self.search(method,word)
    if method == "forward_match"
            @movies = Movie.where("text LIKE?","#{word}%")
    elsif method == "backward_match"
            @movies = Movie.where("text LIKE?","%#{word}")
    elsif method == "perfect_match"
            @movies = Movie.where("#{word}")
    elsif method == "partial_match"
            @movies = Movie.where("text LIKE?","%#{word}%")
    else
            @movies = Movie.all
    end
  end
end
