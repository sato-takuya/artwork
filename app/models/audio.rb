class Audio < ActiveHash::Base
  include ActiveHash::Associations
  belongs_to :group
  self.data = [
    {:id => 1, :source => "sound1.mp3",:title => '楽曲タイトル', :audio_image => "audio.jpeg",:lyrics => "私が私を語るほどに・・・",:group_id => 1},
    {:id => 2, :source => "sound2.mp3",:title => '楽曲タイトル', :audio_image => "audio.jpeg",:lyrics => "冷えたコンクリート",:group_id => 1},
    {:id => 3, :source => "sound3.mp3",:title => '楽曲タイトル', :audio_image => "audio.jpeg",:lyrics => "明日には大人になる君へ・・・",:group_id => 1},
    {:id => 4, :source => "sound4.mp3",:title => '楽曲タイトル', :audio_image => "audio.jpeg",:lyrics => "君はまだ覚えてるかな・・・",:group_id => 1},
    {:id => 5, :source => "sound5.mp3",:title => '楽曲タイトル', :audio_image => "audio.jpeg",:lyrics => "木造アパートの一階で・・・",:group_id => 1}
  ]
end