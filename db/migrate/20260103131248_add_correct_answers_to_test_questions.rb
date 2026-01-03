class AddCorrectAnswersToTestQuestions < ActiveRecord::Migration[7.2]
  def change
    add_column :test_questions, :correct_answers, :string
  end
end
