module Types
  class MutationType < GraphQL::Schema::Object
    field :createCard, mutation: Mutations::CreateCard
    field :update_board_list, mutation: Mutations::UpdateBoardList
    field :create_board_list, mutation: Mutations::CreateBoardList
    field :create_project, mutation: Mutations::CreateProject

    field :search_cards, [Types::CardType], null: true do
      argument :query, Types::SearchInputType, required: true
    end

    def search_cards(query:)
      Card.search_cards(query.to_h)
    end

  end

end
