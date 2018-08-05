<template lang="pug">
  div#addDepartment
    div.content
      el-form(:model="ruleForm" :rules="rules" ref="ruleForm" style="text-align:left" label-width="100px" v-loading="loading")
        el-form-item(label="部门名称" prop="name")
          el-input(v-model="ruleForm.name")
        el-form-item
          el-button(type="primary" @click="submitForm('ruleForm')") 创建
          el-button(@click="resetForm('ruleForm')" type="warning" plain) 重置
          el-button(@click="toRouter('departmentDetail')") 返回
</template>
<script>
import util from '@/utils'
import department from '@/api/department'
export default {
  data () {
    return {
      loading: false,
      ruleForm: {
        name: '',
        status: true
      },
      rules: {
        name: [
          { required: true, message: '岗位', trigger: 'blur' }
        ]
      }
    }
  },
  methods: {
    submitForm (formName) {
      this.loading = true
      this.$refs[formName].validate(async (valid) => {
        if (valid) {
          let res = await department.save(this.ruleForm)
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
      console.log(this.ruleForm.pid)
    },
    toRouter (name) {
      util.toRouter(name, this)
    }
  }
}
</script>
<style lang="scss">
#addDepartment{
  width: 100%;
  height: 100%;
  &>.content{
    width: 30%;
    min-width: 300px;
    padding: 3%;
  }
}
</style>
