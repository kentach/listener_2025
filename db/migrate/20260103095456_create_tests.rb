class CreateTests < ActiveRecord::Migration[7.2]
  def change
    create_table :tests do |t|
      t.references :user, null: false, foreign_key: true

      t.string  :series, null: false
      t.integer :range_start, null: false
      t.integer :range_end, null: false

      t.string  :question_language, null: false # 'english' or 'japanese'
      t.integer :score
      t.integer :total_questions, default: 10, null: false
      t.boolean :passed, default: false, null: false

      t.timestamps
    end
  end
end
