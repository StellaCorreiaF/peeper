# comments/index.json.jbuilder
json.array! @comments do |comment|
  json.id comment.id
  json.body comment.body
  json.created_at comment.created_at
  json.updated_at comment.updated_at
  json.post do
    json.id comment.post.id
    json.user do
      json.id comment.post.user.id
      json.name comment.post.user.name
    end
    json.body comment.post.body
    # Outras informações relevantes sobre o post
  end
  json.user do
    json.id comment.user.id
    json.name comment.user.name
  end
end
