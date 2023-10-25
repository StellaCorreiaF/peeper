class Post < ApplicationRecord
  has_many :comments
  belongs_to :user
  belongs_to :topic, optional: true

  after_create :associate_with_topics
  
  def associate_with_topics
    words = body.downcase.split(/\W+/)  # Coleta todas as palavras do post

    words.each do |word|
      # Verifica se a palavra corresponde a um tópico existente
      topic = Topic.find_by(titulo: word)

      if topic
        # Associa o post ao tópico e para a busca após a primeira correspondência
        self.topic = topic
        save
        break
      end
    end
  end  
end



  
