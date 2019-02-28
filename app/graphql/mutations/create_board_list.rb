module Mutations
  class CreateBoardList < GraphQL::Schema::Mutation
    null false

    argument :name, String, required: true
    argument :project, ID, 'プロジェクトのID', required: true

    field :board_list, Types::BoardListType, null: false

    def resolve(**arg)
      board_list = BoardList.new(name: arg[:name], project_id: arg[:project], display_order: 1)

      if board_list.save
        {
            board_list: board_list
        }
      else
        raise GraphQL::ExecutionError, board_list.errors.full_messages.join(", ")
      end

    end
  end
end
