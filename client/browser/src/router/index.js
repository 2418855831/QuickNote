import Vue from 'vue'
import Router from 'vue-router'

Vue.use(Router)

export default new Router({
  mode: 'history',
  routes: [
    {
      path: '',
      name: 'Note',
      component: () => import('@/views/Note')
    },
    {
      path: '/editor',
      name: 'Editor',
      component: () => import('@/components/Editor')
    },
    {
      path: '/sidebar',
      name: 'Sidebar',
      component: () => import('@/components/Sidebar')
    }
  ]
})
