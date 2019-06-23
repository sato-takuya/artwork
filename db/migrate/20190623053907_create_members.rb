class CreateMembers < ActiveRecord::Migration[5.2]
  def change
    create_table :members do |t|
      t.string :member_name
      t.string :part
      t.text :member_info
      t.string :member_image
      t.integer :user_id
      t.timestamps
    end
  end
end
