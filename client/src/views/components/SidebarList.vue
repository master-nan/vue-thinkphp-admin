<template lang="pug">
  <div v-if="!item.hidden&&item.children">
    router-link(v-if= "isShow(item)" :to="combinePath(kid.path)")
        el-menu-item(:index="combinePath(item.children[0].path,1)")
          i.fl(v-if="item.children[0].meta&&item.children[0].meta.icon")
            svg.icon.fs-20(aria-hidden="true")
              use(:xlink:href="item.children[0].meta.icon")
          span(v-if="item.children[0].meta&&item.children[0].meta.title" slot="title") {{item.children[0].meta.title}}
    el-submenu(v-else :index="item.name||item.path")
      template(slot="title")
        i.fl(v-if="item.meta&&item.meta.icon" slot="prefix")
          svg.icon.fs-20(aria-hidden="true")
            use(:xlink:href="item.meta.icon")
        span(v-if="item.meta&&item.meta.title" slot="title") {{item.meta.title}}
      template.aaa(v-for="child in item.children" v-if="!child.hidden")
        //- SidebarList(:is-nest="true" class="nest-menu" v-if="child.children&&child.children.length>0" :item="child" :key="child.path" :base-path="combinePath(child.path)")
        router-link(:to="combinePath(child.path)" :key="child.name" )
          el-menu-item(:index="combinePath(child.path)")
            //- i.fl(v-if="child.meta&&child.meta.icon" :class="child.meta.icon")
            span(v-if="child.meta&&child.meta.title" slot="title") {{child.meta.title}}
  </div>
</template>
<script>
import path from 'path'
export default {
  data () {
    return {
      kid: null
    }
  },
  props: [
    'item',
    'basePath'
  ],
  computed: {
  },
  methods: {
    isShow (item) {
      if (item.show) {
        return false
      }
      if (item.children[0].children) {
        return false
      }
      let itemFilter = item.children.filter(e => {
        if (e.hidden) {
          return false
        } else {
          this.kid = item
          return true
        }
      })
      if (itemFilter.length === 1) {
        return true
      }
      return false
    },
    combinePath (e) {
      return path.resolve(this.basePath, e)
    }
  },
  created () {
    // console.log(this.item)
  }
}
</script>
<style lang="scss">

</style>
