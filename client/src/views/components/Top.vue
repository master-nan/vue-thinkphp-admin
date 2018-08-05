<template lang="pug">
  el-menu#top(mode="horizontal")
    div.fold(:class="{'angle':isCollapse}")
      i(@click="setSidebar")
        svg.icon.fs-20(aria-hidden="true")
          use(xlink:href="#nan-icon-caidanguanli")
    el-breadcrumb(separator="/")
      transition-group(name="breadcrumb")
        el-breadcrumb-item(v-for="(item,index)  in breadcrumbList" :key="item.path" v-if='item.meta.title')
          span.no-redirect(v-if='item.redirect==="noredirect"||index==breadcrumbList.length-1') {{item.meta.title}}
          router-link(v-else :to="item.redirect||item.path") {{item.meta.title}}
    el-dropdown(:class="{'el-dropdown--collapse':isCollapse}" @command="handleCommand")
      div
        span.name  {{userInfo['nickname']}}
        img.el-dropdown-link(v-if="userInfo['avatar']" :src="userInfo['avatar']")
        img.el-dropdown-link(v-else src="@/assets/image/avatar.jpg")
        i.el-icon-arrow-down.el-icon--right
      el-dropdown-menu(slot="dropdown")
        el-dropdown-item(command="info") 个人信息
        el-dropdown-item(command="change") 修改密码
        el-dropdown-item(command="logout") &nbsp;&nbsp;&nbsp;退&nbsp;&nbsp;出&nbsp;&nbsp;&nbsp;
    el-dialog(v-loading="loading" width="30%" :append-to-body="true" title="修改密码" :before-close="closeDialog" :visible.sync="dialogFormVisible")
      el-form(:model="ruleForm" ref="ruleForm" :rules="rules")
        el-form-item(label="旧密码" label-width="70px" prop="pass1")
          el-input(v-model="ruleForm.pass1" auto-complete="off" type="password")
        el-form-item(label="新密码" label-width="70px" prop="pass2")
          el-input(v-model="ruleForm.pass2" auto-complete="off" type="password")
      div.dialog-footer(slot="footer")
        el-button(@click="closeDialog") 取 消
        el-button(type="primary" @click="submit") 确 定
</template>
<script>
// import SidebarList from '@/views/components/SidebarList'
import comm from '@/api/comm'
import user from '@/api/user'
import util from '@/utils'
export default {
  data () {
    return {
      loading: false,
      breadcrumbList: null,
      dialogFormVisible: false,
      ruleForm: {
        pass1: null,
        pass2: null
      },
      rules: {
        pass1: [
          { required: true, message: '旧密码不能为空', trigger: 'blur' }
        ],
        pass2: [
          { required: true, message: '新密码不能为空', trigger: 'blur' }
        ]
      }
    }
  },
  components: {
    // SidebarList
  },
  computed: {
    isCollapse () {
      return !this.$store.getters.getSidebarStatus
    },
    userInfo () {
      return this.$store.getters.getUserInfo
    }
  },
  methods: {
    setSidebar () {
      this.$store.dispatch('setSidebarStatus', !this.$store.getters.getSidebarStatus)
    },
    getBreadcrumb () {
      let matched = this.$route.matched.filter(item => item.name)
      const first = matched[0]
      if (first && first.name !== 'index') {
        matched = [{ path: '/index', meta: { title: '首页' } }].concat(matched)
      }
      this.breadcrumbList = matched
    },
    async handleCommand (command) {
      switch (command) {
        case 'logout':
          let res = await comm.logout()
          util.response(res, this)
          if (res.code === 200) {
            util.message('您已退出')
            await util.sleep(300)
            util.clearSome(this)
          }
          break
        case 'change':
          this.dialogFormVisible = true
          break
        case 'info':
          util.toRouter('info', this)
          break
        default:
          console.log(command)
      }
    },
    closeDialog () {
      this.dialogFormVisible = false
      this.$refs['ruleForm'].resetFields()
    },
    async submit () {
      this.loading = true
      this.$refs['ruleForm'].validate(async (valid) => {
        if (valid) {
          let res = await user.changePass(this.ruleForm)
          util.response(res, this)
          await util.sleep(500)
          this.loading = false
          if (res.code === 200) {
            util.message('密码修改成功,请重新登录')
            await util.sleep(600)
            util.clearSome(this)
          } else {
            util.message(res.error, 'error')
          }
        } else {
          console.log('error submit!!')
          this.loading = false
          return false
        }
      })
    }
  },
  mounted () {
  },
  created () {
    this.getBreadcrumb()
  },
  watch: {
    $route () {
      this.getBreadcrumb()
    }
  }
}
</script>
<style lang="scss">
$size: 60px;
#top{
  height: $size;
  line-height: $size;
  box-shadow: 0px 4px 5px #e3e3e3;
  -moz-box-shadow: 0px 4px 5px #e3e3e3;
  position: fixed;
  width: 100%;
  z-index:50;

  .fold{
    float: left;
    line-height: $size;
    height: $size;
    width: $size;
    transition: transform 0.5s;
    cursor:pointer
  }
  .angle {
    transition: transform 0.5s;
    transform: rotate(90deg);
  }

  .el-breadcrumb{
    float: left;
    line-height: $size;
    height: $size;

    .no-redirect {
      color: #97a8be;
      cursor: text;
    }
  }

  .el-dropdown{
    float: right;
    line-height: $size;
    height: $size;
    margin-right: 220px;
    .name{
      display: block;
      margin-right: 10px;
      float:left
    }
    img{
      display: block;
      width: 40px;
      height: 40px;
      border-radius: 5px;
      margin-top: 10px;
      display: inline-block;
    }
  }

  .el-dropdown--collapse{
    margin-right: 56px;
  }

}
</style>
