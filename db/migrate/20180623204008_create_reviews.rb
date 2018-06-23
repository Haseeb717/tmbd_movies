class CreateReviews < ActiveRecord::Migration[5.1]
  def change
    create_table :reviews do |t|
      t.integer :movie_id
      t.integer :rate
      t.text :comment
      t.string :movie_name

      t.timestamps
    end
  end
end
