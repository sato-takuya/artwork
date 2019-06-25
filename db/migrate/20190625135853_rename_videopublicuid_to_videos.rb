class RenameVideopublicuidToVideos < ActiveRecord::Migration[5.2]
  def change
    rename_column :videos, :video_public_uid, :public_uid
  end
end
