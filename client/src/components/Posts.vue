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
	New Post:
	<div>
		Body: <textarea v-model="body" /><br />
		<button @click="createPost">Create Post</button>
	</div>
	<h1>Posts</h1>
	<div v-for="post in posts">
		<div>		
		<div>{{ post.body }}</div>
		</div>
	</div>
 </template>