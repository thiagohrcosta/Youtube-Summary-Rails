class VideoContentsController < ApplicationController

  def new
    @video_content = VideoContent.new
  end

  def create
    @video_content = VideoContent.new(video_content_params)

    content = nil
    
    if params[:video_content][:transcription_file].present?
      transcription_file = params[:video_content][:transcription_file]
      transcription_content = transcription_file.read
      
      binding.pry

      content = OpenaiJob.perform_later(@video_content.id, transcription_content)
    end

    binding.pry
    if @video_content.save
      redirect_to @video_content, notice: 'Video content was successfully created.'
    else
      render :new
    end
  end

  private

  def set_video_content
    @video_content = VideoContent.find(params[:id])
  end

  def video_content_params
    params.require(:video_content).permit(:title, :cover, :content, :url, :user_id)
  end
end
