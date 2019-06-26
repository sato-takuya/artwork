class AddPublicuidToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members,:public_uid,:string
  end
end
