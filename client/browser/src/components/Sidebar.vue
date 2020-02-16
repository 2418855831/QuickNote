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
import '../../static/ztree/css/ztree.css'
export default {
  name: 'Sidebar',
  props: {
    propNodes: Array
  },
  data () {
    return {
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
        $('html').css('padding-left', '0vw')
        $('.sidebar').on('mouseleave', sidebarCollapse)
      } else {
        // fix sidebar
        $('.sidebar-pin').addClass('sidebar-pinned')
        $('html').css('padding-left', '16vw')
        $('.sidebar').off('mouseleave', sidebarCollapse)
      }
    }

    $('.sidebar-toggle').on('mouseenter', sidebarExpand)
    $('.sidebar').on('mouseleave', sidebarCollapse)
    $('.sidebar-pin').on('click', sidebarFix)

    // initialize zTree
    let zTreeObj
    let setting = {
      view: {
        showLine: false,
        selectedMulti: false,
        dblClickExpand: false
      },
      callback: {
        beforeClick (treeId, treeNode, clickFlag) {
          return zTreeObj.expandNode(treeNode) === null
        }
      }
    }
    /*
    let zNodes = [
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
    */
    console.log(this.nodes)
    zTreeObj = $.fn.zTree.init($('#tree'), setting, this.nodes)
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
  z-index: 1501;
  transform: translate3d(-100%, 0px, 0px);
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
    transform: translate3d(0px, 0px, 0px);
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
