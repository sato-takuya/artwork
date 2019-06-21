class Video < ActiveHash::Base
  include ActiveHash::Associations
  belongs_to :group
  self.data = [
    {:id => 1, :source => "video1.mp4",:title => '独白', :video_image => "icon.png",:lyrics => "私が私を語るほどに・・・",:group_id => 1},
    {:id => 2, :source => "video2.mp4",:title => '冷凍睡眠', :video_image => "icon.png",:lyrics => "冷えたコンクリート",:group_id => 1},
    {:id => 3, :source => "video3.mp4",:title => '明日には大人になる君へ', :video_image => "icon.png",:lyrics => "明日には大人になる君へ・・・",:group_id => 1},
    {:id => 4, :source => "video4.mp4",:title => '夏を待っていました', :video_image => "icon.png",:lyrics => "君はまだ覚えてるかな・・・",:group_id => 1},
    {:id => 5, :source => "video5.mp4",:title => '無題', :video_image => "icon.png",:lyrics => "木造アパートの一階で・・・",:group_id => 1}
  ]
end