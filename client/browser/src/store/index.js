import Vue from 'vue'
import Vuex from 'vuex'

Vue.use(Vuex)

const debug = process.env.NODE_ENV !== 'production'

export default new Vuex.Store({
  strict: debug,
  state: {
    baseURL: 'http://localhost:8000/',
    apiURL: {
      blogs_index: 'api/blogs',
      blogs_create: 'api/blogs/create',
      blogs_save: 'api/blogs/save',
      blogs_rename: 'api/blogs/rename',
      blogs_delete: 'api/blogs/delete',
      blogs_dirs_index: 'api/blogs/dirs',
      blogs_dirs_create: 'api/blogs/dirs/create',
      blogs_dirs_rename: 'api/blogs/dirs/rename',
      blogs_dirs_delete: 'api/blogs/dirs/delete'
    }
  }
})
