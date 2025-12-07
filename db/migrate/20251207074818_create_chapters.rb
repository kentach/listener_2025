class CreateChapters < ActiveRecord::Migration[7.2]
  def change
    create_table :chapters do |t|
      t.string :title, null: false
      t.string :series, null: false
      t.references :textbook, null: false, foreign_key: true
      t.timestamps
    end
  end
end
