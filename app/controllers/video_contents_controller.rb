class VideoContentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

  def index
    @videos = VideoContent.all.map do |video|
      video_id = extract_youtube_id(video.url)
      {
        id: video_id,
        title: video.title,
        content: video.content
      }
    end
  end

  def new
    @video_content = VideoContent.new
  end

  def create
    @video_content = VideoContent.new(video_content_params)
    @video_content.user_id = current_user.id

    if @video_content.save && params[:video_content][:transcription_file].present?
      transcription_file = params[:video_content][:transcription_file]
      transcription_content = transcription_file.read
      
      OpenaiJob.perform_now(@video_content.id, transcription_content)

      redirect_to @video_content, notice: 'Video content was successfully created.'
    else
      render :new
    end
  end

  def update
  end

  private

  def extract_youtube_id(url)
    regex = /(?:youtube\.com\/(?:[^\/]+\/.+\/|(?:v|e(?:mbed)?)\/|.*[?&]v=)|youtu\.be\/)([^"&?\/\s]{11})/
    match = url.match(regex)
    match[1] if match
  end

  def set_video_content
    @video_content = VideoContent.find(params[:id])
  end

  def video_content_params
    params.require(:video_content).permit(:title, :cover, :content, :url, :user_id)
  end
end
