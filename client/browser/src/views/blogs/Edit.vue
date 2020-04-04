<template>
  <div class="edit">
    <Sidebar v-if="nodes"
             :propNodes="nodes"
             ref="sidebar"
             @get="getBlog"
             @createNode="createNode"
             @renameNode="renameNode"
             @deleteNode="deleteNode"></Sidebar>
    <Editor :key="editorKey"
            :propTitle="title"
            :propContent="content"
            ref="editor"
            @save="saveBlog"></Editor>
  </div>
</template>

<script>
import Editor from '@/components/Editor'
import Sidebar from '@/components/Sidebar'
export default {
  name: 'Edit',
  components: {
    Editor,
    Sidebar
  },
  data () {
    return {
      title: '',
      content: '',
      nodes: null,
      editorKey: false
    }
  },
  methods: {
    async createNode ({ categoryName, title }) {
      /**
       * 创建节点
       * @param {string} categoryName 分类名称
       * @param {bool} title 博客名称
       * @returns undefined
       */
      if (categoryName && title) { // 创建博客
        await this.axios({
          method: 'post',
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          url: this.$store.state.apiURL.blogs_create,
          data: this.$qs.stringify({
            categoryName,
            title,
            content: ''
          })
        })
      } else if (categoryName) { // 创建分类
        await this.axios({
          method: 'post',
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          url: this.$store.state.apiURL.categories_create,
          data: this.$qs.stringify({
            categoryName
          })
        })
      } else { // 传参出错
        console.warn('Edit: createNode参数错误')
      }
    },
    async renameNode (path, isParent, newName) {
      /**
       * 重命名节点
       * @param {array} path 节点路径
       * @param {bool} isParent 是否为父节点
       * @param {string} newName 节点的新名称
       * @returns null
       */

      if (path.length === 1) { // 重命名分类
        await this.axios({
          method: 'put',
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          url: this.$store.state.apiURL.categories_rename,
          data: this.$qs.stringify({
            categoryName: path[0],
            newCategoryName: newName
          })
        })
      } else if (path.length === 2) { // 重命名博客
        await this.axios({
          method: 'put',
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          url: this.$store.state.apiURL.blogs_rename,
          data: this.$qs.stringify({
            categoryName: path[0],
            title: path[1],
            newTitle: newName
          })
        })
      } else {
        console.warn('Edit: renameNode传参错误')
      }
    },
    async deleteNode (path, isParent) {
      /**
       * 删除节点
       * @param {array} path 节点路径
       * @param {bool} isParent 是否为父节点
       * @returns undefined
       */
      if (path.length === 1) { // 删除分类
        await this.axios({
          method: 'delete',
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          url: this.$store.state.apiURL.categories_delete,
          data: this.$qs.stringify({
            categoryName: path[0]
          })
        })
      } else if (path.length === 2) { // 删除博客
        await this.axios({
          method: 'delete',
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          url: this.$store.state.apiURL.blogs_delete,
          data: this.$qs.stringify({
            categoryName: path[0],
            title: path[1]
          })
        })
      } else {
        console.warn('Edit: deleteNode传参错误')
      }
    },
    async getBlog (path) {
      /**
       * 获取博客
       * @param {array} path 节点路径
       * @returns
       */
      if (path.length === 2) {
        let res = await this.axios({
          method: 'get',
          url: this.$store.state.apiURL.blogs_index,
          params: {
            categoryName: path[0],
            title: path[1]
          }
        })
        if (res.status === 200) {
          if (res.data.hasOwnProperty('error')) {
            console.warn(res.data.error)
            return
          }
          this.title = res.data.title
          this.content = res.data.content
          this.editorKey = !this.editorKey // 更新编辑器
        } else {
          console.warn(res.status + ' ' + res.statusText)
        }
      } else {
        console.warn('Edit: getBlog传参错误')
      }
    },
    async saveBlog (title, content) {
      // 获得节点路径
      let currentNode = this.$refs.sidebar.tree.currentNode
      if (!currentNode || currentNode.isParent) {
        alert('TODO: Please select a file to save.')
        return
      }
      let path = currentNode.getPath().map(node => node.name)

      if (path.length === 2) {
        let res = await this.axios({
          method: 'post',
          headers: {'Content-Type': 'application/x-www-form-urlencoded'},
          url: this.$store.state.apiURL.blogs_save,
          data: this.$qs.stringify({
            categoryName: path[0],
            title: path[1],
            content: this.$refs.editor.content || ''
          })
        })
        if (res.status === 200) {
          if (res.data.hasOwnProperty('error')) {
            console.warn(res.data.error)
          }
        } else {
          console.warn(res.status + ' ' + res.statusText)
        }
      } else {
        console.warn('Edit: saveBlog传参错误')
      }
    }
  },
  async created () {
    let res = await this.axios({
      method: 'get',
      url: this.$store.state.apiURL.categories_index
    })
    if (res.status === 200) {
      if (res.data.hasOwnProperty('error')) {
        console.warn(res.data.error)
        return
      }
      this.nodes = res.data
    } else {
      console.warn(res.status + ' ' + res.statusText)
    }
  }
}
</script>

<style lang="less" scoped>
.edit {
  width: 100%;
  height: 100%;
}
</style>
