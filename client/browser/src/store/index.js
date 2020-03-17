import Vue from 'vue'
import Vuex from 'vuex'
import axios from 'axios'
import qs from 'qs'

Vue.use(Vuex)

const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
  strict: debug,
  state: {
    user: {
      id: null,
      name: null
    },
    baseURL: 'http://localhost:8000/',
    apiURL: {
      blogs_index: 'api/blogs',
      blogs_create: 'api/blogs/create',
      blogs_save: 'api/blogs/save',
      blogs_incre_views_count: 'api/blogs/incre-views-count',
      blogs_rename: 'api/blogs/rename',
      blogs_delete: 'api/blogs/delete',
      blogs_dirs_index: 'api/blogs/dirs',
      blogs_dirs_create: 'api/blogs/dirs/create',
      blogs_dirs_rename: 'api/blogs/dirs/rename',
      blogs_dirs_delete: 'api/blogs/dirs/delete',
      users_index: 'api/users',
      users_login: 'api/users/login',
      users_logout: 'api/users/logout'
    }
  },
  mutations: {
    login (state, { id, name }) {
      /**
       * 用户登录
       * @param {Object} state
       * @param {Int} id 用户 ID
       * @param {String} name 用户名称
       * @returns
       */
      state.user.id = id
      state.user.name = name
    },
    logout (state) {
      /**
       * 用户注销
       * @param {Object} state
       * @returns
       */
      state.user.id = null
      state.user.name = null
    }
  },
  actions: {
    async login ({ state, commit }, { username, password }) {
      /**
       * 用户登录
       * @param {Object} state
       * @param {Function} commit
       * @param {Int} id 用户 ID
       * @param {String} name 用户名称
       * @returns
       */
      let res = await axios({
        method: 'post',
        url: state.apiURL.users_login,
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        withCredentials: true,
        data: qs.stringify({
          username,
          password
        })
      })
      if (res.status === 200 && !res.data.hasOwnProperty('error')) {
        commit('login', {
          id: res.data.id,
          name: res.data.name
        })
      } else {
        alert('登录失败')
      }
    },
    async logout ({ state, commit }) {
      /**
       * 用户注销
       * @param {Object} state
       * @param {Function} commit
       * @returns
       */
      let res = await axios({
        method: 'post',
        url: state.apiURL.users_logout,
        headers: { 'Content-Type': 'application/x-www-form-urlencoded' },
        withCredentials: true
      })
      if (res.status && !res.data.hasOwnProperty('error')) {
        commit('logout')
      } else {
        alert('注销失败')
      }
    }
  }
})
