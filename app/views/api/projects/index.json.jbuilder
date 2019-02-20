json.set! :projects do
  json.array! @projects do |project|
    json.extract! project, :id, :name, :display_order, :created_at, :updated_at
  end
end