module Types
  class MutationType < GraphQL::Schema::Object
    field :createCard, mutation: Mutations::CreateCard
    field :update_board_list, mutation: Mutations::UpdateBoardList
    field :create_board_list, mutation: Mutations::CreateBoardList
    field :create_project, mutation: Mutations::CreateProject
  end

end
