module Types
  class MutationType < Types::BaseObject
    field :deleteProject, mutation: Mutations::DeleteProject
    field :updateProject, mutation: Mutations::UpdateProject
    field :create_project, mutation: Mutations::CreateProject
  end

end
