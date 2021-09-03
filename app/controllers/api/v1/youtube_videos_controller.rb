class Api::V1::YoutubeVideosController < Api::V1::BaseController
  def index
    render json: YoutubeVideo.all
  end

  def destroy
    YoutubeVideo.destroy(params[:id])
    head :ok
  end

  def create
    render json: YoutubeVideo.create(youtube_video_params)
  end

  private

  def youtube_video_params
    params.permit(:video_id, :genre)
  end
end
