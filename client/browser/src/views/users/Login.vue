<template>
  <div class="login">
    <input type="text" id="username" placeholder="username">
    <input type="text" id="password" placeholder="password">
    <input type="submit" value="登录" @click.prevent="login">
  </div>
</template>

<script>
export default {
  name: 'Login',
  methods: {
    login () {
      /**
       * 用户登录
       */
      let username = $('#username').val()
      let password = $('#password').val()

      if (username && password) {
        this.$store.dispatch('login', {
          username,
          password
        })
        if (this.$route.params.wantedRoute) {
          this.$router.replace({ path: this.$route.params.wantedRoute })
        } else {
          this.$router.replace({ name: 'home' })
        }
      } else {
        alert('用户名和密码不能为空')
      }
    }
  }
}
</script>

<style lang="less" scoped>

</style>
