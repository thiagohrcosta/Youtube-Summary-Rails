class PagesController < ApplicationController
  def index
    @last_videos = VideoContent.all.map do |video|
      video_id = extract_youtube_id(video.url)
      {
        id: video_id,
        title: video.title,
        content: video.content
      }
    end
  end

  private

  def extract_youtube_id(url)
    regex = /(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/
    match = url.match(regex)
    match[1] if match
  end
end
