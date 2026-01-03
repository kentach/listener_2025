class CreateTestProgresses < ActiveRecord::Migration[7.0]
  def change
    create_table :test_progresses do |t|
      t.references :user, null: false, foreign_key: true

      t.string  :series, null: false
      t.integer :cleared_count, default: 0, null: false
      t.boolean :max_cleared, default: false

      t.timestamps
    end

    add_index :test_progresses, [:user_id, :series], unique: true
  end
end
