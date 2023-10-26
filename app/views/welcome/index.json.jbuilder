# app/views/welcome/index.json.jbuilder

json.topics @topics do |topic|
  json.id topic.id
  json.titulo topic.titulo
end

json.posts @posts do |post|
  json.id post.id
  json.user_name post.user.name
  json.body post.body
end

json.users @random_users do |user|
  json.id user.id
  json.name user.name
  json.profile_image_url user.profile_image_url if user.profile_image.attached?
end
