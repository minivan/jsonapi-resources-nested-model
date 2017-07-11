require 'rails_helper'

RSpec.describe 'API requests to contacts', type: :request do
  describe 'GET show' do
    let!(:contact) { Contact.create(name: "Test Contact") }
    let!(:address) { Address.create(contact: contact, zipcode: "2132WT") }

    it 'returns the contact' do
      get "/api/v1/contacts/#{contact.id}"

      expect(response).to have_http_status(:ok)
      object = JSON.parse(response.body)["data"]
      expect(object.dig("attributes", "name")).to eq("Test Contact")
      expect(object.dig("attributes", "address", "zipcode")).to eq("2132WT")
    end
  end

  describe 'POST create' do
    it 'creates the new contact' do
      new_contact_data = {
        type: :contacts,
        attributes: {
          name: "POST testing contact",
          address: {
            "zipcode": "2132WA"
          }
        }
      }

      expect {
        post '/api/v1/contacts/', params: { data: new_contact_data }.to_json,
          headers: { 'Accept' => JSONAPI::MEDIA_TYPE, 'CONTENT_TYPE' => JSONAPI::MEDIA_TYPE }
      }.to change {
        Contact.count + Address.count
      }.by(2)

      expect(Address.last.zipcode).to eq("2132WA")
      expect(Address.last.contact).to eq(Contact.last)
    end
  end
end
