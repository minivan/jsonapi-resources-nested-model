class Api::V1::ContactResource < JSONAPI::Resource
  immutable

  attributes :name
end
