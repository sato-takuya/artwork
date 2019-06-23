class Member < ActiveHash::Base
  include ActiveHash::Associations
  belongs_to :group
  self.data = [
    {:id => 1, :member_name =>"メンバーの名前A",:part => "guitar",:member_info=>"自己紹介",:member_image => "icon.png",:group_id => 1},
    {:id => 2, :member_name =>"メンバーの名前B",:part => "Bass",:member_info=>"自己紹介",:member_image => "icon.png",:group_id => 1},
    {:id => 3, :member_name =>"メンバーの名前C",:part => "drum",:member_info=>"自己紹介",:member_image => "icon.png",:group_id => 1}
  ]
end