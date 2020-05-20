<template>
  <div class="scroll-to-top" @click="scrollToTop">
    <i class="chevron-up-icon"></i>
  </div>
</template>

<script>
export default {
  name: 'ScrollToTop',
  methods: {
    scrollToTop () {
      scrollTo({
        top: 0,
        left: 0,
        behavior: 'smooth'
      })
    }
  }
}
</script>

<style lang="less" scoped>
@import '../assets/variables/common.less';

.scroll-to-top {
  position: fixed;
  bottom: 1.5rem;
  right: 1.5rem;
  width: 2rem;
  height: 2rem;
  border-radius: 50%;
  background-color: @gray-less;
  z-index: @base-index + 1;
  text-align: center;
  display: flex;
  justify-content: center;
  flex-direction: column;

  i {
    &:before {
      font-size: 1.5rem;
    }
  }

  &:hover {
    cursor: pointer;
    width: 2.5rem;
    height: 2.5rem;
    bottom: 1.25rem;
    right: 1.25rem;
    transition: all 100ms;
  }
}
</style>
