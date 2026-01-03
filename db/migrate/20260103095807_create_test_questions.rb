class CreateTestQuestions < ActiveRecord::Migration[7.0]
  def change
    create_table :test_questions do |t|
      t.references :test, null: false, foreign_key: true
      t.references :vocabulary, null: false, foreign_key: true
      
      t.integer :position, null: false

      t.timestamps
    end

    add_index :test_questions, [:test_id, :position], unique: true
  end
end
