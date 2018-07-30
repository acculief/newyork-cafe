class CreateProducts < ActiveRecord::Migration[5.2]
  def change
    create_table :products do |t|
      t.string :title
      t.integer :favorite_count
      t.integer :view_count
      t.integer :like_count
      t.integer :dislike_count
      t.integer :comment_count
      t.string :products_url
      t.integer :youtuber_id

      t.timestamps
    end
  end
end
