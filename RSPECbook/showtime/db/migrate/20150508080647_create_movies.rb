class CreateMovies < ActiveRecord::Migration
  def change
    create_table :movies do |t|
      t.date :showtime_date
      t.time :showtime_time

      t.timestamps null: false
    end
  end
end
