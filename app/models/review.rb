class Review < ApplicationRecord
  belongs_to :user
  belongs_to :movie
  has_many :comments, dependent: :destroy

   validates :score, presence: true
   validates :content, presence: true
end
