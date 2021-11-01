class Movie < ApplicationRecord
  has_many :reviews, dependent: :destroy
  attachment :image
  enum genre_id: { action: 0, comedy: 1, horror: 2, mystery: 3, romance: 4, sf: 5 }
end
