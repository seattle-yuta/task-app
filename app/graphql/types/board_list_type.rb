module Types
  class BoardListType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :display_order, Integer, null: true
    field :project, Types::ProjectType, null: false
    field :cards, Types::CardType.connection_type, null: true
  end
end
