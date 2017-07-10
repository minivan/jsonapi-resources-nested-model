require 'rails_helper'

RSpec.describe 'A health API request', type: :request do
  it 'returns a JSON with the health information' do
    headers = { "ACCEPT" => "application/json" }

    get '/api/v1/health', headers: headers

    expect(response).to have_http_status(:ok)
  end
end
