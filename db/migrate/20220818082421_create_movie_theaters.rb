class CreateMovieTheaters < ActiveRecord::Migration[7.0]
  def change
    create_table :movie_theaters do |t|
      t.references :movie, null: false, foreign_key: true
      t.references :theater, null: false, foreign_key: true

      t.timestamps
    end
  end
end
