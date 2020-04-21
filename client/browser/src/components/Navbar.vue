<template>
  <nav class="navbar">
    <ul class="nav-list">
      <li class="logo-item nav-item">
        <span class="logo-text nav-text">Quick Note</span>
        <i class="logo-icon nav-icon chevron-right-icon"></i>
      </li>
      <li class="nav-item" @click="pushTo({ name: 'Home' })">
        <i class="nav-icon home-icon"></i>
        <span class="nav-text">首页</span>
      </li>
      <li class="nav-item" @click="pushTo({ name: 'Categories' })">
        <i class="nav-icon category-icon"></i>
        <span class="nav-text">分类</span>
      </li>
      <li class="nav-item" @click="pushTo({ name: 'Resume' })">
        <i class="nav-icon aboutme-icon"></i>
        <span class="nav-text">关于</span>
      </li>
      <li class="nav-item" @click="toggleTheme">
        <i class="nav-icon light-bulb-icon"></i>
        <span class="nav-text">主题</span>
      </li>
    </ul>
  </nav>
</template>

<script>
export default {
  name: 'Navbar',
  data () {
    const themeMap = {
      dark: 'light',
      light: 'solar',
      solar: 'dark'
    }
    let tmp
    let theme = localStorage.getItem('theme') || (tmp = Object.keys(themeMap)[0], localStorage.setItem('theme', tmp), tmp)
    return {
      themeMap,
      theme,
      navbarClass: null
    }
  },
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
    },
    toggleTheme () {
      const nextTheme = this.themeMap[this.theme]
      this.navbarClass.replace(this.theme, nextTheme)
      localStorage.setItem('theme', nextTheme)
      this.theme = nextTheme
    }
  },
  mounted () {
    this.navbarClass = document.getElementsByClassName('navbar')[0].classList
    this.navbarClass.add(this.theme)
  }
}
</script>

<style lang="less" scoped>
@import '../assets/variables/common.less';

.navbar {
  /* 颜色与变换速度 */
  --text-primary: #b6b6b6;
  --text-secondary: #ececec;
  --bg-primary: #23232e;
  --bg-secondary: #141418;
  --transition-speed: 600ms;

  position: fixed;
  font-size: 1.5rem;
  font-weight: 300;
  z-index: @base-index + 1;
  background-color: var(--bg-primary);
  transition: var(--transition-speed);

  .nav-list {
    margin: 0;
    padding: 0;
    height: 100%;
    list-style: none;
    display: flex;
    flex-direction: column;
    align-items: center;

    .nav-item {
      width: 100%;
      display: flex;
      align-items: center;
      cursor: pointer;
      filter: grayscale(100%) opacity(0.7);
      transition: var(--transition-speed);

      .nav-icon {
        margin-left: 1rem;

        &:before {
          width: 2rem;
          min-width: 2rem;
          font-size: 2rem;
          color: var(--text-primary);
        }
      }

      .nav-text {
        margin-right: 1rem;
        color: var(--text-primary);
        display: none;
        white-space: nowrap;
        flex-grow: 99;
        letter-spacing: 1ch;
        overflow-x: hidden;
      }

      &.logo-item {
        background-color: var(--bg-secondary);
        filter: grayscale(0%) opacity(1);

        .logo-icon {
          /* 这个Logo太靠左了，所以稍微往右移点儿 */
          margin: 0 0.5rem 0 1.5rem;
          transition: var(--transition-speed);

          &:before {
            color: var(--text-primary);
          }
        }

        .logo-text {
          position: absolute;
          left: -999px;
          margin: 0 0 0 1rem;
          display: inline;
          letter-spacing: 0.3ch;
          transition: var(--transition-speed);
        }
      }

      &:hover {
        background-color: var(--bg-secondary);

        .nav-text {
          color: var(--text-secondary);
        }

        .nav-icon:before {
          color: var(--text-secondary);
        }
      }
    }
  }

  /* 大屏(电脑，平板) */
  @media only screen and (min-width: @screen-threshold-size) {
    top: 0;
    left: 0;
    width: @navbar-width-big;
    height: 100vh;

    .nav-item {
      height: 5rem;

      &:last-child {
        margin-top: auto;
      }
    }

    &:hover {
      width: 14rem;

      .nav-list {
        .nav-item {
          .nav-icon {
            &.logo-icon {
              margin-left: 10rem;
              transform: rotate(-180deg);
            }
          }

          .nav-text {
            display: inline;

            &.logo-text {
              left: 0;
            }
          }
        }
      }
    }
  }

  /* 小屏(手机) */
  @media only screen and (max-width: @screen-threshold-size) {
    bottom: 0;
    width: 100vw;
    height: @navbar-height-small;
    overflow-x: auto;

    .nav-list {
      flex-direction: row;

      .nav-item {
        height: 3rem;
        justify-content: center;

        &.logo-item {
          display: none;
        }
      }
    }
  }

  /* 配色方案 */
  &.dark {
    --text-primary: #b6b6b6;
    --text-secondary: #ececec;
    --bg-primary: #23232e;
    --bg-secondary: #141418;
  }

  &.light {
    --text-primary: #1f1f1f;
    --text-secondary: #000000;
    --bg-primary: #ffffff;
    --bg-secondary: #e4e4e4;
  }

  &.solar {
    --text-primary: #576e75;
    --text-secondary: #35535c;
    --bg-primary: #fdf6e3;
    --bg-secondary: #f5e5b8;
  }
}
</style>
