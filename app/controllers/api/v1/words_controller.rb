class Api::V1::WordsController < Api::V1::BaseController
  def index
    render json: Word.all
  end
end
