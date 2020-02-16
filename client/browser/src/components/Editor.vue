<template>
  <div class="editor">
    <!--标题栏-->
    <div class="title-bar">
      <div class="title-input-container">
        <input class="title-input" type="text" placeholder="标题" v-model="title" maxlength="100" required>
        <span class="title-counter">{{ titleCharactersCount }}/100</span>
      </div>
    </div>
    <!--编辑器和预览器-->
    <mavon-editor class="mavon-editor" :toolbars="markdownOption" v-model="content"/>
    <!--状态栏-->
    <div class="status-bar">
      <ul class="status-content">
        <li class="status-item mr-auto">Markdown</li>
        <li class="status-item">Lines: {{ linesCount }}</li>
        <li class="status-item">Characters: {{ charactersCount }}</li>
      </ul>
    </div>
  </div>
</template>

<script>
import { mavonEditor } from 'mavon-editor'
import 'mavon-editor/dist/css/index.css'
export default {
  name: 'Editor',
  props: {
    propTitle: String,
    propContent: String
  },
  components: {
    'mavon-editor': mavonEditor
  },
  data () {
    return {
      markdownOption: {
        bold: true, // 粗体
        italic: true, // 斜体
        header: true, // 标题
        underline: true, // 下划线
        strikethrough: true, // 中划线
        mark: true, // 标记
        superscript: true, // 上角标
        subscript: true, // 下角标
        quote: true, // 引用
        ol: true, // 有序列表
        ul: true, // 无序列表
        link: true, // 链接
        imagelink: true, // 图片链接
        code: true, // code
        table: true, // 表格
        fullscreen: true, // 全屏编辑
        readmodel: true, // 沉浸式阅读
        htmlcode: true, // 展示html源码
        help: true, // 帮助
        /* 1.3.5 */
        undo: true, // 上一步
        redo: true, // 下一步
        trash: true, // 清空
        save: true, // 保存（触发events中的save事件）
        /* 1.4.2 */
        navigation: true, // 导航目录
        /* 2.1.8 */
        alignleft: true, // 左对齐
        aligncenter: true, // 居中
        alignright: true, // 右对齐
        /* 2.2.1 */
        subfield: true, // 单双栏模式
        preview: false // 预览
      },
      title: this.propTitle || '',
      content: this.propContent || ''
    }
  },
  computed: {
    titleCharactersCount () {
      // 标题字数
      return this.title.length
    },
    linesCount () {
      // 内容行数
      let match = this.content.match(/\r\n|\n|\r/gm)
      return match ? match.length + 1 : 1
    },
    charactersCount () {
      // 内容字数
      let match = this.content.split(/[^\r\n|\n|\r]/)
      return match ? match.length - 1 : 0
    }
  }
}
</script>

<style lang="less" scoped>
.editor {
  width: 100%;
  height: 100%;

  .title-bar {
    width: 100%;
    height: 2.5rem;
    padding: 0.25rem 0.5rem;

    .title-input-container {
      margin: 0 auto;
      padding: 0.15rem 0;
      width: 70%;
      height: 100%;
      border: 1px solid silver;
      border-radius: 0.25rem;

      .title-input {
        width: 90%;
        border: 0;
        outline: none;
      }
    }
  }

  .mavon-editor {
    width: 100%;
    min-height: calc(100% - 2.5rem);
  }

  .status-bar {
    position: fixed;
    width: 100vw;
    height: 20px;
    bottom: 0;
    z-index: 1500;
    color: white;
    background-color: rgba(0, 122, 204, 1);
    font-size: 0.75rem;

    .status-content {
      display: flex;
      list-style-type: none;
      margin: 0 0.5rem;

      .status-item {
        display: inline-flex;
        margin: 0 0.5rem;
      }
    }
  }
}
</style>
