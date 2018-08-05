<template lang="pug">
  div#app-home
    div
    Sidebar.sidebar-content(:class="{'hideSidebar':isCollapse}")
    div.home-body(:class="{'home-body-hidesidebar':isCollapse}")
      Top
      section.content
        //- transition(v-on:before-enter="beforeEnter" v-on:enter="enter" v-on:leave="leave" v-bind:css="false")
        transition(name="fade-transform" mode="out-in")
          router-view
</template>
<script>
import Sidebar from '@/views/components/Sidebar'
import Top from '@/views/components/Top'
import Velocity from 'velocity-animate'
export default{
  name: 'home',
  components: {
    Sidebar,
    Top
  },
  computed: {
    isCollapse () {
      return !this.$store.getters.getSidebarStatus
    }
  },
  methods: {
    beforeEnter: function (el) {
      el.style.opacity = 0
      el.style.transformOrigin = 'left'
    },
    enter: function (el, done) {
      Velocity(el, { opacity: 1, fontSize: '1.4em' }, { duration: 100 })
      Velocity(el, { fontSize: '1em' }, { complete: done })
    },
    leave: function (el, done) {
      Velocity(el, { translateX: '15px', rotateZ: '50deg' }, { duration: 200 })
      Velocity(el, { rotateZ: '100deg' }, { loop: 2 })
      Velocity(el, {
        rotateZ: '45deg',
        translateY: '30px',
        translateX: '30px',
        opacity: 0
      }, { complete: done }
      )
    }
  }

}
</script>
<style lang="scss">

/*fade-transform*/
.fade-transform-leave-active,
.fade-transform-enter-active {
  transition: all .5s;
}
.fade-transform-enter {
  opacity: 0;
  transform: translateX(-30px);
}
.fade-transform-leave-to {
  opacity: 0;
  transform: translateX(30px);
}

#app-home{
  width: 100%;
  height: 100%;
  position: relative;

  .sidebar-content{
    width: 200px;
    height: 100%;
    overflow: hidden;
    position: fixed;
    top:0px;
    bottom:0px;
    left: 0px;
    z-index:100;

    .el-submenu {
      overflow: hidden;
    }
  }

  .hideSidebar {
    width: 36px !important;
    .el-submenu {
      overflow: hidden;
      &>.el-submenu__title {
        padding-left: 10px !important;
        .el-submenu__icon-arrow {
          display: none;
        }
        span {
          height: 0;
          width: 0;
          overflow: hidden;
          visibility: hidden;
          display: inline-block;
        }
      }
    }

    .el-menu-item{
      padding-left: 10px !important;
      position: relative;
      .el-tooltip {
        padding: 0 10px !important;
      }
      &>span {
          height: 0;
          width: 0;
          overflow: hidden;
          visibility: hidden;
          display: none;
      }
    }

    .el-menu--collapse {
      .el-submenu {
        &>.el-submenu__title {
          &>span {
            height: 0;
            width: 0;
            overflow: hidden;
            visibility: hidden;
            display: inline-block;
          }
        }
      }
    }
  }

  .home-body{
    margin-left: 200px;
    position: relative;
    height: 100%;

    .content{
      height: 100%;
      min-height: calc(100vh - 50px);
      padding-top:60px;
      position: relative;
    }
  }

  .home-body-hidesidebar{
    margin-left: 36px;
  }
}

// .slide-fade-enter-active {
//   transition: all .1s ease;
// }
// .slide-fade-leave-active {
//   transition: all .6s cubic-bezier(1.0, 0.5, 0.8, 1.0);
// }
// .slide-fade-enter, .slide-fade-leave-to
// /* .slide-fade-leave-active 用于 2.1.8 以下版本 */ {
//   transform: translateX(10px);
//   opacity: 0;
// }
</style>
