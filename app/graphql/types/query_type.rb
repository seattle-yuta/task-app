module Types
  class QueryType < Types::BaseObject
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :all_projects, [ProjectType], null: false
    field :all_board_lists, [BoardListType], null: false
    field :create_projects, [ProjectType], null: false

    def all_board_lists(project_id)
      BoardList.where(project_id: project_id)
    end

    def all_projects()
      Project.all
    end

  end
end
