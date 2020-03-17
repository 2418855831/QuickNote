<template>
  <div class="home">
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
        <Previewer class="blog-previewer"
          :propTitle="blog.title"
          :propAuthor="blog.author"
          :propCreatedDate="blog.createdDate"
          :propViewsCount="blog.viewsCount"
          :propDisplayContent="false"></Previewer>
        <button type="button" class="detail-btn" @click="lookupBlog(blog.id)">查看全文</button>
        <div :key="blog.id" v-if="index !== blogs.length - 1" class="blog-divider"></div>
      </div>
    </transition-group>
  </div>
</template>

<script>
import Velocity from 'velocity-animate'
import Previewer from '@/components/Previewer'

export default {
  name: 'Home',
  components: {
    Previewer
  },
  data () {
    return {
      blogs: [] // 博客列表：作者，创建时间，观看数，评论数，文章概要
    }
  },
  async created () {
    let res = await this.axios({
      method: 'get',
      url: this.$store.state.apiURL.blogs_index
    })
    if (res.status === 200) {
      if (res.data.hasOwnProperty('error')) {
        console.warn(res.data.error)
        return
      }
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
          { duration: '500' },
          { easing: 'easeInSine' },
          { complete: done }
        )
      }, delay)
    },
    async lookupBlog (id) {
      /**
       * 查看博客全文
       * @param {Int} id
       * @returns
       */
      this.$router.push({ name: 'BlogsLookup', params: { id } })
      // 递增阅览量
      await this.axios({
        method: 'put',
        url: this.$store.state.apiURL.blogs_incre_views_count,
        header: { 'Content-Type': 'application/x-www-form-urlencoded' },
        data: this.$qs.stringify({
          id
        })
      })
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
    margin: 0 auto;

    .blog-previewer {
      max-height: 200px;
    }

    .detail-btn {
      margin: 1rem auto;
      padding: 0.25rem;
      border: rgba(0, 0, 0, 0.3) solid 1px;
      border-radius: 0.15rem;
      background-color: #fbfbfb;
      outline: none;
      display: block;
      font-size: calc(1rem - 4px);

      &:hover {
        cursor: pointer;
        background-color: rgba(0, 0, 0, 0.15);
        transition: background-color 0.3s linear 0s;
      }
    }

    .blog-divider {
      box-sizing: border-box;
      height: 1px;
      width: 50%;
      margin: 1rem auto;
      border-top: rgba(0, 0, 0, 0.15) solid 1px;
    }

    // 深度作用选择器
    // https://vue-loader.vuejs.org/zh/guide/scoped-css.html#%E6%B7%B1%E5%BA%A6%E4%BD%9C%E7%94%A8%E9%80%89%E6%8B%A9%E5%99%A8
    & /deep/ .markdown-body .show-content {
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
