class AddColumnToUsers < ActiveRecord::Migration[5.2]
  def change
    add_column :users,:top_image,:string
    add_column :users,:official_url,:string
    add_column :users,:twitter_id,:string
    add_column :users,:instagram_id,:string
  end
end
