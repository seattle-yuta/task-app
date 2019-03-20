module ObjectTypes
  class SearchType < Types::BaseObject
    field :name, String, null: true
    field :display_order, Boolean, null: true
    field :detail, String, null: true
  end

end
