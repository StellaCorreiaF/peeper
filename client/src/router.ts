import { RouteRecordRaw, createRouter, createWebHistory } from 'vue-router'
import HelloWorld from './components/HelloWorld.vue'
import Posts from './components/Posts.vue'
const routes: Array<RouteRecordRaw> = [
 {
	path: '/hello',
	name: 'hello',
	component: HelloWorld
 }, 
 {
	path: '/posts',
	name: 'posts',
	component: Posts
	},
]
const router = createRouter({
	history: createWebHistory(),
 	routes
})
export default router