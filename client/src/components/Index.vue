<template>
  <div class="container">
    <div class="sidebar">
      <h2 class="sidebar-title">Assuntos em alta</h2>
      <ul class="topic-list">     
        <li class="topic-item" v-for="topic in topics" :key="topic.id">
          <router-link :to="`/topics/${topic.id}`">{{ topic.titulo }}</router-link>
        </li>
      </ul>
    </div>      

    <div class="main-content">
      <h1>Posts</h1>
      <button class="btn" @click="createPost">Criar post</button>      
      <div v-for="post in posts" :key="post.id">        
        <div class="post-box">
          <p class="post-user">@ {{ post.user.name }}</p>
          <router-link :to="{ name: 'post-details', params: { id: post.id } }">
            <p class="post-body no-link-style">{{ post.body }}</p>
          </router-link>
        </div>        
      </div>
    </div>  
    
    <div class="sidebar">
      <h2 class="sidebar-title">Quem Seguir</h2>
      <ul class="topic-list">
        <li v-for="user in mockUsers" :key="user.id">
          <img v-if="user.profile_image_url" :src="user.profile_image_url" class="profile-image" />
          <span class="username">@{{ user.name }}</span>
        </li>
      </ul>
    </div>
  </div>
</template>


<script lang="ts">
import Topics from './Topics.vue';
import Posts from './Posts.vue';

import api from '../http.ts'

export default {
  components: {
    Topics,
    Posts,
 
  },
  data() {
    return {      
      topics: [],
      posts: [],
      mockUsers: [
        {
          id: 1,
          name: 'julinha',
          profile_image_url: '/public/imgs/1.jpg',
        },
        {
          id: 2,
          name: 'joao555',
          profile_image_url: '/public/imgs/1.jpg',
        },
        {
          id: 3,
          name: 'stella',
          profile_image_url: '/public/imgs/MicrosoftTeams-image (16).png',
        },
        {
          id: 4,
          name: 'joaninha',
          profile_image_url: '/public/imgs/1.jpg',
        },

      ],
    };
  },
  methods: {
    
    async loadTopics() {
      try {
        const response = await api.get('/topics');
        this.topics = response.data; 
      } catch (error) {
        console.error('Erro ao carregar tópicos:', error);
      }
    },
    async loadPosts() {     
      try {
        const response = await api.get('/posts'); 
        this.posts = response.data; 
      } catch (error) {
        console.error('Erro ao carregar posts:', error);
      }
    },    
  },
  mounted() {
    this.loadTopics(); 
    this.loadPosts();     
  },
};
</script>


<style scoped>
@import '../style.css'
</style>
