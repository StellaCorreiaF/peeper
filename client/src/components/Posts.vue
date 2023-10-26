<script lang="ts">
import {defineComponent} from 'vue'
import api from '../http.ts'

export default defineComponent({
 	data() {
		return {
			posts: [],
			
			body: String,
 		}
 	},
 	methods: {
		async loadPosts() {
			const response = await api.get("/posts")
			this.posts = response.data
		},
		async loadPostDetails(postId) {
    try {
      const response = await api.get(`/posts/${postId}`);
      // Faça algo com os detalhes do post, se necessário
    } catch (error) {
      console.error('Erro ao carregar detalhes do post:', error);
    }
  },
		clearForm() {			
			this.body = ""
		},
		async createPost() {
			await api.post("/posts", {body: this.body})
			this.clearForm()
			this.loadPosts()
		}
 	},
		async mounted() {
			this.clearForm()
			await this.loadPosts()
		},
})
</script>

<template>	
	<h1>Posts</h1>
	<div v-for="post in posts" :key="post.id">
  <div>
    <div>
      @{{ post.user.name }}: 
      {{ post.body }}
    </div>
    <router-link :to="{ name: 'post-details', params: { id: post.id } }">
      Ver detalhes
    </router-link>
  </div>
</div>
</template>


<style scoped>

@import '../style.css'


</style>
