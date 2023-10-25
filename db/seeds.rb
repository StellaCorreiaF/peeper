# Crie usuários
User.create(name: 'stella', email: 'tes@teste.com', password: '123456')
User.create(name: 'joao', email: 'teste2@teste.com', password: '123456')
	

# Crie posts
user1 = User.find_by(id: 1)
user2 = User.find_by(id: 2)

5.times do
  post = user1.posts.create(    
    body: 'Que Calor!!!!'
  )
  
  3.times do
    post.comments.create(
      body: 'Comentário no Post',
      user: user2
    )
  end
end

5.times do
  post = user2.posts.create(
    body: 'Que frio'
  )
  
  2.times do
    post.comments.create(
      body: 'Outro Comentário no Post',
      user: user1
    )
  end
end