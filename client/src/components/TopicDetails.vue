<template>   
  <div class="topic-container">  

    <h4>As pessoas estão comentando</h4>
    <div class="topic-actions">
      <router-link to="/" class="btn">Voltar</router-link>
    </div>
    <div v-if="topic">      
      <p >{{ topic.titulo }}: </p>
      
			<div id="posts" v-for="post in posts" :key="post.id">
				<p class="post-user">@{{ post.user.name }}</p>
        <p class="post-body">{{ post.body }}</p>
        <hr>
			</div>      
    </div>    
  </div>
</template>

<script>
import { defineComponent } from 'vue';
import api from '../http.ts';

export default defineComponent({
  data() {
    return {
      topic: null,
      posts: [],
    };
  },
  async created() {
    const topicId = this.$route.params.id;
    await this.loadTopicDetails(topicId);
  },
  methods: {
    async loadTopicDetails(topicId) {
      try {
        const response = await api.get(`/topics/${topicId}`);
        this.topic = response.data;
        this.loadPosts(topicId); 
      } catch (error) {
        console.error('Erro ao carregar detalhes do topic:', error);
      }
    },
    async loadPosts(topicId) {
      try {
        const response = await api.get(`/posts?topic_id=${topicId}`);
        this.posts = response.data;
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
