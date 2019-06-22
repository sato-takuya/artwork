class Audio < ActiveHash::Base
  include ActiveHash::Associations
  belongs_to :group
  self.data = [
    {:id => 1, :source => "glowing.mp3",:title => '楽曲タイトルA', :audio_image => "audio.png",:lyrics => "私が私を語るほどに・・・",:group_id => 1,:public_uid => 'fmdilosm'},
    {:id => 2, :source => "glowing.mp3",:title => '楽曲タイトルB', :audio_image => "audio.png",:lyrics => "冷えたコンクリート",:group_id => 1,:public_uid => 'dtaqokcs'},
    {:id => 3, :source => "glowing.mp3",:title => '楽曲タイトルC', :audio_image => "audio.png",:lyrics => "明日には大人になる君へ・・・",:group_id => 1,:public_uid=>'rughswev'},
    {:id => 4, :source => "glowing.mp3",:title => '楽曲タイトルD', :audio_image => "audio.png",:lyrics => "君はまだ覚えてるかな・・・",:group_id => 1,:public_uid=>'bjfdreoz'},
    {:id => 5, :source => "glowing.mp3",:title => '楽曲タイトルE', :audio_image => "audio.png",:lyrics => "木造アパートの一階で・・・",:group_id => 1,:public_uid=>'yomkfmch'}
  ]
end