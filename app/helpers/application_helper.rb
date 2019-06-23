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
    str = str.gsub!("watch?v=","embed/")
  end

  def embed_image(link)
    mach = link.match(/\?v=([^&]+)/)
    mach_s = mach.to_s
    id = mach_s.delete("?v=")

    image_url = "http://img.youtube.com/vi/#{id}/mqdefault.jpg"
  end
end
