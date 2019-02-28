module Mutations
  class CreateCard < GraphQL::Schema::Mutation
    null false

    argument :name, String, required: true
    argument :board_list, ID, required: true

    field :card, Types::CardType, null: false

    def resolve(**arg)
      card = Card.new(name: arg[:name], board_list_id: arg[:board_list], display_order: 1)

      if card.save
        {
            card: card
        }
      else
        raise GraphQL::ExecutionError, card.errors.full_messages.join(", ")
      end

    end
  end
end
