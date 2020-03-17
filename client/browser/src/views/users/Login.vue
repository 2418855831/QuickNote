<template>
  <div class="login">
    <div class="logo">
      <img src="/static/images/logo-64.svg">
    </div>
    <div class="title">
      登录到Quick Note
    </div>
    <div class="form">
      <label for="username">账号</label>
      <input type="text" id="username" placeholder="账号">
      <label for="password">密码</label>
      <input type="password" id="password" placeholder="密码">
      <input type="submit" value="登录" @click.prevent="login">
    </div>
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
.login {
  position: absolute;
  right: 0;
  left: 0;

  .logo {
    margin: 4vh 0;
  }

  .title {
    margin: 4vh 0;
    font-size: 24px;
    font-weight: 300;
  }

  .form {
    position: relative;
    margin: auto;
    width: 240px;
    padding: 20px;
    border: rgba(0, 0, 0, 0.1) solid 1px;
    border-radius: 0.25rem;

    label {
      margin-bottom: 0.5rem;
      display: block;
      text-align: left;
      font-weight: 600;
      font-size: 14px;
    }

    input[type="submit"] {
      width: 100%;
      margin-top: 1rem;
      padding: 0.25rem;
      background-color: #fbfbfb;
      outline: none;
      border: rgba(0, 0, 0, 0.3) solid 1px;
      border-radius: 0.25rem;

      &:hover {
        cursor: pointer;
        background-color: rgba(0, 0, 0, 0.15);
        transition: background-color 0.3s linear 0s;
      }
    }

    input[type="text"], input[type="password"] {
      margin-top: 0.3rem;
      margin-bottom: 1rem;
      width: 100%;
      padding: 0.25rem;
      outline: none;
      border: rgba(0, 0, 0, 0.1) solid 1px;
      border-radius: 0.25rem;
    }
  }
}
</style>
