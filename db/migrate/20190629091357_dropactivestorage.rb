class Dropactivestorage < ActiveRecord::Migration[5.2]
  def change
    drop_table :active_storage_blobs
    drop_table :active_storage_attachments
  end
end
