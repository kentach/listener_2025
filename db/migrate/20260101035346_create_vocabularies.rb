class CreateVocabularies < ActiveRecord::Migration[7.2]
  def change
    create_table :vocabularies do |t|
      t.timestamps
      t.string :series, null: false
      t.integer :number
      t.string :english, null: false
      t.string :japanese, null: false
    end
  end
end
