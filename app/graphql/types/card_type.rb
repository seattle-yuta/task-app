module Types
  class CardType < Types::BaseObject
    field :id, ID, null: false
    field :name, String, null: false
    field :display_order, Integer, null: true
    field :detail, String, null: false
    field :start_deadline, Types::DateTimeType, null: true
    field :end_deadline, Types::DateTimeType, null: true
    field :board_list, Types::BoardListType, null: false

  end
end
