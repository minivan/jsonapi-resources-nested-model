require 'rails_helper'

RSpec.describe 'API requests to contacts', type: :request do
  describe 'GET show' do
    let!(:contact) { Contact.create(name: "Test Contact") }

    it 'returns the contact' do
      get "/api/v1/contacts/#{contact.id}"

      expect(response).to have_http_status(:ok)
      object = JSON.parse(response.body)["data"]
      expect(object.dig("attributes", "name")).to eq("Test Contact")
    end
  end
end
