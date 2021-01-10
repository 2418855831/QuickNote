<template>
  <div class='palette'>
    <div v-for="(color, index) in colors" v-bind:key="index">
      <div class="palette-card"
        @click="copyColor(index)"
        :style="{background: color.hex}">{{ color.name }}
        <Tooltip class="tooltip"
          :msg="color.name + '\nrgb(' + color.rgb + ')\n' + color.hex" />
      </div>
    </div>
  </div>
</template>

<script>
import Tooltip from '@/components/Tooltip'
export default {
  name: 'Palette',
  components: {
    Tooltip
  },
  data () {
    return {
      colors: null
    }
  },
  async created () {
    let res = await this.axios({
      method: 'get',
      url: this.$store.state.apiURL.palette
    })
    if (res.status === 200) {
      if (res.data.hasOwnProperty('error')) {
        console.warn(res.data.error)
        return
      }
      this.colors = res.data.colors
    } else {
      window.alert('颜色加载失败！')
      console.error(res.status)
    }
  },
  methods: {
    copyColor (index) {
      /**
       * @param index 颜色在this.colors属性中的索引下标
       * @return null
       */
      navigator.clipboard.writeText(this.colors[index].hex).then(null, () => window.alert('复制失败'))
    }
  }
}
</script>

<style lang="less" scoped>
@import '../assets/variables/common.less';

.palette {
  display: flex;
  flex-direction: row;
  flex-wrap: wrap;
  justify-content: space-around;
  padding: 1rem;

  .palette-card {
    margin: 0.1rem auto;
    width: 15rem;
    min-width: 15rem;
    color: #fff;
    font-family: '仿宋';
    font-size: 5rem;
    user-select: none;
    position: relative;

    &:hover {
      cursor: pointer;

      .tooltip {
        display: block;
      }
    }
  }
}
</style>
