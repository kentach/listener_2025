class AddLevelToVocabularies < ActiveRecord::Migration[7.2]
  def change
    add_column :vocabularies, :level, :string
  end
end
