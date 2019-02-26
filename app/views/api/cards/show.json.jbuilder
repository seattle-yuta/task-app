json.set! :card do
  json.extract! @card, :id, :name, :start_deadline, :end_deadline, :board_list_id, :created_at, :updated_at
end