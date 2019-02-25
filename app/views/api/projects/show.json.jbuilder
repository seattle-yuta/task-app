json.set! :project do
  json.extract! @project, :id, :name, :created_at, :updated_at
end