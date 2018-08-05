<template lang="pug">
  div#editMenu
    div.content
      el-form(:model="ruleForm" :rules="rules" ref="ruleForm" style="text-align:left" label-width="120px" v-loading="loading")
        el-form-item(label="菜单标题" prop="title")
          el-input(v-model="ruleForm.title")
        el-form-item(label="父节点" prop="pids")
          el-cascader(placeholder="试试搜索：菜单" :options="options" v-model="ruleForm.pids"  @change="handleChange" change-on-select filterable)
        el-form-item(label="路由名称" prop="name")
          el-input(v-model="ruleForm.name" placeholder="请确保值唯一")
        el-form-item(label="显示完整菜单" prop="show")
          el-switch(v-model="ruleForm.show")
        el-form-item(label="左侧隐藏" prop="hidden")
          el-switch(v-model="ruleForm.hidden")
        el-form-item(label="菜单主体" prop="component")
          el-input(v-model="ruleForm.component" placeholder="示例：客户端components.js中")
        el-form-item(label="访问路径" prop="path")
          el-input(v-model="ruleForm.path" placeholder="示例：/index (子菜单请去掉/)")
        el-form-item(label="重定向" prop="redirect")
          el-input(v-model="ruleForm.redirect" placeholder="示例：/index 子节点无效")
        el-form-item(label="排序" prop="sort")
          el-input-number(v-model="ruleForm.sort" :min="0")
        el-form-item
          el-button(type="primary" @click="submitForm('ruleForm')") 更新
          el-button(@click="toRouter('menuDetail')") 返回
</template>
<script>
import util from '@/utils'
import menu from '@/api/menu'
export default {
  data () {
    return {
      loading: false,
      ruleForm: {
        title: '',
        pids: ['0'],
        pid: 0,
        name: '',
        icon: '',
        component: '',
        path: '',
        redirect: '',
        show: true,
        hidden: false,
        sort: 0
      },
      options: [{
        value: 0,
        label: '根节点'
      }],
      list: [],
      rules: {
        name: [
          { required: true, message: '请输入活动名称', trigger: 'blur' }
        ],
        title: [
          { required: true, message: '请填写标题', trigger: 'blur' }
        ],
        component: [
          { required: true, message: '请填写菜单主体', trigger: 'blur' }
        ],
        path: [
          { required: true, message: '请填写访问路径', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    submitForm (formName) {
      this.loading = true
      this.$refs[formName].validate(async (valid) => {
        if (valid) {
          if (this.ruleForm.pids.length) {
            this.ruleForm.pid = this.ruleForm.pids[0]
          }
          let res = await menu.update(this.ruleForm)
          util.response(res, this)
          await util.sleep(500)
          this.loading = false
          if (res.code === 200) {
            util.message('操作成功')
            await util.sleep(200)
            this.toRouter('menuDetail')
          } else {
            util.message(res.error, 'error')
          }
        } else {
          this.loading = false
          console.log('error submit!!')
          return false
        }
      })
    },
    handleChange (value) {
      console.log(this.ruleForm.pid)
    },
    toRouter (name) {
      util.toRouter(name, this)
    },
    async getMenuById () {
      this.loading = true
      let id = this.$route.params.id ? this.$route.params.id : 0
      let res = await menu.read(id)
      util.response(res, this)
      await util.sleep(500)
      this.loading = false
      if (res.code === 200) {
        this.ruleForm = res.data
        this.ruleForm.show = !!this.ruleForm.show
        this.ruleForm.hidden = !!this.ruleForm.hidden
        this.ruleForm.pids = [this.ruleForm.pid]
      } else {
        util.message(res.error, 'error')
        this.toRouter('menuDetail')
      }
    },
    async getMenus () {
      let res = await menu.index()
      util.response(res, this)
      if (res.code === 200) {
        res.data.unshift({value: 0, label: '根节点'})
        this.options = res.data
      }
    }
  },
  mounted () {
    this.getMenuById()
    this.getMenus()
  }
}
</script>
<style lang="scss">
#editMenu{
  height: 100%;
  width: 100%;
  &>.content{
    width: 30%;
    min-width: 300px;
    padding: 3%;
  }
}
</style>
