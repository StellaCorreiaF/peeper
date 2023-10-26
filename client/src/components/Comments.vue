<script lang="ts">
import { defineComponent } from 'vue'
import api from '../http.ts'

export default defineComponent({
  data() {
    return {
      comments: [],
      posts: [], 
      selectedPost: null,
      body: '',
    }
  },
  methods: {
    async loadComments() {
      const response = await api.get("/comments")
      this.comments = response.data
    },
    async loadPosts() {
      const response = await api.get("/posts")
      this.posts = response.data
    },
    clearForm() {
      this.body = ""
      this.selectedPost = null
    },
    async createComment() {
      if (this.selectedPost !== null && this.body.trim() !== '') {
        await api.post("/comments", {
          body: this.body,
          post_id: this.selectedPost,
        })
        this.clearForm()
        this.loadComments()
      }
    }
  },
  async mounted() {
    this.clearForm()
    await this.loadComments()
    await this.loadPosts()
  },
})
</script>

<template>
  <div>    
    <div>
      Body: <textarea v-model="body" /><br />
      <button @click="createComment">Create Comment</button>
    </div>
    <h1>Comments</h1>
    <div v-for="comment in comments" :key="comment.id">
      <div>
        <div> @{{ comment.post.user.name }} postou:  </div>
        <div>{{ comment.post.body }}</div>
        <div>@{{ comment.user.name }} comentou: </div>
        <div>{{ comment.body }}</div>
      </div>
    </div>
  </div>
</template>


<style scoped>
@import '../style.css'
</style>
