<template>
  <div id="app">
    <Header></Header>
    <transition :name="slide" mode="out-in">
      <router-view></router-view>
    </transition>
  </div>
</template>

<script>
import Header from '@/components/Header'

export default {
  name: 'App',
  components: {
    Header
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

* {
  margin: 0;
  padding: 0;
  box-sizing: border-box;
}

html, body {
  width: 100%;
  height: 100%;
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
