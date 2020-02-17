<template>
  <div class="sidebar">
    <!--侧栏按钮-->
    <div class="sidebar-toggle">>展开目录</div>
    <!--侧栏头部-->
    <div class="sidebar-header">
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
      tree: {},
      nodes: this.propNodes || []
    }
  },
  mounted () {
    // Setup event handler.
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

    // initialize zTree
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
        beforeRemove (treeId, treeNode) {
          return confirm('Are you sure you want to delete it?')
        },
        onClick (event, treeId, treeNode) {
          _this.tree.currentNode = treeNode
        }
      }
    }
    this.tree = $.fn.zTree.init($('#tree'), setting, this.nodes)
  }
}
</script>

<style lang="less" scoped>
@import "../assets/variables/common.less";
.sidebar {
  position: fixed;
  top: 0px !important;
  left: 0px !important;
  right: 0px !important;
  bottom: 0px !important;
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
    top: 0px;
    left: 0px;
    width: @sidebar-width;
    height: @sidebar-header-height;
    background-color: @dark-less;

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
