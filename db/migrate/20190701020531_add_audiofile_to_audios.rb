class AddAudiofileToAudios < ActiveRecord::Migration[5.2]
  def change
    add_column :audios,:audio_file,:string
  end
end
