<template lang="pug">
  div#departmentDetail
    el-button.fl.mb-20(type="primary" icon="el-icon-edit" @click="toRouter('addDepartment')") 增加部门
    el-table(:data="data" border v-loading="loading")
      el-table-column(prop="index" label="序号" align="center")
        template(slot-scope="scope")
          span {{scope.$index + 1}}
      el-table-column(prop="name" label="部门" align="center" min-width="150")
      el-table-column(prop="status" label="当前状态" align="center")
        template(slot-scope="scope")
          el-tag(:type="scope.row.status | statusFilterType") {{scope.row.status | statusFilter}}
      el-table-column(label="操作" min-width="150" align="center")
        template(slot-scope="scope")
          el-button(size="mini" type="primary" plain @click="edit(scope.row)") 编辑
          el-button(v-if="scope.row.status==1" size="mini" plain type="danger" @click="enable(scope.row)") 禁用
          el-button(v-if="scope.row.status!=1" size="mini" plain type="success" @click="enable(scope.row)") 启用
</template>
<script>
import department from '@/api/department'
import util from '@/utils'
export default{
  data () {
    return {
      data: [],
      loading: false
    }
  },
  computed: {
  },
  methods: {
    edit (e) {
      util.toRouter('editDepartment', this, {'id': e.id})
    },
    async enable (e) {
      let data = {
        'id': e.id,
        'status': e.status ? 0 : 1
      }
      let res = await department.enable(data)
      util.response(res, this)
      if (res.code === 200) {
        e.status = data.status
      } else {
        util.message(res.error, 'error')
      }
    },
    toRouter (name) {
      util.toRouter(name, this)
    },
    async getDepartments () {
      this.loading = true
      let res = await department.index()
      util.response(res, this)
      await util.sleep(500)
      this.loading = false
      if (res.code === 200) {
        this.data = res.data
      }
    }
  },
  mounted () {
    this.getDepartments()
  }
}
</script>
<style lang="scss">
#departmentDetail{
  padding:20px;
  width: 100%;
  height: 100%;
}
</style>
