# What is this?

This is an experiment to expose two database models via the same JSON-API Resource via [jsonapi-resources](https://github.com/cerebris/jsonapi-resources)


# How does it work?



# Where do I look?

    app/resources/api/v1/contact_resource.rb
    spec/request/contacts_spec.rb

# Why did you do this?

It's a bit unclear how to do this from the official documentation. Also, JSON API the spec [doesn't easily support nested objects](https://github.com/json-api/json-api/issues/1089)
