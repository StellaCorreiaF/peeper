json.extract! post, :id, :body, :created_at, :updated_at, :user_id
json.user_name post.user.name
json.url post_url(post, format: :json)
