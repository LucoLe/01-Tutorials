class CreateGenresMovies < ActiveRecord::Migration
  def change
    create_table :genres_movies do |t|
      t.references :genre
      t.references :movie

      t.timestamps null: false
    end
  end
end
