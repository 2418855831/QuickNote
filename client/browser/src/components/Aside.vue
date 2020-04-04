<template>
  <div class="aside">
    <div class="brand">
      <h3 class="brand-title">Quick Note</h3>
      <p class="brand-content">Coding every day!</p>
    </div>
    <div class="nav">
      <ul class="nav-menu">
        <li class="nav-index" @click="pushTo({ name: 'Home' })">
          <i class="nav-icon home-icon"></i>首页
        </li>
        <li class="nav-index" @click="pushTo({ name: 'Home' })">
          <i class="nav-icon category-icon"></i>分类
        </li>
        <li class="nav-index" @click="pushTo({ name: 'Home' })">
          <i class="nav-icon aboutme-icon"></i>关于
        </li>
      </ul>
    </div>
  </div>
</template>

<script>
export default {
  name: 'Aside',
  methods: {
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
@import '../assets/variables/common.less';

.aside {
  min-width: 6rem;
  width: 12rem;

  .brand {
    padding: 1rem 0;
    background-color: @dark-less;
    color: @white;
    display: flex;
    flex-direction: column;
    align-items: center;
    justify-content: center;

    .brand-content {
      margin-top: 1rem;
      font-size: 0.6rem;
    }
  }

  .nav {
    border: 1px solid @gray-less;
    border-top: 0;
    background-color: @white;

    .nav-menu {
      padding: 1rem 0;
      list-style: none;

      .nav-index {
        padding: 0.3rem 0.5rem;
        font-size: 0.7rem;
        text-align: left;

        .nav-icon {
          margin-right: 0.6rem;
        }

        &:hover {
          cursor: pointer;
          background-color: @gray-less;

          .nav-icon:before {
            color: @dark;
          }
        }
      }
    }
  }
}
</style>
