<template>
  <div class="note">
    <Sidebar v-if="nodes"
             :propNodes="nodes" ref="sidebar"
             @createNode="createNode"
             @renameNode="renameNode"
             @deleteNode="deleteNode"></Sidebar>
    <Editor :propTitle="title" :propContent="content" @save="save" ref="editor"></Editor>
  </div>
</template>

<script>
import Editor from '../components/Editor'
import Sidebar from '../components/Sidebar'
export default {
  name: 'Note',
  components: {
    Editor,
    Sidebar
  },
  data () {
    return {
      title: '随便整的一个标题',
      content: '```c\n int main(){} \n```',
      nodes: null
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
      let res = await this.axios({
        method: 'post',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        url: isParent ? this.$store.state.apiURL.blogs_dirs_create : this.$store.state.apiURL.blogs_create,
        data: this.$qs.stringify({
          author: 'a',
          path: path
        })
      })
      console.log(res)
    },
    async renameNode (path, isParent, newName) {
      /**
       * 重命名节点
       * @param {string} path 节点路径，以'/'分隔
       * @param {bool} isParent 是否为父节点
       * @param {string} newName 节点的新名称
       * @returns null
       */
      let res = await this.axios({
        method: 'put',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        url: isParent ? this.$store.state.apiURL.blogs_dirs_rename : this.$store.state.apiURL.blogs_rename,
        data: this.$qs.stringify({
          author: 'a',
          path: path,
          newName: newName
        })
      })
      console.log(res)
    },
    async deleteNode (path, isParent) {
      /**
       * 删除节点
       * @param {string} path 节点路径，以'/'分隔
       * @param {bool} isParent 是否为父节点
       * @returns undefined
       */
      let res = await this.axios({
        method: 'delete',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        url: isParent ? this.$store.state.apiURL.blogs_dirs_delete : this.$store.state.apiURL.blogs_delete,
        data: this.$qs.stringify({
          author: 'a',
          path: path
        })
      })
      console.log(res)
    },
    async save (title, content) {
      // Get blog's path.
      let currentNode = this.$refs.sidebar.tree.currentNode
      if (!currentNode) {
        alert('TODO: Please select a path to save.')
        return
      }
      // let path = currentNode.getPath().map(node => node.name).join('/')

      // Post blog.
      await this.axios({
        method: 'post',
        headers: {'Content-Type': 'application/x-www-form-urlencoded'},
        url: this.$store.state.apiURL.blog,
        data: this.$qs.stringify({
          author: 'a',
          title: this.$refs.editor.title || '',
          content: this.$refs.editor.content || '',
          path: 'dir1'
        })
      })
        .then(() => alert('Saved successfully!'))
        .catch((error) => {
          console.error(error)
          alert('Failed to save!')
        })
    }
  },
  async created () {
    let res = await this.axios({
      method: 'get',
      url: this.$store.state.apiURL.blogs_dirs_index,
      params: {
        author: 'b'
      }
    })
    this.nodes = res.data
    console.log(res.data)
  }
}
</script>

<style lang="less" scoped>
.note {
  width: 100%;
  height: 100%;
}
</style>
