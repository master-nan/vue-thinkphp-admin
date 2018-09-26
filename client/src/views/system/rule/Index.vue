<template lang="pug">
  div
    el-button.mb-20(type="primary" icon="el-icon-plus" @click="add") 添加
    el-table(:data="data" border v-loading="loading")
      el-table-column(prop="index" label="序号" align="center" width="100")
        template(slot-scope="scope")
          span {{scope.$index + 1}}
      el-table-column(prop="name" label="名称" align="center")
      el-table-column(prop="rs" label="权限ID" align="center")
      el-table-column(prop="remark" label="备注" align="center")
      el-table-column(prop="status" label="状态" align="center")
        template(slot-scope="scope")
          el-tag(:type="scope.row.status | statusFilterType") {{scope.row.status | statusFilter}}
      el-table-column(label="操作" width="260" align="center")
        template(slot-scope="scope")
          el-button(size="mini" type="primary" plain @click="edit(scope.row)") 编辑
          el-button(v-if="scope.row.status==1" size="mini" plain type="warning" @click="enable(scope.row)") 禁用
          el-button(v-else size="mini" plain type="success" @click="enable(scope.row)") 启用
          el-button(size="mini" type="danger" plain @click="del(scope.row,scope.$index)") 删除
    el-dialog(:title="title" :visible.sync="dialogFormVisible" width="500px")
      el-form(:model="ruleForm" :rules="rules" ref="ruleForm" label-width="80px")
        el-form-item(label="权限名称" prop="name")
          el-input(v-model="ruleForm.name")
        el-form-item(label="权限选择" prop="rs")
          el-tree(:data="list" show-checkbox node-key="id" ref="tree" :check-strictly="true" @check-change="handleChange" :default-checked-keys="keys" highlight-current :props="defaultProps")
        el-form-item(label="备注" prop="remark")
          el-input(v-model="ruleForm.remark")
      div.dialog-footer(slot="footer")
        el-button(@click="dialogFormVisible = false") 取 消
        el-button(type="primary" @click="submit") 确 定
</template>
<script>
import api from '@/api'
import util from '@/utils'
import _ from 'lodash'
export default{
  data () {
    return {
      data: [],
      loading: false,
      dialogFormVisible: false,
      ruleForm: {
        name: '',
        rs: '',
        remark: ''
      },
      title: '添加权限',
      rules: {
        name: [
          { required: true, message: '请填写用户名称', trigger: 'blur' }
        ]
      },
      defaultProps: {
        children: 'children',
        label: 'title'
      },
      keys: [],
      list: []
    }
  },
  methods: {
    resetForm (formName) {
      this.$refs.tree.setCheckedKeys([])
      this.keys = []
      this.$refs[formName].resetFields()
    },
    handleChange () {
      this.keys = this.$refs.tree.getCheckedKeys()
      if (this.$refs.tree.getCheckedKeys().length) {
        this.ruleForm.rs = _.join(this.keys, ',')
      } else {
        this.ruleForm.rs = ''
      }
    },
    async del (e, index) {
      this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        let res = await api.rule.del(e.id)
        util.response(res, this)
        if (res.code === 200) {
          util.message('操作成功')
          this.data.splice(index, 1)
        } else {
          util.message(res.error, 'error')
        }
      }).catch(() => {
      })
    },
    add () {
      this.dialogFormVisible = true
      this.title = '添加权限'
      this.type = 1
      this.$nextTick(() => {
        this.$refs.tree.setCheckedKeys([])
        this.keys = []
        this.$refs['ruleForm'].resetFields()
        delete this.ruleForm.id
        this.ruleForm.name = ''
        this.ruleForm.rs = ''
        this.ruleForm.remark = ''
      })
    },
    edit (e) {
      this.dialogFormVisible = true
      this.title = '编辑权限'
      this.type = 2
      this.ruleForm.name = e.name
      this.ruleForm.id = e.id
      this.ruleForm.rs = e.rs
      this.keys = _.split(e.rs, ',')
      this.$nextTick(() => {
        this.$refs.tree.setCheckedKeys(this.keys)
      })
      this.ruleForm.remark = e.remark
    },
    async submit () {
      this.loading = true
      this.$refs['ruleForm'].validate(async (valid) => {
        if (valid) {
          let res = []
          if (this.type === 1) {
            res = await api.rule.save(this.ruleForm)
          } else {
            res = await api.rule.update(this.ruleForm)
          }
          util.response(res, this)
          this.loading = false
          if (res.code === 200) {
            this.dialogFormVisible = false
            util.message('操作成功')
            this.getData()
          } else {
            util.message(res.error, 'error')
          }
        } else {
          this.loading = false
          return false
        }
      })
    },
    async enable (e) {
      let data = {
        'id': e.id,
        'status': e.status ? 0 : 1
      }
      let res = await api.rule.enable(data)
      util.response(res, this)
      if (res.code === 200) {
        e.status = e.status ? 0 : 1
      } else {
        util.message(res.error, 'error')
      }
    },
    async getData () {
      this.loading = true
      let res = await api.rule.index()
      util.response(res, this)
      this.loading = false
      this.data = res.data
    },
    async getMenu () {
      this.loading = true
      let res = await api.menu.index()
      util.response(res, this)
      this.loading = false
      this.list = res.data
    }
  },
  mounted () {
    this.getData()
    this.getMenu()
  }
}
</script>
<style>

</style>
