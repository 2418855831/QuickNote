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
      path: '/blogs/:id(\\d+)',
      name: 'BlogsLookup',
      component: () => import('@/views/blogs/Lookup')
    },
    {
      path: '/blogs/editor',
      name: 'BlogsEdit',
      component: () => import('@/views/blogs/Edit')
    }
  ]
})
