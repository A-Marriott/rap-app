class Api::V1::YoutubeVideosController < Api::V1::BaseController
  def index
    render json: YoutubeVideo.all
  end
end
