class Genre < ApplicationRecord
  has_many :movies, dependent: :destroy
  
  validates :genre, presence: true
end
