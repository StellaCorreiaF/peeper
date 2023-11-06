# Crie usuários
user1 = User.create(name: 'stella', email: 'tes@teste.com', password: '123456', password_confirmation: '123456')
user2 = User.create(name: 'joao', email: 'teste2@teste.com', password: '123456', password_confirmation: '123456')




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


# criar tópicos
topic_titles = [
  "negocios", "calor", "frio", "clima",  "casa", "saude", "musica", "iphone", "esportes", "tecnologia", "viagens",
  "alimentacao", "carros", "filmes", "fotografia", "moda", "ciencia", "educacao", "trabalho",
  "arte", "jogos", "animais", "natureza", "historia", "literatura", "culinaria", "politica",
  "economia", "religiao", "saude", "fitness", "bemestar", "amigos", "familia", "diversao",
  "programacao", "redes sociais", "livros", "series", "teatro", "danca", "ciencias ociais", "astronomia"
]

# Cria 40 tópicos diferentes
topic_titles.first(40).each do |title|
  Topic.create(titulo: title)
end

