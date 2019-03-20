module Types
  class QueryType < GraphQL::Schema::Object
    # Add root-level fields here.
    # They will be entry points for queries on your schema.

    field :all_projects, [ProjectType], null: false
    field :all_board_lists, [BoardListType], null: false do
      argument :project, ID, 'プロジェクトのID', required: true
    end
    field :search_cards, [ProjectType], null: false do
      argument :name, String, 'カードの名前', required: true
      argument :display_order, Boolean, 'フラグ', required: true
      argument :detail, String, 'detail', required: true
    end

    def all_board_lists(project:)
      BoardList.where(project_id: project)
    end

    def search_cards(name:, display_order:, detail:)
      Card.search_card(name, display_order, detail)
    end

    def all_projects
      Project.all
    end

  end
end
