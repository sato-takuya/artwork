class Group < ActiveHash::Base
  self.data = [
    {:id => 1, :name => "バンド名", :nickname => "bandname",:image => "icon.png",:short_prof => "100文字程度の簡単な自己紹介"}
  ]
end