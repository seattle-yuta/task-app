json.set! :cards do
  json.array! @cards do |card|
    json.extract! card, :id, :name, :start_deadline, :end_deadline, :board_list_id, :created_at, :updated_at
  end
end