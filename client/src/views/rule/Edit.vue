<template lang="pug">
  div#editRule
    div.content
      el-form(:model="ruleForm" :rules="rules" ref="ruleForm" style="text-align:left" label-width="100px" v-loading="loading")
        el-form-item(label="权限名称" prop="title")
          el-input(v-model="ruleForm.title")
        el-form-item(label="权限选择" prop="rs")
          el-tree(:data="data" show-checkbox node-key="id" ref="tree" :check-strictly="true" @check-change="handleChange" :default-checked-keys="keys" highlight-current :props="defaultProps")
        el-form-item(label="备注" prop="remark")
          el-input(v-model="ruleForm.remark")
        el-form-item(label="是否启用" prop="status")
          el-switch(v-model="ruleForm.status")
        el-form-item
          el-button(type="primary" @click="submitForm('ruleForm')") 更新
          el-button(@click="toRouter('ruleDetail')") 返回
</template>
<script>
import util from '@/utils'
import rule from '@/api/rule'
import menu from '@/api/menu'
import _ from 'lodash'
export default {
  data () {
    return {
      loading: false,
      ruleForm: {
        title: '',
        rs: '',
        remark: '',
        status: true
      },
      rules: {
        title: [
          { required: true, message: '请填写权限名称', trigger: 'blur' }
        ],
        keys: [
          { required: true, message: '请选择权限', trigger: 'blur' }
        ]
      },
      data: [],
      defaultProps: {
        children: 'children',
        label: 'title'
      },
      keys: []
    }
  },
  methods: {
    submitForm (formName) {
      this.loading = true
      this.$refs[formName].validate(async (valid) => {
        if (valid) {
          let res = await rule.update(this.ruleForm)
          util.response(res, this)
          await util.sleep(500)
          this.loading = false
          if (res.code === 200) {
            util.message('操作成功')
            await util.sleep(200)
            this.toRouter('ruleDetail')
          } else {
            util.message(res.error, 'error')
          }
        } else {
          console.log('error submit!!')
          this.loading = false
          return false
        }
      })
    },
    handleChange () {
      this.keys = this.$refs.tree.getCheckedKeys()
      if (this.$refs.tree.getCheckedKeys().length) {
        this.ruleForm.rs = _.join(this.keys, ',')
      }
    },
    toRouter (name) {
      util.toRouter(name, this)
    },
    async getRuleById () {
      this.loading = true
      let id = this.$route.params.id ? this.$route.params.id : 0
      let res = await rule.read(id)
      util.response(res, this)
      await util.sleep(500)
      this.loading = false
      if (res.code === 200) {
        this.ruleForm.title = res.data.title
        this.ruleForm.status = !!res.data.status
        this.keys = _.split(res.data.rs, ',')
        console.log(this.keys)
        this.ruleForm.remark = res.data.remark
        this.ruleForm.id = res.data.id
      } else {
        util.message(res.error, 'error')
        this.toRouter('ruleDetail')
      }
    },
    async getMenus () {
      this.loading = true
      let res = await menu.index()
      util.response(res, this)
      await util.sleep(500)
      this.loading = false
      if (res.code === 200) {
        this.data = res.data
      }
    }
  },
  mounted () {
    this.getMenus()
  },
  created () {
    this.getRuleById()
  }
}
</script>
<style lang="scss">
#editRule{
  width: 100%;
  height: 100%;
    &>.content{
    width: 30%;
    min-width: 300px;
    padding: 3%;
  }
}
</style>
