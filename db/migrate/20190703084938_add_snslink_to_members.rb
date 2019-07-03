class AddSnslinkToMembers < ActiveRecord::Migration[5.2]
  def change
    add_column :members,:twitter_id,:string
    add_column :members,:instagram_id,:string
  end
end
