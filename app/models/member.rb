class Member < ActiveHash::Base
  include ActiveHash::Associations
  belongs_to :group
  self.data = [
    {:id => 1, :member_name =>"佐藤拓弥",:part => "ギター",:member_image => "icon.png",:group_id => 1},
    {:id => 2, :member_name =>"メンバーB",:part => "ベース",:member_image => "icon.png",:group_id => 1}
  ]
end