import Vue from 'vue'
import Router from 'vue-router'
import store from '@/store'

Vue.use(Router)

let router = new Router({
  mode: 'history',
  routes: [
    // test
    {
      path: '/tooltip',
      name: 'Tooltip',
      component: () => import('@/components/Tooltip')
    },
    {
      path: '',
      name: 'Home',
      component: () => import('@/views/Home')
    },
    {
      path: '/resume',
      name: 'Resume',
      component: () => import('@/components/Resume')
    },
    {
      path: '/palette',
      name: 'Palette',
      component: () => import('@/components/Palette')
    },
    // blogs
    {
      path: '/blogs/:id(\\d+)',
      name: 'BlogsLookup',
      component: () => import('@/views/blogs/Lookup')
    },
    {
      path: '/blogs/editor',
      name: 'BlogsEdit',
      component: () => import('@/views/blogs/Edit'),
      meta: { requiresAuth: true }
    },
    // categories
    {
      path: '/categories',
      name: 'Categories',
      component: () => import('@/views/categories/Categories')
    },
    {
      path: '/categories/:name(.+)',
      name: 'Category',
      component: () => import('@/views/categories/Category')
    },
    // users
    {
      path: '/users/login',
      name: 'UsersLogin',
      component: () => import('@/views/users/Login'),
      meta: { requiresUnauth: true }
    },
    // test
    {
      path: '/Navbar',
      name: 'Navbar',
      component: () => import('@/components/Navbar')
    },
    // 404 Not Found
    {
      path: '*',
      name: 'NotFound',
      component: () => import('@/components/NotFound')
    }
  ]
})

router.beforeEach((to, from, next) => {
  if (to.matched.some(r => r.meta.requiresAuth) && !store.state.user.id) {
    // 需要登录后才能访问
    next({
      name: 'UsersLogin',
      params: { wantedRoute: to.fullPath }
    })
  } else if (to.matched.some(r => r.meta.requiresUnauth) && store.state.user.id) {
    // 未登录才能访问
    next({
      path: from.fullPath
    })
  } else {
    next()
  }
})

export default router
