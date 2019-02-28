module Mutations
  class UpdateBoardList < GraphQL::Schema::Mutation
    null false

    argument :id, ID, required: true
    argument :name, String, required: true

    field :board_list, Types::BoardListType, null: false

    def resolve(**arg)

      board_list = BoardList.find(arg[:id])

      if board_list.update(name: arg[:name])
        {
            board_list: board_list
        }
      else
        raise GraphQL::ExecutionError, board_list.errors.full_messages.join(", ")
      end

    end

  end

end
