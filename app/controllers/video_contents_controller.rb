class VideoContentsController < ApplicationController

  def new
    @video_content = VideoContent.new
  end

  def create
    @video_content = VideoContent.new(video_content_params)

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
