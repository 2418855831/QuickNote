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
    async createNode (path, isParent) {
      /**
       * 创建节点
       * @param {string} path 节点路径，路径以'/'分隔
       * @param {bool} isParent 是否为父节点
       * @returns undefined
       */
      let data = {
        author: 'a',
        path: path
      }
      if (!isParent) {
        data['title'] = ''
        data['content'] = ''
      }

      await this.axios({
        method: 'post',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        url: isParent ? this.$store.state.apiURL.blogs_dirs_create : this.$store.state.apiURL.blogs_create,
        data: this.$qs.stringify(data)
      })
    },
    async renameNode (path, isParent, newName) {
      /**
       * 重命名节点
       * @param {string} path 节点路径，以'/'分隔
       * @param {bool} isParent 是否为父节点
       * @param {string} newName 节点的新名称
       * @returns null
       */
      await this.axios({
        method: 'put',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        url: isParent ? this.$store.state.apiURL.blogs_dirs_rename : this.$store.state.apiURL.blogs_rename,
        data: this.$qs.stringify({
          author: 'a',
          path: path,
          newName: newName
        })
      })
    },
    async deleteNode (path, isParent) {
      /**
       * 删除节点
       * @param {string} path 节点路径，以'/'分隔
       * @param {bool} isParent 是否为父节点
       * @returns undefined
       */
      await this.axios({
        method: 'delete',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        url: isParent ? this.$store.state.apiURL.blogs_dirs_delete : this.$store.state.apiURL.blogs_delete,
        data: this.$qs.stringify({
          author: 'a',
          path: path
        })
      })
    },
    async getBlog (path) {
      let res = await this.axios({
        method: 'get',
        url: this.$store.state.apiURL.blogs_index,
        params: {
          author: 'a',
          path: path
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
      }
    },
    async saveBlog (title, content) {
      // 获得节点路径
      let currentNode = this.$refs.sidebar.tree.currentNode
      if (!currentNode || currentNode.isParent) {
        alert('TODO: Please select a file to save.')
        return
      }
      let path = currentNode.getPath().map(node => node.name).join('/')

      // 保存博客
      let res = await this.axios({
        method: 'put',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        url: this.$store.state.apiURL.blogs_save,
        data: this.$qs.stringify({
          author: 'a',
          title: this.$refs.editor.title || '',
          content: this.$refs.editor.content || '',
          path: path
        })
      })
      if (res.status === 200) {
        if (res.data.hasOwnProperty('error')) {
          console.warn(res.data.error)
        }
      }
    }
  },
  async created () {
    let res = await this.axios({
      method: 'get',
      url: this.$store.state.apiURL.blogs_dirs_index,
      params: {
        author: 'a'
      }
    })
    if (res.status === 200) {
      if (res.data.hasOwnProperty('error')) {
        console.warn(res.data.error)
        return
      }
      this.nodes = res.data
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
