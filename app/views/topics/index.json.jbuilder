# posts/index.json.jbuilder
json.array! @topics do |topic|
  json.extract! topic, :id, :titulo, :created_at, :updated_at
 
  json.url topic_url(topic, format: :json)
end

