class AddColumnToMovie < ActiveRecord::Migration[7.0]
  def change
    add_column :movies, :play_started_on, :datetime
  end
end
