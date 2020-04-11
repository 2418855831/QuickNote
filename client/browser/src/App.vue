<template>
  <div id="app">
    <!--<Header></Header>-->
    <Navbar class="navbar"></Navbar>
    <transition :name="slide" mode="out-in">
      <router-view></router-view>
    </transition>
  </div>
</template>

<script>
import Header from '@/components/Header'
import Navbar from '@/components/Navbar'

export default {
  name: 'App',
  components: {
    Header,
    Navbar
  },
  data () {
    return {
      slide: 'slide-left'
    }
  },
  watch: {
    '$route' (to, from) {
      if (from.name === null) {
        this.slide = null
        return
      }
      const toDepth = to.path.split('/').length
      const fromDepth = from.path.split('/').length
      this.slide = toDepth < fromDepth ? 'slide-right' : 'slide-left'
    }
  }
}
</script>

<style lang="less">
@import "./assets/variables/ztree-icons.less";
@import "./assets/variables/common.less";

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html, body {
  width: 100%;
  font-family: -apple-system,BlinkMacSystemFont,Segoe UI,Helvetica,Arial,sans-serif,Apple Color Emoji,Segoe UI Emoji;
  font-size: 16px;
  line-height: 1.5;
  overflow-x: hidden;
}

#app {
  width: 100%;
  height: 100%;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;

  /* 大屏(电脑，平板) */
  @media only screen and (min-width: @screen-threshold-size) {
    margin-left: @navbar-width-big;
  }

  /* 小屏(手机) */
  @media only screen and (max-width: @screen-threshold-size) {
    margin-bottom: @navbar-height-small;
  }
}

/*slide left*/
.slide-left-enter {
  opacity: 0;
  transform: translateX(25%);
}

.slide-left-enter-active {
  transition: all .5s ease-in;
}

.slide-left-leave-active {
  transition: all .5s ease-out;
}

.slide-left-leave-to {
  opacity: 0;
  transform: translateX(-25%);
}

/*slide right*/
.slide-right-enter {
  opacity: 0;
  transform: translateX(-25%);
}

.slide-right-enter-active {
  transition: all .5s ease-in;
}

.slide-right-leave-active {
  transition: all .5s ease-out;
}

.slide-right-leave-to {
  opacity: 0;
  transform: translateX(25%);
}

</style>
