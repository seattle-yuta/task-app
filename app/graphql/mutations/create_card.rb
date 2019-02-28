module Mutations
  class CreateCard < GraphQL::Schema::RelayClassicMutation
    null false

    argument :name, String, required: true

    field :board_list, Types::BoardListType, null: false

    def resolve(**arg)
      card = Card.new(name: arg[:name], board_list_id: arg[:board_list], display_order: 1)

      if project.save
        {
            card: card
        }
      else
        raise GraphQL::ExecutionError, project.errors.full_messages.join(", ")
      end

    end
  end
end
