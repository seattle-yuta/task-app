json.set! :project do
  json.extract! @project, :id, :name, :display_order, :created_at, :updated_at
end