class CreateMovies < ActiveRecord::Migration[5.2]
  def change
    create_table :movies do |t|
      t.integer :genre_id
      t.integer :review_id
      t.string :title
      t.string :image_id
      t.text :introduction
      t.integer :created_year
      t.string :director
      t.string :cast

      t.timestamps
    end
  end
end
