module Mutations
  class SearchCardMutation < GraphQL::Schema::RelayClassicMutation
    null true
    field :query, ObjectTypes::SearchType, null: true
    def resolve(query)
      p "==========="
      p query
      p "==========="
      {
          card: {id: "aaa", name: "aaaa"},
          errors: [],
      }
    end

  end
end
