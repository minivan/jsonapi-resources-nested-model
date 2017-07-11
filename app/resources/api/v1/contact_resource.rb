class Api::V1::ContactResource < JSONAPI::Resource
  ADDRESS_KEYS = %i(id street housenumber zipcode)

  attributes :name, :address

  def address
    @model.address.as_json(only: ADDRESS_KEYS)
  end

  def address=(new_address_hash)
    permitted_address_hash = new_address_hash.permit(ADDRESS_KEYS)
    @model.build_address(permitted_address_hash)
  end
end
