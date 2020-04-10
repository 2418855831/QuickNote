<template>
  <div class="not-found">
    <h1>404 Not Found</h1>
    <h4>哦嚯，路由君歇菜了...</h4>
    <img class="img" src="/static/images/404.jpg">
  </div>
</template>

<script>
export default {
  name: 'NotFound'
}
</script>

<style lang="less" scoped>
.not-found {
  .img {
    height: 70vh;
  }
}
</style>
