<template lang="pug">
  div
    el-button.mb-20(type="primary" icon="el-icon-plus" @click="add") 添加
    el-table(:data="data" border v-loading="loading" :row-class-name="tableRowClassName")
      el-table-column(prop="id" label="ID" align="center" width="100")
      el-table-column(prop="pid" label="PID" align="center" width="100")
      el-table-column(prop="title" label="菜单标题" align="center")
      el-table-column(prop="hidden" label="左侧是否显示" align="center")
        template(slot-scope="scope")
          el-tag(:type="scope.row.hidden | hiddenFilterType") {{scope.row.hidden | hiddenFilter}}
      el-table-column(prop="status" label="状态" align="center")
        template(slot-scope="scope")
          el-tag(:type="scope.row.status | statusFilterType") {{scope.row.status | statusFilter}}
      el-table-column(prop="sort" label="排序" align="center")
      el-table-column(label="操作" width="300" align="center")
        template(slot-scope="scope")
          el-button(size="mini" type="primary" plain @click="edit(scope.row)") 编辑
          el-button(v-if="scope.row.status==1" size="mini" plain type="warning" @click="enable(scope.row)") 禁用
          el-button(v-else size="mini" plain type="success" @click="enable(scope.row)") 启用
          el-button(v-if="scope.row.children && scope.row.expand" size="mini" type="info" plain @click="expand(scope.row,scope.$index)") 收起
          el-button(v-else-if="scope.row.children && !scope.row.expand" size="mini" type="info" plain @click="expand(scope.row,scope.$index)") 展开
          el-button(size="mini" type="danger" plain @click="del(scope.row,scope.$index)") 删除
    el-dialog(:title="title" :visible.sync="dialogFormVisible" width="500px")
      el-form(:model="ruleForm" :rules="rules" ref="ruleForm" label-width="80px")
        el-form-item(label="菜单标题" prop="title")
          el-input(v-model="ruleForm.title" placeholder="左侧显示")
        el-form-item(label="父节点" prop="pid")
          el-select(v-model="ruleForm.pid" placeholder="请选择")
            el-option(v-for="item in options" :key="item.id" :label="item.title" :value="item.id")
        el-form-item(label="路由名称")
          el-input(v-model="ruleForm.name" placeholder="请确保值唯一")
        el-form-item(v-if="ruleForm.pid == 0" label="图标")
          el-input(v-model="ruleForm.icon")
        el-form-item(label="左侧隐藏")
          el-switch(v-model="ruleForm.hidden")
        el-form-item(label="菜单主体")
          el-input(v-model="ruleForm.component" placeholder="示例：客户端components.js中")
        el-form-item(label="访问路径")
          el-input(v-model="ruleForm.path" placeholder="示例：/index (子菜单请去掉/)")
        el-form-item(label="排序" prop="sort")
          el-input-number(v-model="ruleForm.sort" :min="0")
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
        title: '',
        pid: null,
        name: '',
        icon: '',
        component: '',
        path: '',
        hidden: false,
        sort: 0
      },
      title: '添加菜单',
      rules: {
        pid: [
          { required: true, message: '请选择父节点', trigger: 'change' }
        ],
        title: [
          { required: true, message: '请填写标题', trigger: 'blur' }
        ]
      },
      options: [{
        id: 0,
        title: '根节点'
      }],
      type: 2
    }
  },
  methods: {
    tableRowClassName ({row, rowIndex}) {
      if (row.child) {
        return 'bg'
      } else {
        return ''
      }
    },
    expand (e, index) {
      if (e.children) {
        let children = e.children
        if (e.expand) {
          e.expand = false
          this.data.splice(index + 1, children.length)
        } else {
          let s = this
          _.forEach(children, function (value, key) {
            if (e.pid === 0) {
              value.child = true
            } else {
              value.kid = true
            }
            s.data.splice(index + 1 + key, 0, value)
          })
          e.expand = true
        }
      }
    },
    async del (e, index) {
      this.$confirm('此操作将永久删除该记录, 是否继续?', '提示', {
        confirmButtonText: '确定',
        cancelButtonText: '取消',
        type: 'warning'
      }).then(async () => {
        let res = await api.menu.del(e.id)
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
      this.title = '添加菜单'
      this.type = 1
      this.$nextTick(() => {
        this.$refs['ruleForm'].resetFields()
        delete this.ruleForm.id
        this.ruleForm.title = ''
        this.ruleForm.pid = null
        this.ruleForm.name = ''
        this.ruleForm.icon = ''
        this.ruleForm.component = ''
        this.ruleForm.path = ''
        this.ruleForm.hidden = false
        this.ruleForm.sort = 0
      })
    },
    edit (e) {
      this.dialogFormVisible = true
      this.title = '编辑菜单'
      this.type = 2
      this.ruleForm.id = e.id
      this.ruleForm.title = e.title
      this.ruleForm.pid = e.pid
      this.ruleForm.name = e.name
      this.ruleForm.icon = e.icon
      this.ruleForm.component = e.component
      this.ruleForm.path = e.path
      this.ruleForm.hidden = !!e.hidden
      this.ruleForm.sort = e.sort
    },
    async submit () {
      this.loading = true
      this.$refs['ruleForm'].validate(async (valid) => {
        if (valid) {
          let res = []
          if (this.type === 1) {
            res = await api.menu.save(this.ruleForm)
          } else {
            res = await api.menu.update(this.ruleForm)
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
      let res = await api.menu.enable(data)
      util.response(res, this)
      if (res.code === 200) {
        e.status = e.status ? 0 : 1
      } else {
        util.message(res.error, 'error')
      }
    },
    async getData () {
      this.loading = true
      let res = await api.menu.index()
      util.response(res, this)
      this.loading = false
      this.data = res.data
      this.getMenu()
    },
    getMenu () {
      this.options = util.cloneDeep(this.data)
      this.options.unshift({id: 0, title: '根节点'})
    }
  },
  mounted () {
    this.getData()
  }
}
</script>
<style>
.el-table .bg{
  background: #EDE7F6;
}
</style>
