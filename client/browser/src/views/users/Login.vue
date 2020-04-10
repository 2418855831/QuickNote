<template>
  <div class="login">
    <div class="logo">
      <img src="/static/images/logo-64.svg">
    </div>
    <div class="title">
      登录到Quick Note
    </div>
    <div class="form">
      <div class="username-container">
        <i class="author-icon"></i>
        <input type="text" id="username" placeholder="账号">
      </div>
      <div class="password-container">
        <i class="lock-icon"></i>
        <input type="password" id="password" placeholder="密码">
      </div>
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
@import '../../assets/variables/common.less';
.login {
  position: absolute;
  left: 0;
  right: 0;

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

    .username-container, .password-container {
      margin: 0.3rem 0 1rem;
      width: 100%;
      display: flex;
    }

    .username-container:focus-within {
      .author-icon:before {
        color: @dark;
      }
    }

    .password-container:focus-within {
      .lock-icon:before {
        color: @dark;
      }
    }

    input[type="text"], input[type="password"] {
      margin-left: auto;
      margin-right: auto;
      width: 60%;
      padding: 0.25rem;
      background: none;
      outline: none;
      border: rgba(0, 0, 0, 0.1) solid 1px;
      border-radius: 0.25rem;
      transition: 0.3s;

      &:focus {
        width: 80%;
      }
    }

    input[type="submit"] {
      width: 30%;
      margin-top: 0.3rem;
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

  }
}
</style>
