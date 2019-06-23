class CreateVideos < ActiveRecord::Migration[5.2]
  def change
    create_table :videos do |t|
      t.string :video_url
      t.string :video_title
      t.text :video_lyrics
      t.integer :user_id
      t.string :video_public_uid
      t.timestamps
    end
  end
end
