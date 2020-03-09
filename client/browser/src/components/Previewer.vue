<template>
  <div class="previewer">
    <!--标题栏-->
    <div class="blog-header">
      <h2 class="blog-title">{{ title }}</h2>
      <div class="blog-info">
        <span class="author-icon"></span>
        <span>作者: {{ author }}</span>
        <span class="blog-info-divider">|</span>
        <span class="calendar-icon"></span>
        <span>发表于: {{ createdDate }}</span>
        <span class="blog-info-divider">|</span>
        <span class="comment-icon"></span>
        <span>评论数: {{ commentsCount }}</span>
        <span class="blog-info-divider">|</span>
        <span class="eye-icon"></span>
        <span>阅读次数: {{ lookedCount }}</span>
      </div>
    </div>
    <!--预览器-->
    <div class="blog-body">
      <mavon-editor defaultOpen="preview"
                    :subfield="false"
                    :toolbarsFlag="false"
                    :shortCut="false"
                    :autofocus="false"
                    :boxShadow="false"
                    v-model="content">
      </mavon-editor>
    </div>
  </div>
</template>

<script>
import { mavonEditor } from 'mavon-editor'
import 'mavon-editor/dist/css/index.css'

export default {
  name: 'Previewer',
  props: {
    propTitle: {
      type: String,
      default: '随便整的一个标题'
    },
    propContent: { // 未经解析的 Markdown格式的内容
      type: String,
      default: '```c\nint main\n{}\n```'
    },
    propAuthor: {
      type: String,
      default: 'a'
    },
    propCreatedDate: {
      type: String,
      default: function () {
        let time = new Date()
        let year = time.getFullYear()
        let month = time.getMonth()
        let day = time.getDate()
        return year.toString() + '-' + (month < 9 ? '0' : '') + (month + 1).toString() + '-' + (day < 10 ? '0' : '').toString() + day.toString()
      }
    },
    propCommentsCount: {
      type: Number,
      default: 0
    },
    propLookedCount: {
      type: Number,
      default: 0
    }
  },
  components: {
    'mavon-editor': mavonEditor
  },
  data () {
    return {
      title: this.propTitle,
      content: mavonEditor.getMarkdownIt().render(this.propContent),
      author: this.propAuthor,
      createdDate: this.propCreatedDate,
      commentsCount: this.propCommentsCount,
      lookedCount: this.propLookedCount
    }
  }
}
</script>

<style lang="less" scoped>
@import '../assets/variables/common.less';

.previewer {
  margin: 0 auto;
  width: 100%;
  min-height: 100%;
  background-color: #fbfbfb;

  .blog-header {
    padding: 0.5rem 0;
    border-bottom: #f3f3f3 1px solid;

    .blog-title {
      margin-bottom: 0.5rem;
    }

    .blog-info {
      color: #999;
      font-family: 'Monda', "PingFang SC", "Microsoft YaHei", sans-serif;
      font-size: 12px;

      .blog-info-divider {
        margin: 0 0.5em;
        text-align: center;
      }
    }
  }

  .blog-body {
    .v-note-wrapper {
      border: 0;
      min-height: 0;
    }
  }
}
</style>
