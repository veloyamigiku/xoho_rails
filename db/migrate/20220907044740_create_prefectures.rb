class CreatePrefectures < ActiveRecord::Migration[7.0]
  def change
    create_table :prefectures do |t|
      t.string :name
      t.references :area, null: false, foreign_key: true

      t.timestamps
    end
  end
end
