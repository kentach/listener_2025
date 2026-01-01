class AddAudioToVocabularies < ActiveRecord::Migration[7.2]
  def change
    add_column :vocabularies, :audio, :string
  end
end
