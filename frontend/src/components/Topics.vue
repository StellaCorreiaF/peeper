<script lang="ts">
import {defineComponent} from 'vue'
import api from '../http.ts'

export default defineComponent({
 	data() {
		return {
			topics: [],
			
			titulo: String,
 		}
 	},
 	methods: {
		async loadTopics() {
			const response = await api.get("/topics")
			this.topics = response.data
		},
		clearForm() {			
			this.titulo = ""
		},
		async createTopic() {
			await api.post("/topics", {titulo: this.titulo})
			this.clearForm()
			this.loadTopics()
		}
 	},
		async mounted() {
			this.clearForm()
			await this.loadTopics()
		},
})
</script>

<template>	

	New Topic:
	<div>
	Title: <input v-model="titulo" /><br />
	
	<button @click="createTopic">Create Topic</button>
	</div>

	<h1>As pessoas estão comentando</h1>
	<div v-for="topic in topics" :key="topic.id">
  <div>
    <div>       
      {{ topic.titulo }}
    </div>
    <router-link :to="{ name: 'topic-details', params: { id: topic.id } }">
      Ver detalhes
    </router-link>
  </div>
	</div>

</template>
<style scoped>
@import '../style.css'
</style>
