import { RouteRecordRaw, createRouter, createWebHistory } from 'vue-router'
import Index from './components/Index.vue'
import Posts from './components/Posts.vue'
import Topics from './components/Topics.vue'
import Comments from './components/Comments.vue'
const routes: Array<RouteRecordRaw> = [
 {
		path: '/',
		name: 'index',
		component: Index
 }, 
 {
		path: '/posts',
		name: 'posts',
		component: Posts
	},
	{
		path: '/topics',
		name: 'topics',
		component: Topics
	},
	{
		path: '/comments',
		name: 'comments',
		component: Comments
	}

]
const router = createRouter({
	history: createWebHistory(),
 	routes
})
export default router