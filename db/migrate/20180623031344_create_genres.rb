class CreateGenres < ActiveRecord::Migration[5.1]
  def change
    create_table :genres do |t|
      t.integer :db_genre_id
      t.string :title

      t.timestamps
    end
  end
end
