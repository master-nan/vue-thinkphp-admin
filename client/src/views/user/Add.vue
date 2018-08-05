<template lang="pug">
  div#addUser
    div.content
      el-form(:model="ruleForm" :rules="rules" ref="ruleForm" style="text-align:left" label-width="100px" v-loading="loading")
        el-form-item(label="昵称" prop="nickname")
          el-input(v-model="ruleForm.nickname")
        el-form-item(label="用户名" prop="username")
          el-input(v-model="ruleForm.username")
        el-form-item(label="密码" prop="password")
          el-input(v-model="ruleForm.password" type="password")
        el-form-item(label="部门" prop="d_id")
          el-select(v-model="ruleForm.d_id" filterable placeholder="请选择")
            el-option(v-for="item in listDep" :key="item.id" :label="item.name" :value="item.id")
        el-form-item(label="岗位" prop="p_id")
          el-select(v-model="ruleForm.p_id" filterable placeholder="请选择")
            el-option(v-for="item in listPos" :key="item.id" :label="item.name" :value="item.id")
        el-form-item(label="权限" prop="rule_id")
          el-select(v-model="ruleForm.rule_id" filterable placeholder="请选择")
            el-option(v-for="item in listRule" :key="item.id" :label="item.title" :value="item.id")
        el-form-item(label="是否启用" prop="status")
          el-switch(v-model="ruleForm.status")
        el-form-item
          el-button(type="primary" @click="submitForm('ruleForm')") 创建
          el-button(@click="resetForm('ruleForm')" type="warning" plain) 重置
          el-button(@click="toRouter('userDetail')") 返回
</template>
<script>
import util from '@/utils'
import user from '@/api/user'
import department from '@/api/department'
import position from '@/api/position'
import rule from '@/api/rule'
export default {
  data () {
    return {
      loading: false,
      ruleForm: {
        nickname: '',
        username: '',
        password: '',
        p_id: null,
        d_id: null,
        rule_id: null,
        status: true
      },
      rules: {
        nickname: [
          { required: true, message: '昵称不能为空', trigger: 'blur' }
        ],
        username: [
          { required: true, message: '用户名不能为空', trigger: 'blur' }
        ],
        password: [
          { required: true, message: '密码不能为空', trigger: 'blur' }
        ],
        p_id: [
          { required: true, message: '请选择岗位', trigger: 'change' }
        ],
        d_id: [
          { required: true, message: '请选择部门', trigger: 'change' }
        ],
        rule_id: [
          { required: true, message: '请选择权限', trigger: 'change' }
        ],
        status: [
          { required: true, message: '请选择是否启用', trigger: 'blur' }
        ]
      },
      listPos: [],
      listDep: [],
      listRule: []
    }
  },
  methods: {
    submitForm (formName) {
      this.loading = true
      this.$refs[formName].validate(async (valid) => {
        if (valid) {
          let res = await user.save(this.ruleForm)
          util.response(res, this)
          await util.sleep(500)
          this.loading = false
          if (res.code === 200) {
            util.message('操作成功')
            this.$refs[formName].resetFields()
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
    resetForm (formName) {
      this.$refs[formName].resetFields()
    },
    handleChange (value) {
    },
    toRouter (name) {
      util.toRouter(name, this)
    },
    async getPositions () {
      let res = await position.index({'status': 1})
      util.response(res, this)
      if (res.code === 200) {
        this.listPos = res.data
      }
    },
    async getDepartments () {
      let res = await department.index({'status': 1})
      util.response(res, this)
      if (res.code === 200) {
        this.listDep = res.data
      }
    },
    async getRules () {
      let res = await rule.index()
      util.response(res, this)
      if (res.code === 200) {
        this.listRule = res.data
      }
    }
  },
  mounted () {
    this.getPositions()
    this.getDepartments()
    this.getRules()
  }
}
</script>
<style lang="scss">
#addUser{
  width: 100%;
  height: 100%;
  &>.content{
    width: 30%;
    min-width: 300px;
    padding: 3%;
  }
}
</style>
