module Mutations
  class CreateProject < GraphQL::Schema::Mutation
    null false

    argument :name, String, required: true

    field :project, Types::ProjectType, null: false

    def resolve(**arg)
      project = Project.new(name: arg[:name], user_id: 1, display_order: 1)

      if project.save
        {
            project: project
        }
      else
        raise GraphQL::ExecutionError, project.errors.full_messages.join(", ")
      end

    end

  end
end