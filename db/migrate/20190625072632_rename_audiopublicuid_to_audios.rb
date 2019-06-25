class RenameAudiopublicuidToAudios < ActiveRecord::Migration[5.2]
  def change
    rename_column :audios, :audio_public_uid, :public_uid
  end
end
