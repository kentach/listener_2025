class CreateFavorites < ActiveRecord::Migration[7.2]
  def change
    create_table :favorites do |t|
      t.references :user, null: false, foreign_key: true
      t.references :audio, null: false, foreign_key: true
      t.timestamps
    end
    add_index :favorites, [:user_id, :audio_id], unique: true
  end
end