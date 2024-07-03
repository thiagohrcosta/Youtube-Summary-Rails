class VideoContentsController < ApplicationController
  skip_before_action :authenticate_user!, only: :index

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

  def set_video_content
    @video_content = VideoContent.find(params[:id])
  end

  def video_content_params
    params.require(:video_content).permit(:title, :cover, :content, :url, :user_id)
  end
end
