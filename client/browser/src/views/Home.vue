<template>
  <div class="home">
    <div class="blog" v-for="blog in blogs" :key="blog.id">
      <Previewer :propTitle="blog.title"
                 :propContent="blog.content"
                 :propAuthor="blog.author"></Previewer>
    </div>
  </div>
</template>

<script>
import Previewer from '../components/Previewer'
export default {
  name: 'Home',
  components: {
    Previewer
  },
  data () {
    return {
      blogs: [
        {
          id: 1,
          title: '随便取得标题',
          content: '随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容随便整的内容',
          author: '狸吉',
          createdDate: '2020-02-02',
          commentsCount: 233,
          lookedCount: 360
        },
        {
          id: 2,
          title: '随便取得标题',
          content: '随便整的内容',
          author: '狸吉',
          createdDate: '2020-02-02',
          commentsCount: 233,
          lookedCount: 360
        },
        {
          id: 3,
          title: '随便取得标题',
          content: '随便整的内容',
          author: '狸吉',
          createdDate: '2020-02-02',
          commentsCount: 233,
          lookedCount: 360
        },
        {
          id: 4,
          title: '随便取得标题',
          content: '随便整的内容',
          author: '狸吉',
          createdDate: '2020-02-02',
          commentsCount: 233,
          lookedCount: 360
        }
      ] // 博客列表：作者，创建时间，观看数，评论数，文章概要
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
