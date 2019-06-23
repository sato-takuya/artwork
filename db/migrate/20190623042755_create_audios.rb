class CreateAudios < ActiveRecord::Migration[5.2]
  def change
    create_table :audios do |t|
      t.string :source
      t.string :audio_title
      t.string :audio_image
      t.text :audio_lyrics
      t.integer :user_id
      t.string :audio_public_uid
      t.timestamps
    end
  end
end
