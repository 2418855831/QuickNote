<template>
  <transition name="fade" class="lookup" appear>
    <Previewer v-if="id"
               class="blog-lookup"
               :propDisplayContent="true"
               :propTitle="title"
               :propContent="content"
               propAuthor="狸吉、"
               :propViewsCount="viewsCount"></Previewer>
  </transition>
</template>

<script>
import Previewer from '@/components/Previewer'
export default {
  name: 'Lookup',
  components: {
    Previewer
  },
  data () {
    return {
      id: null,
      author: null,
      title: null,
      content: null,
      viewsCount: null
    }
  },
  async created () {
    let id = this.$route.params.id
    if (!id) {
      console.warn(`路径中不存在博客ID`)
      return
    }
    let res = await this.axios({
      method: 'get',
      url: this.$store.state.apiURL.blogs_index,
      params: {
        id: id
      }
    })
    if (res.status === 200) {
      if (res.data.hasOwnProperty('error')) {
        console.warn(res.data.error)
        return
      }
      this.id = res.data.id
      this.author = res.data.author
      this.title = res.data.title
      this.content = res.data.content
      this.viewsCount = res.data.viewsCount
    }
  }
}
</script>

<style lang="less" scoped>
.blog-lookup {
  height: 100%;
  width: 75% !important;
}

.fade-enter {
  opacity: 0;
}

.fade-enter-active {
  transition: all 1s ease-in 0s;
}
</style>
