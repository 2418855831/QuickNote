<template>
  <nav class="header">
      <span class="brand" @click="pushTo({ name: 'Home' })">
        <img class="brand-logo" src="/static/images/logo-32.svg" alt="logo">
        <span class="brand-name">QuickNote</span>
      </span>
    <span v-if="user.id">
      <span class="edit" @click="pushTo({ name: 'BlogsEdit' })">写博客</span>
      <span class="name">{{ user.name }}</span>
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
    pushTo ({ name, path }) {
      if (name) {
        if (this.$route.name !== name) {
          this.$router.push({ name })
        }
      } else if (path) {
        if (this.$route.path !== path) {
          this.$router.push({ path })
        }
      }
    }
  }
}
</script>

<style lang="less" scoped>
.header {
  width: 100%;
  margin-bottom: 2vh;
  box-shadow: 0 1vh 1vh rgba(0, 0, 0, 0.1);
  text-align: left;
  padding: 2vh 2vw;
  display: flex;
  justify-content: space-between;

  .brand {
    display: block;
    height: 100%;
    cursor: pointer;

    .brand-logo {
      display: inline-block;
      vertical-align: middle;
      width: 4vw;
      height: 4vh;
    }

    .brand-name {
      font-size: 1rem;
      font-weight: 500;
    }
  }

  .login, .logout, .name, .edit {
    margin-left: 1vw;
    &:hover {
      color: rgba(0, 0, 0, 0.75);
      cursor: pointer;
    }
  }
}
</style>
