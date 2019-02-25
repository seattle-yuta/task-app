json.set! :projects do
  json.array! @projects do |project|
    json.extract! project, :id, :name, :created_at, :updated_at
  end
end