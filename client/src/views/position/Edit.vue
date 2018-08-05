<template lang="pug">
  div#editPosition
    div.content
      el-form(:model="ruleForm" :rules="rules" ref="ruleForm" style="text-align:left" label-width="80px" v-loading="loading")
        el-form-item(label="岗位名称" prop="name")
          el-input(v-model="ruleForm.name")
        el-form-item(label="备注" prop="remark")
          el-input(v-model="ruleForm.remark")
        el-form-item
          el-button(type="primary" @click="submitForm('ruleForm')") 更新
          el-button(@click="toRouter('positionDetail')") 返回
</template>
<script>
import util from '@/utils'
import position from '@/api/position'
export default {
  data () {
    return {
      loading: false,
      ruleForm: {
        name: '',
        remark: '',
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
          let res = await position.update(this.ruleForm)
          util.response(res, this)
          await util.sleep(500)
          this.loading = false
          if (res.code === 200) {
            util.message('操作成功')
            await util.sleep(200)
            this.toRouter('positionDetail')
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
    },
    async getPositionById () {
      this.loading = true
      let id = this.$route.params.id ? this.$route.params.id : 0
      let res = await position.read(id)
      util.response(res, this)
      await util.sleep(500)
      this.loading = false
      if (res.code === 200) {
        this.ruleForm.name = res.data.name
        this.ruleForm.remark = res.data.remark
        this.ruleForm.id = res.data.id
        this.ruleForm.status = !!res.data.status
      } else {
        util.message(res.error, 'error')
        this.toRouter('menuDetail')
      }
    }
  },
  mounted () {
    this.getPositionById()
  }
}
</script>
<style lang="scss">
#editPosition{
  width: 100%;
  height: 100%;
  &>.content{
    width: 30%;
    min-width: 300px;
    padding: 3%;

    .bt{
      .el-form-item__content{
        margin-left: 10px !important;
      }
    }
  }
}
</style>
