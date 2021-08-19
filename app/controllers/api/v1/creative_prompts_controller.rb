class Api::V1::CreativePromptsController < Api::V1::BaseController
  def index
    render json: CreativePrompt.all
  end
end
