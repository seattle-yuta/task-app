json.set! :board_list do
  json.extract! @board_list, :id, :name, :display_order, :created_at, :updated_at
end