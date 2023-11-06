# posts/index.json.jbuilder
json.array! @posts do |post|
  json.extract! post, :id, :body, :created_at, :updated_at, :user_id
  json.user do
    json.name post.user.name
  end
  json.url post_url(post, format: :json)
end

