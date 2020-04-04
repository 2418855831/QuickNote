import axios from 'axios'
import store from '@/store'

axios.defaults.baseURL = store.state.baseURL
axios.defaults.withCredentials = true
axios.interceptors.request.use(config => {
  // CSRF Safe Methods: GET, HEAD, OPTIONS, TRACE
  if (!(/^(get|head|options|trace)$/.test(config['method']))) {
    // Carry CSRF token
    config['xsrfCookieName'] = 'csrftoken'
    config['xsrfHeaderName'] = 'X-CSRFToken'
  }
  return config
})

export default axios
