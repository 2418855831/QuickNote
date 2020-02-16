<template>
  <div class="note">
    <Sidebar :propNodes="nodes"></Sidebar>
    <Editor :propTitle="title" :propContent="content"></Editor>
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
      nodes: [
        {
          name: 'dir1',
          children: [
            { name: 'test1_1' },
            { name: 'test1_2' },
            { name: 'test1_3' },
            {
              name: 'subdir1_1',
              children: [
                {
                  name: 'subdir1_1_1',
                  children: [
                    {
                      name: 'subdir1_1_1_1',
                      children: [
                        { name: 'subdir1_1_1_1_1' }
                      ]
                    }
                  ]
                }
              ]
            }
          ]
        },
        {
          name: 'dir2',
          children: [
            { name: 'test2_1' },
            { name: 'test2_2' }
          ]
        },
        {
          name: 'dir3',
          children: [
            { name: 'test3_1' },
            { name: 'test3_2' },
            { name: 'test3_3' }
          ]
        },
        {
          name: 'dir4',
          children: [
            { name: 'test4_1' },
            { name: 'test4_2' },
            { name: 'test4_3' },
            {
              name: 'subdir4_1',
              children: [
                { name: 'test4_4' }
              ]
            }
          ]
        },
        {
          name: 'dir5',
          children: [
            { name: 'test5_1' },
            { name: 'test5_2' },
            { name: 'test5_3' },
            {
              name: 'subdir5_1',
              children: [
                { name: 'test5_4' }
              ]
            }
          ]
        }
      ]
    }
  }
}
</script>

<style lang="less" scoped>
.note {
  width: 100%;
  height: 100%;
}
</style>
