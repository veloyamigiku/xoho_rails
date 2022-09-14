class AddPrefectureToTheater < ActiveRecord::Migration[7.0]
  def change
    add_reference :theaters, :prefecture, foreign_key: true
  end
end
