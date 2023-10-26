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
		Titulo: <textarea v-model="titulo" /><br />
		<button @click="createTopic">Create Topic</button>
	</div>
	<h1>Topics</h1>
	<div v-for="topic in topics">
		<div>		
		<div>{{ topic.titulo }}</div>
		</div>
	</div>
</template>

<style scoped>
/* Estilos específicos para o componente WelcomePage.vue */
</style>