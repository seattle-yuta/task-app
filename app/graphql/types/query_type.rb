module Types
  class QueryType < GraphQL::Schema::Object
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :all_projects, [ProjectType], null: false
    field :all_board_lists, [BoardListType], null: false do
      argument :project, ID, 'プロジェクトのID', required: true
    end

    def all_board_lists(project:)
      BoardList.where(project_id: project)
    end

    def all_projects()
      Project.all
    end

  end
end
