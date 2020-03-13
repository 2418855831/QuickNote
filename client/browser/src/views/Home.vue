<template>
  <div class="home">
    <!--
    <transition-group tag="div" name="fade" mode="out-in" appear class="blog" v-for="blog in blogs" :key="blog.id">
      <Previewer :propTitle="blog.title"
                 :propContent="blog.content"
                 :propAuthor="blog.author"
                 :key="blog.id"></Previewer>
    </transition-group>
    --->
    <transition-group
      v-if="blogs"
      tag="div"
      name="fade"
      :css="false"
      @before-enter="beforeEnter"
      @enter="enter"
      appear>
      <div class="blog"
           v-for="(blog, index) in blogs"
           :key="blog.id"
           :data-index="index">
        <Previewer
          :propTitle="blog.title"
          :propContent="blog.content"
          :propAuthor="blog.author"></Previewer>
      </div>
    </transition-group>
  </div>
</template>

<script>
import Velocity from 'velocity-animate'
import Previewer from '../components/Previewer'
export default {
  name: 'Home',
  components: {
    Previewer
  },
  data () {
    return {
      show: true,
      blogs: [] // 博客列表：作者，创建时间，观看数，评论数，文章概要
    }
  },
  async created () {
    let res = await this.axios({
      method: 'get',
      url: this.$store.state.apiURL.blogs_index
    })
    if (res.status === 200) {
      this.blogs = res.data
    }
  },
  methods: {
    beforeEnter (el) {
      el.style.opacity = 0
    },
    enter (el, done) {
      let delay = el.dataset.index * 333
      setTimeout(function () {
        Velocity(
          el,
          { opacity: 1 },
          { duration: '1000' },
          { easing: 'easeInSine' },
          { complete: done }
        )
      }, delay)
    }
  }
}
</script>

<style lang="less" scoped>
@import '../assets/variables/common.less';

.home {
  width: 100%;
  height: 100%;
  text-align: center;

  .blog {
    width: 60%;
    max-height: 200px;
    margin: 2rem auto;

    // 深度作用选择器
    // https://vue-loader.vuejs.org/zh/guide/scoped-css.html#%E6%B7%B1%E5%BA%A6%E4%BD%9C%E7%94%A8%E9%80%89%E6%8B%A9%E5%99%A8
    & /deep/ .markdown-body p {
      overflow: hidden;
      text-overflow: ellipsis;
      line-height: 2rem;
      display: -webkit-box;
      -webkit-line-clamp: 3;
      -webkit-box-orient: vertical;
    }
  }
}
</style>
