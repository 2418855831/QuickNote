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
        <span class="eye-icon"></span>
        <span>浏览量: {{ viewsCount }}</span>
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
                    v-model="content"
                    v-show="propDisplayContent">
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
      default: ''
    },
    propContent: { // 未经解析的 Markdown格式的内容
      type: String,
      default: ''
    },
    propAuthor: {
      type: String,
      default: ''
    },
    propCreatedDate: {
      type: String,
      default: function () {
        return new Date().toISOString()
      }
    },
    propViewsCount: {
      type: Number,
      default: 0
    },
    propDisplayContent: {
      type: Boolean,
      default: false
    }
  },
  components: {
    'mavon-editor': mavonEditor
  },
  data () {
    return {
      title: this.propTitle,
      content: this.propContent,
      author: this.propAuthor,
      createdDate: this.dateFormat(new Date(this.propCreatedDate), 'yyyy-MM-dd hh:mm:ss'),
      viewsCount: this.propViewsCount
    }
  },
  methods: {
    dateFormat (date, fmt) {
      let o = {
        'M+': date.getMonth() + 1, // 月份
        'd+': date.getDate(), // 日
        'h+': date.getHours(), // 小时
        'm+': date.getMinutes(), // 分
        's+': date.getSeconds(), // 秒
        'q+': Math.floor((date.getMonth() + 3) / 3), // 季度
        'S': date.getMilliseconds() // 毫秒
      }
      if (/(y+)/.test(fmt)) {
        fmt = fmt.replace(RegExp.$1, (date.getFullYear() + '').substr(4 - RegExp.$1.length))
      }
      for (let k in o) {
        if (new RegExp('(' + k + ')').test(fmt)) {
          fmt = fmt.replace(RegExp.$1, (RegExp.$1.length === 1) ? (o[k]) : (('00' + o[k]).substr(('' + o[k]).length)))
        }
      }
      return fmt
    }
  },
  created () {
    if (!this.propDisplayContent) {
      // 隐藏内容
      $('.blog-body').css('display', 'none')
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
    padding: 1rem;

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
    border-top: #f3f3f3 1px solid;
    .v-note-wrapper {
      border: 0;
      min-height: 0;
    }
  }
}
</style>
