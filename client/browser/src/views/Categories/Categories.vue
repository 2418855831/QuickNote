<template>
  <div class="categories">
    <ul class="categories-list">
      <li class="categories-item"
          v-for="(category, index) in categories"
          :key="index"
          @click="pushTo({ name: 'Category', params: { name: category.name } })">
        <i class="bookmark-icon"></i>
        <span class="category-name">{{ category.name }}</span>
      </li>
    </ul>
  </div>
</template>

<script>
export default {
  name: 'Categories',
  data () {
    return {
      categories: [] // 分类列表：name, children
    }
  },
  async created () {
    let res = await this.axios({
      method: 'get',
      url: this.$store.state.apiURL.categories_index
    })
    if (res.status === 200) {
      if (res.data.hasOwnProperty('error')) {
        console.warn(res.data.error)
        return
      }
      this.categories = res.data
    }
  },
  methods: {
    pushTo ({ name, path, params }) {
      if (name) {
        if (this.$route.name !== name) {
          this.$router.push({ name, params })
        }
      } else if (path) {
        if (this.$route.path !== path) {
          this.$router.push({ path, params })
        }
      }
    }
  }
}
</script>

<style lang="less" scoped>
@import '../../assets/variables/common.less';
.categories {
  margin: 0 10%;

  .categories-list {
    list-style-type: none;
    display: flex;

    .categories-item {
      margin: 1rem;
      padding: 0.4rem;
      border: 1px solid rgba(0, 0, 0, 0.1);
      border-radius: 0.25rem;
      cursor: pointer;
      box-shadow: 0 3px 5px rgba(0, 0, 0, 0.1);
      transition: 0.25s;
      font-size: 14px;

      i:before, .category-name {
        transition: 0.25s;
      }

      &:hover {
        border-color: #70b6ff;
        box-shadow: 0 3px 5px #cce5ff;

        i:before, .category-name {
          color: @accent;
        }
      }
    }
  }
}
</style>
