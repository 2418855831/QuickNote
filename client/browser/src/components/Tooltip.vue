<template>
  <div class="tooltip">{{ msg }}</div>
</template>

<script>
export default {
  name: 'Tooltip',
  props: {
    msg: {
      type: String,
      default: 'This is a tooltip~'
    }
  }
}
</script>

<style lang="less" scoped>
@import '../assets/variables/mixins.less';

.tooltip {
  padding: 0.5rem;
  position: absolute;
  background-color: rgb(58,76,84);
  color: #fff;
  top: 75%;
  left: 50%;
  transform: translateX(-50%);
  z-index: 10;
  border-radius: 5px;
  box-shadow: 1px 1px 20px #aaa;
  user-select: none;
  display: none;
  width: auto;

  .reset-text();
  font-size: 1rem;
  text-align: center;
  white-space: pre;

  // 三角形
  &:after {
    content: "";
    display: block;
    position: absolute;
    width: 10px;
    height: 10px;
    background-color: rgb(58,76,84);
    z-index: 20;
    left: 50%;
    transform-origin: 50% 50%;
    transform: rotate(45deg) translateX(-50%);
    top: -1px;
  }
}
</style>
