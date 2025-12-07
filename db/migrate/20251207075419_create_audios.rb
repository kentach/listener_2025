class CreateAudios < ActiveRecord::Migration[7.2]
  def change
    create_table :audios do |t|
      t.references :chapter, null: false, foreign_key: true
      t.string :file_name, null: false
      t.timestamps
    end
  end
end
