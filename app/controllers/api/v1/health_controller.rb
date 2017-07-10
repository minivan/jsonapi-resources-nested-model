class Api::V1::HealthController < Api::V1::BaseController
  def index
    render json: { api_status: :ok }
  end
end
