class Api::V1::YoutubeVideosController < Api::V1::BaseController
  def index
    render json: YoutubeVideo.all
  end

  def destroy
    YoutubeVideo.destroy(params[:id])
    head :ok
  end
end
