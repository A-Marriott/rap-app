class Api::V1::YoutubeVideosController < Api::V1::BaseController
  def index
    @videos = YoutubeVideo.all
    render json: @videos
  end
end
