json.set! :board_lists do
  json.array! @board_lists do |board_list|
    json.extract! board_list, :id, :project_id, :name, :created_at, :updated_at
  end
end