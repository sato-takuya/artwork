module ApplicationHelper
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
    str = link
    #str = str.gsub!("watch?v=","embed/")
  end

  def embed_image(link)
    nomal_link = link.gsub!("embed/","watch?v=")#一旦普通のURLに戻す
    movie_id_v= nomal_link.match(/\?v=([^&]+)/)#普通のURLから動画ID＋v=を探す
    str = movie_id_v.to_s
    id = str.delete("?v=")

    image_url = "http://img.youtube.com/vi/#{id}/mqdefault.jpg"
  end
end
