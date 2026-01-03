class AddUserAnswerToTestQuestions < ActiveRecord::Migration[7.2]
  def change
    add_column :test_questions, :user_answer, :string
  end
end
