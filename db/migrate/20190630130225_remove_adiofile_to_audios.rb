class RemoveAdiofileToAudios < ActiveRecord::Migration[5.2]
  def change
    remove_column :audios, :audio_file, :string
  end
end
