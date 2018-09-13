<template lang="pug">
  div.head
    el-breadcrumb(separator="/")
      transition-group(name="breadcrumb")
        el-breadcrumb-item(v-for="(item,index) in items" :key="item.path" :disabled='true')
          span {{item.meta.title}}
          //- span(v-if='item.redirect===""||index==items.length-1') {{item.meta.title}}
          //- router-link(v-else :to="item.redirect||item.path") {{item.meta.title}}
    el-dropdown(@command="handleCommand")
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
      },
      items: null
    }
  },
  computed: {
    userInfo () {
      return this.$store.getters.getUserInfo
    }
  },
  methods: {
    getBreadcrumb () {
      let matched = this.$route.matched.filter(item => item.name)
      const first = matched[0]
      if (first && first.name !== 'index') {
        matched = [{ path: '/index', meta: { title: '首页' } }].concat(matched)
      }
      this.items = matched
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
<style lang="less" scoped>
.head{
  box-shadow: 0px 4px 5px #e3e3e3;
  -moz-box-shadow: 0px 4px 5px #e3e3e3;
  position: fixed;
  width: calc(100% - 200px);
  z-index:50;
  left:200px;
}
.el-breadcrumb{
    float: left;
    margin-left: 20px;
    line-height: 60px;
    height: 60px;
    width: 500px;
    .no-redirect {
      color: #97a8be;
      cursor: text;
    }
}

.el-dropdown{
    float: right;
    margin-right: 20px;
    line-height: 60px;
    height: 60px;
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
</style>
