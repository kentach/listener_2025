class AddResultToTestQuestions < ActiveRecord::Migration[7.2]
  def change
    add_column :test_questions, :result, :string
  end
end
