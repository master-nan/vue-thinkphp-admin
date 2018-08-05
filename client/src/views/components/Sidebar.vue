<template lang="pug">
  el-scrollbar(wrapClass="scrollbar-wrapper")
    //- el-menu(mode="vertical" class="el-menu-vertical-demo"  @open="handleOpen" @close="handleClose" :collapse="isCollapse" :default-active="$route.path")
    el-menu(mode="vertical" class="el-menu-vertical-demo" background-color="#1c3a99" text-color="#b8c9ff" active-text-color="#fff" @open="handleOpen" @close="handleClose" :collapse="isCollapse" :default-active="$route.path")
      SidebarList(v-for="route in getPrivateRouter" :item="route" :base-path="route.path" :key="route.name")
</template>
<script>
import SidebarList from '@/views/components/SidebarList'
import { mapGetters } from 'vuex'
export default {
  data () {
    return {
      // isCollapse: false
    }
  },
  components: {
    SidebarList
  },
  computed: {
    ...mapGetters([
      'getPrivateRouter'
    ]),
    isCollapse () {
      return !this.$store.getters.getSidebarStatus
    }
  },
  methods: {
    handleOpen (key, keyPath) {
      console.log(key, keyPath)
    },
    handleClose (key, keyPath) {
      console.log(key, keyPath)
    }
  },
  mounted () {
  }
}
</script>
<style lang="scss">

.scrollbar-wrapper{
  overflow-x: hidden !important;
  height: 100%;

  .el-scrollbar__view{
    position: relative;
    height: 100%;
    .el-menu{
      height: 100%;
      font-weight: 500;
    }

  }

  .el-submenu .el-menu-item {
    min-width: 180px !important;
    background-color: #3756b9 !important;
    &:hover {
      background-color: #5977d6 !important;
    }
    &.is-active {
      // background-color: #5977d6 !important;
    }
  }

}

</style>
