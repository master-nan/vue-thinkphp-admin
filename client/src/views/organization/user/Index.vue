<template lang="pug">
  div
    div.filter-container
      el-input.filter-item(clearable @keyup.enter.native="handleFilter" style="width: 150px;" placeholder="昵称" v-model="list.nickname")
      el-select.filter-item(clearable style="width: 120px" v-model="list.d_id" placeholder="部门")
        el-option(v-for="item in listDep" :key="item.id" :label="item.name" :value="item.id")
      el-select.filter-item(clearable style="width: 120px" v-model="list.p_id" placeholder="岗位")
        el-option(v-for="item in listPos" :key="item.id" :label="item.name" :value="item.id")
      el-select.filter-item(clearable style="width: 120px" v-model="list.status" placeholder="状态")
        el-option(label="启用" value="1")
        el-option(label="禁用" value="0")
      el-button.filter-item(type="primary" icon="el-icon-search" @click="handleFilter") 搜索
      el-button.filter-item(type="primary" icon="el-icon-plus" @click="add") 添加
    el-table(:data="data" border v-loading="loading")
      el-table-column(prop="index" label="序号" align="center" width="100")
        template(slot-scope="scope")
          span {{scope.$index + 1}}
      el-table-column(prop="nickname" label="昵称" align="center")
      el-table-column(prop="username" label="用户名" align="center")
      el-table-column(prop="d_name" label="岗位" align="center")
      el-table-column(prop="p_name" label="部门" align="center")
      el-table-column(prop="status" label="状态" align="center")
        template(slot-scope="scope")
          el-tag(:type="scope.row.status | statusFilterType") {{scope.row.status | statusFilter}}
      el-table-column(label="操作" width="260" align="center")
        template(slot-scope="scope")
          el-button(size="mini" type="primary" plain @click="edit(scope.row)") 编辑
          el-button(v-if="scope.row.status==1" size="mini" plain type="warning" @click="enable(scope.row)") 禁用
          el-button(v-else size="mini" plain type="success" @click="enable(scope.row)") 启用
          el-button(size="mini" type="danger" plain @click="del(scope.row,scope.$index)") 删除
    el-dialog(:title="title" :visible.sync="dialogFormVisible" width="500px" height="500px")
      el-form(:model="ruleForm" :rules="rules" ref="ruleForm" label-width="80px")
        el-form-item(label="昵称" prop="nickname")
          el-input(v-model="ruleForm.nickname")
        el-form-item(label="用户名" prop="username" :disabled="type != 1")
          el-input(v-model="ruleForm.username")
        el-form-item(label="密码")
          el-input(v-model="ruleForm.password" type="password")
        el-form-item(label="部门" prop="d_id")
          el-select(v-model="ruleForm.d_id" filterable placeholder="请选择")
            el-option(v-for="item in listDep" :key="item.id" :label="item.name" :value="item.id")
        el-form-item(label="岗位" prop="p_id")
          el-select(v-model="ruleForm.p_id" filterable placeholder="请选择")
            el-option(v-for="item in listPos" :key="item.id" :label="item.name" :value="item.id")
        el-form-item(label="权限" prop="r_id")
          el-select(v-model="ruleForm.r_id" filterable placeholder="请选择")
            el-option(v-for="item in listRule" :key="item.id" :label="item.name" :value="item.id")
      div.dialog-footer(slot="footer")
        el-button(@click="dialogFormVisible = false") 取 消
        el-button(type="primary" @click="submit") 确 定
</template>
<script>
import api from '@/api'
import util from '@/utils'
export default{
  data () {
    return {
      data: [],
      loading: false,
      dialogFormVisible: false,
      ruleForm: {
        nickname: '',
        username: '',
        d_id: null,
        p_id: null,
        r_id: null
      },
      title: '添加用户',
      rules: {
        nickname: [
          { required: true, message: '昵称不能为空', trigger: 'blur' }
        ],
        username: [
          { required: true, message: '用户名不能为空', trigger: 'blur' }
        ],
        p_id: [
          { required: true, message: '请选择岗位', trigger: 'change' }
        ],
        d_id: [
          { required: true, message: '请选择部门', trigger: 'change' }
        ],
        r_id: [
          { required: true, message: '请选择权限', trigger: 'change' }
        ]
      },
      list: {
        nickname: '',
        p_id: null,
        d_id: null,
        status: null
      },
      listDep: [],
      listPos: [],
      listRule: [],
      type: 2
    }
  },
  methods: {
    async del (e, index) {
      this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        let res = await api.member.del(e.id)
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
      this.title = '添加用户'
      this.type = 1
      this.$nextTick(() => {
        this.$refs['ruleForm'].resetFields()
        delete this.ruleForm.id
        this.ruleForm.nickname = ''
        this.ruleForm.username = ''
        this.ruleForm.p_id = ''
        this.ruleForm.d_id = ''
        this.ruleForm.r_id = ''
        this.ruleForm.password = ''
      })
    },
    edit (e) {
      this.dialogFormVisible = true
      this.title = '编辑用户'
      this.type = 2
      this.ruleForm.id = e.id
      this.ruleForm.nickname = e.nickname
      this.ruleForm.username = e.username
      this.ruleForm.p_id = e.p_id
      this.ruleForm.d_id = e.d_id
      this.ruleForm.r_id = e.r_id
      this.ruleForm.password = ''
    },
    async submit () {
      this.loading = true
      this.$refs['ruleForm'].validate(async (valid) => {
        if (valid) {
          let res = []
          if (this.type === 1) {
            res = await api.user.save(this.ruleForm)
          } else {
            res = await api.user.update(this.ruleForm)
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
      let res = await api.user.enable(data)
      util.response(res, this)
      if (res.code === 200) {
        e.status = e.status ? 0 : 1
      } else {
        util.message(res.error, 'error')
      }
    },
    handleFilter () {
      this.getData(this.list)
    },
    async getPositions () {
      let res = await api.position.index({'status': 1})
      util.response(res, this)
      if (res.code === 200) {
        this.listPos = res.data
      }
    },
    async getDepartments () {
      let res = await api.department.index({'status': 1})
      util.response(res, this)
      if (res.code === 200) {
        this.listDep = res.data
      }
    },
    async getRules () {
      let res = await api.rule.index({'status': 1})
      util.response(res, this)
      if (res.code === 200) {
        this.listRule = res.data
      }
    },
    async getData (data = []) {
      this.loading = true
      let res = await api.user.index(data)
      util.response(res, this)
      this.loading = false
      if (res.code === 200) this.data = res.data
    }
  },
  mounted () {
    this.getData()
  },
  created () {
    this.getPositions()
    this.getDepartments()
    this.getRules()
  }
}
</script>
<style>

</style>
