<template>
  <div class="sidebar">
    <!--侧栏按钮-->
    <div class="sidebar-toggle">>展开目录</div>
    <!--侧栏头部-->
    <div class="sidebar-header">
      <span class="sidebar-plus plus-icon" @click="createNode(true)"></span>
      <span class="sidebar-pin pin-icon"></span>
    </div>
    <!--侧栏中部-->
    <div class="sidebar-body">
      <ul id="tree" class="ztree"></ul>
    </div>
  </div>
</template>

<script>
import '../../static/ztree/js/jquery.ztree.core.min.js'
import '../../static/ztree/js/jquery.ztree.exedit.min.js'
import '../../static/ztree/css/ztree.css'
export default {
  name: 'Sidebar',
  props: {
    propNodes: Array
  },
  data () {
    return {
      tree: {}, // 树形控件
      nodes: this.propNodes || [], // 初始化树形控件的节点数据
      newCategoryNumber: 1 // 新建分类的编号
    }
  },
  mounted () {
    // 创建侧边栏事件处理函数
    function sidebarExpand () {
      // expand sidebar
      $('.sidebar').addClass('sidebar-show')
    }
    function sidebarCollapse () {
      // collapse sidebar
      $('.sidebar').removeClass('sidebar-show')
    }
    function sidebarFix () {
      // fix or unfix sidebar
      if ($('.sidebar-pinned').length) {
        // unfix sidebar
        $('.sidebar-pin').removeClass('sidebar-pinned')
        $('#app').css('padding-left', '0vw')
        $('.sidebar').on('mouseleave', sidebarCollapse)
      } else {
        // fix sidebar
        $('.sidebar-pin').addClass('sidebar-pinned')
        $('#app').css('padding-left', '16vw')
        $('.sidebar').off('mouseleave', sidebarCollapse)
      }
    }

    $('.sidebar-toggle').on('mouseenter', sidebarExpand)
    $('.sidebar').on('mouseleave', sidebarCollapse)
    $('.sidebar-pin').on('click', sidebarFix)

    // 初始化 zTree
    let _this = this
    let setting = {
      view: {
        showLine: false,
        showTitle: false,
        selectedMulti: false,
        dblClickExpand: false
      },
      edit: {
        enable: true
      },
      callback: {
        beforeClick (treeId, treeNode, clickFlag) {
          return !(treeNode.isParent && _this.tree.expandNode(treeNode))
        },
        onClick (event, treeId, treeNode) {
          _this.tree.currentNode = treeNode
        },
        onRename (event, treeId, treeNode, isCancel) {
          if (!isCancel) {
            _this.renameNode(treeNode)
          }
        },
        onRemove (event, treeId, treeNode) {
          _this.deleteNode(treeNode)
        }
      }
    }
    this.tree = $.fn.zTree.init($('#tree'), setting, this.nodes)
  },
  methods: {
    createNode (isParent) {
      /**
       * 创建新的节点
       * @param {bool} isParent 是否为父节点
       * @returns undefined
       */
      let categoryName = 'new category ' + this.newCategoryNumber
      this.$emit('createNode', categoryName, isParent)
      this.tree.addNodes(null, { name: categoryName, children: [] }, false)
      this.newCategoryNumber++
    },
    renameNode (treeNode) {
      /**
       * 重命名节点
       * @param {bool} treeNode 即将被重命名的节点
       * @returns undefined
       */
      let path = treeNode.getPath().map(node => node.name).join('/')
      this.$emit('renameNode', path, treeNode.isParent, treeNode.name)
    },
    deleteNode (treeNode) {
      /**
       * 删除节点
       * @param treeNode 即将被删除的节点
       * @returns undefined
       */
      let path = treeNode.getPath().map(node => node.name).join('/')
      this.$emit('deleteNode', path, treeNode.isParent)
    }
  }
}
</script>

<style lang="less" scoped>
@import "../assets/variables/common.less";
.sidebar {
  position: fixed;
  top: 0 !important;
  left: 0 !important;
  right: 0 !important;
  bottom: 0 !important;
  width: @sidebar-width;
  height: 100vh;
  padding-top: @sidebar-header-height;
  overflow: visible;
  box-sizing: border-box;
  border-right: 1px solid @gray-less;
  z-index: @base-index + 1;
  transform: translate(-100%, 0px);
  transition: transform 0.3s ease-in 0s;

  .sidebar-toggle {
    position: absolute;
    top: 40vh;
    right: -1.5rem;
    width: 1.5rem;
    height: 5.5rem;
    padding: 0.25rem;
    background-color: @white-less;
    font-size: 0.75rem;
    line-height: 1rem;
    border-radius: 0 0.3rem 0.3rem 0;
    opacity: 1;
    transition: right 0.25s ease-in 0.2s, opacity 0.35s ease-in 0.2s;
  }

  .sidebar-header {
    position: absolute;
    top: 0;
    left: 0;
    width: @sidebar-width;
    height: @sidebar-header-height;
    background-color: @dark-less;

    .sidebar-plus {
      position: absolute;
      top: @icon-size;
      right: 3 * @icon-size;
      cursor: pointer;
    }

    .sidebar-pin {
      position: absolute;
      top: @icon-size;
      right: @icon-size;
      cursor: pointer;

      &.sidebar-pinned:before {
        transform: rotate(-45deg) scale(0.9);
        color: white;
      }
    }
  }

  .sidebar-body {
    width: 100%;
    height: 100%;
    background-color: @white-less;
    overflow: auto;
  }

  &.sidebar-show {
    transform: translate(0px, 0px);
    transition: transform 0.2s ease 0s;

    .sidebar-toggle {
      right: 1.5rem;
      opacity: 0;
      pointer-events: none;
      transition: right 0.2s ease 0s, opacity 0s ease 0s;
    }
  }
}
</style>
