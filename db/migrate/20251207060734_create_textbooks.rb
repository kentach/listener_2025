class CreateTextbooks < ActiveRecord::Migration[7.2]
  def change
    create_table :textbooks do |t|
      t.string :name,  null: false
      t.string :level
      t.string :series
      t.string :cover_image, null: false
      t.timestamps
    end
  end
end
