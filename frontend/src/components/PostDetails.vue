<template>
  <div>
    <h1>Detalhes do Post</h1>
    <div class="post-box" v-if="post">
      <p class="post-user">@{{ post.user.name }}:</p>
      <p class="post-body">{{ post.body }}</p>
      <h2>Comentários</h2>
			<div id="comments">
				<ul>
        <li v-for="comment in comments" :key="comment.id">
          <p>@{{ comment.user.name }}: </p>
          <p>{{ comment.body }}</p>
        </li>
      </ul>
			</div>      
    </div>
  </div>
  <router-link :to="`/`">
      <button class="btn"> Voltar </button>
  </router-link>	
</template>

<script>
import { defineComponent } from 'vue';
import api from '../http.ts';

export default defineComponent({
  data() {
    return {
      post: null,
      comments: [],
    };
  },
  async created() {
    const postId = this.$route.params.id;
    await this.loadPostDetails(postId);
  },
  methods: {
    async loadPostDetails(postId) {
      try {
        const response = await api.get(`/posts/${postId}`);
        this.post = response.data;
        this.loadComments(postId); // Carregue os comentários quando os detalhes do post estiverem disponíveis
      } catch (error) {
        console.error('Erro ao carregar detalhes do post:', error);
      }
    },
    async loadComments(postId) {
      try {
        const response = await api.get(`/comments?post_id=${postId}`);
        this.comments = response.data;
      } catch (error) {
        console.error('Erro ao carregar comentários:', error);
      }
    },
  },
});
</script>
<style scoped>
@import '../style.css'
</style>
