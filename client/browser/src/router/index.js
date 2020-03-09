import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '',
      name: 'Home',
      component: () => import('@/views/Home')
    },
    {
      path: '/note',
      name: 'Note',
      component: () => import('@/views/Note')
    },
    {
      path: '/editor',
      name: 'Editor',
      component: () => import('@/components/Editor')
    },
    {
      path: '/previewer',
      name: 'Previewer',
      component: () => import('@/components/Previewer')
    },
    {
      path: '/sidebar',
      name: 'Sidebar',
      component: () => import('@/components/Sidebar')
    }
  ]
})
