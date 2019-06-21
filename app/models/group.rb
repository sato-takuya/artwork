class Group < ActiveHash::Base
  include ActiveHash::Associations
  has_many :audios
  has_many :members
  has_many :videos

  self.data = [
    {:id => 1, :name => "バンド名", :nickname => "bandexample",:image => "icon.png",:short_prof => "100文字程度の簡単な自己紹介"}
  ]

end