class CreateReviews < ActiveRecord::Migration[5.2]
  def change
    create_table :reviews do |t|
      t.integer :user_id
      t.integer :movie_id
      t.integer :comment_id
      t.float :score
      t.string :content

      t.timestamps
    end
  end
end
