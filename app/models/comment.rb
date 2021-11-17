class Comment < ApplicationRecord
  belongs_to :review
  belongs_to :user

   validates :content, presence: true
end
