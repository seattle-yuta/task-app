module Types
  class BoardListType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :display_order, Integer, null: true


  end
end
