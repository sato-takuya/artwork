module ApplicationHelper

  def get_twitter_card_info(group,audio)
    twitter_card = {}
    if group.nil? && audio.nil?#トップページver
      twitter_card[:url] = "https://www.fogsound.net/"
      twitter_card[:image] = "https://art-wk.s3-ap-northeast-1.amazonaws.com/images/twitter-logo.png"
      twitter_card[:description] = "バンド・ミュージシャンのためのポートフォリオサイト"
      twitter_card[:title] = "fogsound"
    elsif group.present? && audio.nil?#グループver
      twitter_card[:url] = "https://www.fogsound.net/#{group.nickname}"
      twitter_card[:image] = group.icon_image.to_s
      twitter_card[:description] = group.name
      twitter_card[:title] = "fogsound"
    else#オーディオver
      twitter_card[:url] = "https://www.fogsound.net/#{audio.public_uid}"
      twitter_card[:image] = audio.audio_image.to_s
      twitter_card[:description] = audio.audio_title
      twitter_card[:title] = "fogsound"
  end
    twitter_card[:card] = 'summary_large_image'
    twitter_card
  end

  def movie(youtube_url)
    iframe = content_tag(
      :iframe,
      '', # empty body
      #width: 400,
      #height: 350,
      src: youtube_url,
      frameborder: 0,
      allowfullscreen: true
    )
    content_tag(:div, iframe, class: 'youtube-container')
  end

  def embed_link(link)
    str = link.gsub(" ", "")
    url = str[35, 41]
    #str = str.gsub!("watch?v=","embed/")
  end

  def embed_image(link)
    tr = link.gsub(" ", "")
    url = tr[35, 41]
    nomal_link = url.gsub!("embed/","watch?v=")#一旦普通のURLに戻す
    movie_id_v= nomal_link.match(/\?v=([^&]+)/)#普通のURLから動画ID＋v=を探す
    str = movie_id_v.to_s
    id = str.delete("?v=")

    image_url = "http://img.youtube.com/vi/#{id}/sddefault.jpg"
  end
end
