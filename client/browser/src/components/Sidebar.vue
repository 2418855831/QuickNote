<template>
  <div class="sidebar">
    <!--侧栏按钮-->
    <div class="sidebar-toggle">>展开目录</div>
    <!--侧栏头部-->
    <div class="sidebar-header">
      <span class="sidebar-plus plus-icon" @click="createNode(null, true)"></span>
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
      newNumber: 1 // 新建分类的编号
    }
  },
  mounted () {
    // eslint-disable-next-line
    let isHere = true
    let isFixed = false
    // 创建侧边栏事件处理函数
    function sidebarExpand () {
      // expand sidebar
      $('.sidebar').off('mouseleave', sidebarCollapse)
      setTimeout(() => {
        if (!isFixed) {
          $('.sidebar').on('mouseleave', sidebarCollapse)
        }
      }, 1500)
      setTimeout(() => {
        if (!isHere && !isFixed) {
          sidebarCollapse()
        }
        $('body').off('mousemove', sidebarCollapseEx)
      }, 1500)
      $('.sidebar').addClass('sidebar-show')
      $('body').on('mousemove', sidebarCollapseEx)
    }
    function sidebarCollapse () {
      // collapse sidebar
      $('.sidebar').removeClass('sidebar-show')
    }
    function sidebarCollapseEx (e) {
      if (!($.contains($('.sidebar')[0], e.target) || $('.sidebar')[0] === e.target)) {
        isHere = false
      } else {
        isHere = true
      }
    }
    function sidebarFix () {
      // fix or unfix sidebar
      if ($('.sidebar-pinned').length) {
        // unfix sidebar
        isFixed = false
        $('.sidebar-pin').removeClass('sidebar-pinned')
        $('#app').css('padding-left', '0vw')
        $('.sidebar').on('mouseleave', sidebarCollapse)
      } else {
        // fix sidebar
        isFixed = true
        $('.sidebar-pin').addClass('sidebar-pinned')
        $('#app').css('padding-left', '16vw')
        $('.sidebar').off('mouseleave', sidebarCollapse)
      }
    }

    $('.sidebar-toggle').on('mouseenter', sidebarExpand)
    // $('.sidebar').on('mouseleave', sidebarCollapse)
    $('.sidebar-pin').on('click', sidebarFix)

    // 初始化 zTree
    let _this = this
    let setting = {
      view: {
        showLine: false,
        showTitle: false,
        selectedMulti: false,
        dblClickExpand: false,
        addHoverDom: (treeId, treeNode) => {
          // 检查当前节点是否处于编辑状态或者自定义按钮是否已经被创建过了
          if (treeNode.editNameFlag ||
            $('#' + treeNode.tId + '_create_file').index() > 0 ||
            $('#' + treeNode.tId + '_create_directory').index() > 0) {
            return
          }
          // 当前指向的DOM节点
          let currentNode = $('#' + treeNode.tId + '_span')
          // 创建文档/目录按钮
          let createFileStr = '<span class="button create-file" id="' + treeNode.tId + '_create_file' + '" ></span>'
          let createDirectoryStr = '<span class="button create-directory" id="' + treeNode.tId + '_create_directory' + '" ></span>'
          currentNode.after(createDirectoryStr)
          currentNode.after(createFileStr)
          let createFileButton = $('#' + treeNode.tId + '_create_file')
          let createDirectoryButton = $('#' + treeNode.tId + '_create_directory')
          if (createFileButton) {
            createFileButton.on('click', function () {
              _this.createNode(treeNode, false)
            })
          }
          if (createDirectoryButton) {
            createDirectoryButton.on('click', function () {
              _this.createNode(treeNode, true)
            })
          }
        },
        removeHoverDom: (treeId, treeNode) => {
          $('#' + treeNode.tId + '_create_file').off().remove()
          $('#' + treeNode.tId + '_create_directory').off().remove()
        }
      },
      edit: {
        enable: true,
        renameTitle: '',
        removeTitle: ''
      },
      callback: {
        onClick (event, treeId, treeNode) {
          if (!treeNode.isParent) {
            _this.$emit('get', treeNode.getPath().map(node => node.name))
          }
          _this.tree.currentNode = treeNode
        },
        beforeRename (treeId, treeNode, newName, isCancel) {
          if (!isCancel) {
            _this.renameNode(treeNode, newName)
            return true
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
    createNode (parentNode, isParent) {
      /**
       * 创建新的节点
       * @param {node} parentNode 即将被新建的节点的父节点
       * @param {bool} isParent 是否为父节点
       * @returns undefined
       */
      let newNodeName = 'new ' + this.newNumber
      if (!parentNode) { // 创建目录
        this.$emit('createNode', { categoryName: newNodeName })
        this.tree.addNodes(null, { name: newNodeName, children: [] })
      } else { // 创建节点
        let categoryName = parentNode.getPath()[0].name
        this.$emit('createNode', { categoryName: categoryName, title: newNodeName })
        this.tree.addNodes(parentNode, { name: newNodeName })
      }
      this.newNumber++
    },
    renameNode (treeNode, newName) {
      /**
       * 重命名节点
       * @param {bool} treeNode 即将被重命名的节点
       * @returns undefined
       */
      let path = treeNode.getPath().map(node => node.name)
      this.$emit('renameNode', path, treeNode.isParent, newName)
    },
    deleteNode (treeNode) {
      /**
       * 删除节点
       * @param treeNode 即将被删除的节点
       * @returns undefined
       */
      let path = treeNode.getPath().map(node => node.name)
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
  width: @sidebar-width;
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
    transition: right 0.2s ease-in 0.3s, opacity 0.2s ease-in 0.3s;
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
    overflow-y: auto;
    overflow-x: auto;
  }

  &.sidebar-show {
    transform: translate(0px, 0px);
    transition: transform 0.2s ease 0s;

    .sidebar-toggle {
      right: 1.5rem;
      opacity: 0;
      pointer-events: none;
      transition: right 0s ease 0s, opacity 0s ease 0s;
    }
  }
}
</style>
