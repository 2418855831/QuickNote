// The Vue build version to load with the `import` command
// (runtime-only or standalone) has been set in webpack.base.conf with an alias.
import Vue from 'vue'
import App from './App'
import router from './router'
import store from './store'
import axios from 'axios'
import VueAxios from 'vue-axios'
import qs from 'qs'
// eslint-disable-next-line
import $ from 'jquery'
// import 'bootstrap/dist/js/bootstrap.min.js'
// import 'bootstrap/dist/css/bootstrap.min.css'

Vue.prototype.$qs = qs

axios.defaults.baseURL = store.state.baseURL
Vue.use(VueAxios, axios)

Vue.config.productionTip = false

/* eslint-disable no-new */
new Vue({
  el: '#app',
  router,
  store,
  components: { App },
  template: '<App/>'
})
