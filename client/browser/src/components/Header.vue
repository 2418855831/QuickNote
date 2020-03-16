<template>
  <nav class="header">
      <span class="brand" @click="toHome">
        <img class="brand-logo" src="/static/images/logo-32.svg" alt="logo">
        <span class="brand-name">QuickNote</span>
      </span>
    <span v-if="user.id">
      <span>{{ user.name }}</span>
      <span class="logout" @click="logout">注销</span>
    </span>
    <span v-else class="login" @click="login">登录</span>
  </nav>
</template>

<script>
export default {
  name: 'Header',
  data () {
    return {
      user: this.$store.state.user
    }
  },
  methods: {
    login () {
      this.$router.replace({ name: 'UsersLogin', params: { wantedRoute: this.$route.path } })
    },
    logout () {
      this.$store.dispatch('logout')
    },
    toHome () {
      if (this.$route.name !== 'Home') {
        this.$router.push({ name: 'Home' })
      }
    }
  }
}
</script>

<style lang="less" scoped>
.header {
  width: 100%;
  height: 8vh;
  margin-bottom: 2vh;
  box-shadow: 0 1vh 1vh rgba(0, 0, 0, 0.1);
  text-align: left;
  padding: 2vh 2vh;
  display: flex;
  justify-content: space-between;

  .brand {
    display: block;
    height: 100%;
    cursor: pointer;

    .brand-logo {
      display: inline-block;
      vertical-align: middle;
      width: 4vh;
      height: 4vh;
    }

    .brand-name {
      font-size: 1rem;
      font-weight: 500;
    }
  }

  .login, .logout {
    &:hover {
      color: rgba(0, 0, 0, 0.75);
      cursor: pointer;
    }
  }
}
</style>
