class TopicsController < ApplicationController
	before_action :set_topic, only: %i[ show edit update destroy ]
	def index
		@topics = Topic.all
	end

	def show
		set_topic
	end
	 
	def new 
		@topic = Topic.new
	end

	def edit
		set_topic
	end

	def create
    # topico_params = params.require(:topico).permit(:titulo)  - substituimos pelo metodo params
    @topic = Topic.new(topic_params)
    
    respond_to do |format|
      if @topic.save
        format.html { redirect_to topic_url(@topic), notice: "Topico was successfully created." }
        
      else
        format.html { render :new, status: :unprocessable_entity }
        
      end
    end
  end

  def update
    set_topic
    # topico_params = params.require(:topico).permit(:titulo)  - substituimos pelo metodo params sendo usado como parametro no if

    if @topic.update(topic_params)
      # O flash permite empurrar alguns primitivos do ruby até a proxima action q será executada(string, array e hash..)
      # e aí posso guardar dentro uma msg de sucesso pro usuario. Depois usamos lá na view

      redirect_to topic_url(@topic), notice:"Tópico atualizado!"
    else
      render :edit, status: :unprocessable_entity
    end
  end

  def destroy
    @topic.destroy
    redirect_to topics_url, notice: "Tópico Removido"
  end


	private 

	def set_topic
		@topic = Topic.find(params[:id])
	end

	def topic_params 
		params.require(:topic).permit(:titulo)
	end
end
