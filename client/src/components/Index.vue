<template>
  <div class="container">  
    <div class="sidebar">
      <h2 class="sidebar-title">Assuntos em alta</h2>
      <ul class="topic-list">
        <li class="topic-item" v-for="topic in topics" :key="topic.id">
          <router-link :to="`/topic/${topic.id}`" class="topic-link">{{ topic.titulo }}</router-link>
        </li>
      </ul>
    </div>

    <div class="main-content">
      <h1>Posts</h1>
      <button class="btn" @click="createPost">Criar post</button>
      <div v-for="post in posts" :key="post.id" @click="redirectToPost(post.id)">
        <div class="post-box">
          <p class="post-user">@{{ post.user_name }}</p>
          <p class="post-body">{{ post.body }}</p>
        </div>
      </div>
    </div>
    
    <div class="sidebar right-sidebar">
      <h2 class="sidebar-title">Quem Seguir</h2>
      <ul class="topic-list">
        <li class="topic-item" v-for="user in users" :key="user.id">
          <router-link :to="`/user/${user.id}`">
            <img v-if="user.profile_image_url" :src="user.profile_image_url" class="profile-image" />
            <span class="username">@{{ user.name }}</span>
          </router-link>
        </li>
      </ul>
    </div>
  </div>
</template>


<script>
export default {
  data() {
    return {
      posts: [],
      topics: [],
      users: [],
    };
  },
  methods: {
    createPost() {
      // Lógica para criar um novo post (se necessário)
    },
    redirectToPost(postId) {
      // Lógica para redirecionar para a página de um post específico (se necessário)
    },
  },
  mounted() {
    // Faça uma solicitação à sua API para obter os dados da página inicial
    // Atualize as propriedades posts, topics e users com os dados obtidos
  },
};
</script>

<style scoped>
/* Estilo para o corpo da página */
/* Estilos para o cabeçalho */
header {
  background-color: #1DA1F2;
  color: #fff;
  text-align: center;
  padding: 20px 0;
}

.header-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  max-width: 1200px;
  margin: 0 auto;
}

.header-links {
  display: flex;
  align-items: center;
}

.header-links a {
  color: #fff;
  text-decoration: none;
  margin-left: 20px;
}


body {
  font-family: Arial, sans-serif;
  background-color: #f5f5f5;
  margin: 0;
  padding: 0;
}

/* Estilos gerais para o contêiner */
.container {
  display: flex;
  justify-content: flex-start;
  align-items: flex-start;
  max-width: 1400px;     
  margin: 0 auto;
  padding: 20px;
}

/* Estilos para o conteúdo principal */
.main-content {
  flex: 2;
  max-width: 800px;
  background-color: #fff;
  border: 1px solid #e1e8ed;
  padding: 10px;
  border-radius: 5px;
}

h1 {
  font-size: 20px; /* Ajuste o tamanho da fonte do título dos posts conforme necessário */
  margin: 10px 0; /* Espaçamento superior e inferior do título */
  color: #333; /* Cor do título dos posts */
}

.notice {
  color: green;
}

h4 {
  margin-top: 20px;
}

/* Estilos para a barra lateral */
.sidebar {
  flex: 1;
  max-width: 250px;
  height: 1200px;
  background-color: #fff;
  border: 1px solid #e1e8ed;
  padding: 10px;
  border-radius: 5px; 
}

/* .sidebar {
  width: 250px;
  background-color: #f0f0f0;
  padding: 20px;
  border: 1px solid #ccc;
  border-radius: 5px;
} */

.right-sidebar {
  flex: 1;
  max-width: 250px;
  height: 100%;
  background-color: #fff;
  border: 1px solid #e1e8ed;
  padding: 10px;
  border-radius: 5px;
  /* Adicione estilos específicos para a barra lateral direita aqui */
}

.sidebar-title {  
  font-size: 20px;
  font-weight: bold;
  margin-bottom: 10px;
  color: #333;
}

.topic-list {
  list-style: none;
  padding: 0;
}

.topic-item {
  margin-bottom: 10px;
}

.topic-link {
  text-decoration: none;
  color: #1DA1F2;
  font-weight: bold;
  transition: color 0.2s;
}

.topic-link:hover {
  color: #0F7FCE;
}

.topic-header {
  background-color: #1DA1F2;
  padding: 10px;
  color: #fff;
  border-radius: 5px 5px 0 0;
}

.topic-title {
  font-size: 24px;
  font-weight: bold;
  margin: 0;
}

.topic-container {
  width: 500px;
  margin: 0 auto;
  padding: 20px;
  border: 1px solid #ccc;
  background-color: #fff;
  box-shadow: 0 0 10px rgba(0, 0, 0, 0.1);
}

.topic-actions {
  margin-top: 10px;
}

.post {
  background-color: #f9f9f9;
  border: 1px solid #ccc;
  padding: 10px;
  margin-top: 10px;
}

.post-box {
  background-color: #fff;
  padding: 10px;
  margin: 10px 0; /* Espaçamento entre os posts */
  border: 1px solid #e1e8ed;
  border-radius: 5px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1); /* Sombra suave nos posts */
}

.post-body {
  color: #333; /* Cor do corpo dos posts */
}

/* Estilo para o link "Ver post" */
.post-link {
  color: #1DA1F2; /* Cor do link */
  text-decoration: none;
  display: block;
  margin: 10px 0; /* Espaçamento entre os links */
}




/* Estilos para os botões de ação do post */
/* Estilos para o menu de ações */
.post-actions {
  margin-top: 10px;
}

.post-menu {
  display: inline-block;
  position: relative;
}

.post-menu-icon {
  cursor: pointer;
  right: 0; 
}

.post-menu-options {
  display: none;
  position: absolute;
  background-color: #fff;
  border: 1px solid #ccc;
  border-radius: 5px;
  padding: 10px;
  box-shadow: 0 2px 4px rgba(0, 0, 0, 0.1);
  z-index: 1;
  right: 0; /* Alinha o menu à direita */
  top: 100%; /* Posiciona o menu abaixo do ícone */
}

.post-menu:hover .post-menu-options {
  display: block;
}


.comments {
  border: 1px solid #ccc;
  padding: 10px;
  border-radius: 5px;
  background-color: #fff;
}

.comment {
  margin: 10px 0;
}

.comment-user {
  font-weight: bold;
}

.comment-body {
  color: #333;
}

.btn {
  background-color: #007bff;
  color: #fff;
  border: none;
  border-radius: 5px;
  padding: 10px 20px;
  text-align: center;
  text-decoration: none;
  display: inline-block;
  font-size: 16px;
  margin: 4px 2px;
  cursor: pointer;
}
.btn-primary {
  background-color: #007bff;
  color: #fff; 
  font-size: 14px;
  padding: 10px 5px; ;
}

.btn-info {
  background-color: #17a2b8;
  color: #fff;
}

.btn-secondary {
  background-color: #6c757d;
  color: #fff;
}

.btn:hover {
  background-color: #0F7FCE;
}

.btn-danger {
  background-color: #FF4500;
}


.create-post-button {
  text-align: right;
  margin-top: 10px;
}

/* Estilos para o rodapé */
footer {
  background-color: #1DA1F2; /* Cor de fundo igual ao cabeçalho */
  color: #fff; /* Cor do texto igual ao cabeçalho */
  text-align: center;
  padding: 20px 0;
}

.footer-content {
  max-width: 1200px;
  margin: 0 auto;
}

/* Estilos para o texto do rodapé */
.footer-content p {
  margin: 10px 0;
}

/* Estilos para o símbolo de marca registrada */
.footer-content p::after {
  content: "®";
  color: #fff; /* Cor igual ao cabeçalho */
  margin-left: 5px;
  font-size: 14px; /* Ajuste o tamanho do símbolo conforme necessário */
}


header {
  background-color: #1DA1F2;
  color: #fff;
  text-align: center;
  padding: 20px 0;
}

.header-content {
  display: flex;
  justify-content: space-between;
  align-items: center;
  max-width: 1200px;
  margin: 0 auto;
}

.header-links {
  display: flex;
  align-items: center;
}

.header-links a {
  color: #fff;
  text-decoration: none;
  margin-left: 20px;
}

.logo-image {
  width: 60px; /* Tamanho desejado */
  height: 60px; /* Tamanho desejado */
  border-radius: 50%; /* Isso tornará a imagem redonda */
  object-fit: cover; /* Garante que a imagem se ajuste ao espaço especificado */
}

.logo-text {
  font-family: 'Helvetica Neue', sans-serif;
  font-size: 1.5rem;
  margin-left: 10px;
  vertical-align: middle;
}

.profile-image {
  width: 40px; /* Tamanho desejado */
  height: 40px; /* Tamanho desejado */
  border-radius: 50%; /* Isso tornará a imagem redonda */
  object-fit: cover; /* Garante que a imagem se ajuste ao espaço especificado */
}

.username {
  font-weight: bold; /* Adiciona negrito ao nome de usuário */
  color: #007bff; /* Define a cor do texto para azul (pode ajustar conforme desejado) */
}

</style>
