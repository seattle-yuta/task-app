class Types::SearchInputType < GraphQL::Schema::InputObject
  graphql_name "SearchInputType"
  description "All the attributes for creating an author"

  argument :id, ID, required: false
  argument :name, String, required: false, camelize: false
  argument :display_order, Boolean, required: false, camelize: false
  argument :detail, String, required: false
end