<template lang="pug">
  div#userDetail
    div.filter-container
      el-input.filter-item(@keyup.enter.native="handleFilter" style="width: 200px;" placeholder="昵称" v-model="list.nickname")
      el-select.filter-item(@change='handleFilter' clearable style="width: 120px" v-model="list.d_id" placeholder="部门")
        el-option(v-for="item in listDep" :key="item.id" :label="item.name" :value="item.id")
      el-select.filter-item(@change='handleFilter' clearable style="width: 120px" v-model="list.p_id" placeholder="岗位")
        el-option(v-for="item in listPos" :key="item.id" :label="item.name" :value="item.id")
      el-select.filter-item(@change='handleFilter' clearable style="width: 120px" v-model="list.status" placeholder="状态")
        el-option(label="启用" value="1")
        el-option(label="禁用" value="0")
      el-button.filter-item(type="primary" icon="el-icon-search" @click="handleFilter") 搜索
      el-button.filter-item(type="primary" icon="el-icon-edit" @click="toRouter('addUser')") 添加
      //- el-button.filter-item(type="primary" :loading="downloadLoading" icon="el-icon-download" @click="handleDownload") 导出
    el-table(:data="data" border v-loading="loading")
      el-table-column(prop="index" align="center" label="序号")
        template(slot-scope="scope")
          span {{scope.$index + 1}}
      el-table-column(prop="nickname" align="center" label="昵称")
      el-table-column(prop="username" align="center" label="用户名")
      el-table-column(prop="d_name" align="center" min-width="100" label="部门")
      el-table-column(prop="p_name" align="center" min-width="100" label="岗位")
      el-table-column(prop="last_login_at" align="center" min-width="110" label="上次登录时间")
        template(slot-scope="scope")
          slot {{scope.row.last_login_at | timeFilter}}
      el-table-column(prop="last_logout_at" align="center" min-width="110" label="上次退出时间")
        template(slot-scope="scope")
          slot {{scope.row.last_logout_at | timeFilter}}
      el-table-column(prop="status" label="状态" align="center")
        template(slot-scope="scope")
          el-tag(:type="scope.row.status | statusFilterType") {{scope.row.status | statusFilter}}
      el-table-column(label="操作" align="center" width="150")
        template(slot-scope="scope")
          el-button(size="mini" type="primary" plain @click="edit(scope.row)") 编辑
          el-button(v-if="scope.row.status==1" size="mini" type="danger" plain @click="enable(scope.row)") 禁用
          el-button(v-if="scope.row.status!=1" size="mini" type="success" plain @click="enable(scope.row)") 启用
</template>
<script>
import user from '@/api/user'
import util from '@/utils'
import department from '@/api/department'
import position from '@/api/position'
export default{
  data () {
    return {
      data: [],
      loading: false,
      list: {
        nickname: '',
        d_id: null,
        p_id: null,
        status: null
      },
      downloadLoading: false,
      listPos: [],
      listDep: []
    }
  },
  computed: {
  },
  methods: {
    edit (e) {
      util.toRouter('editUser', this, {'id': e.id})
    },
    async enable (e) {
      let data = {
        'id': e.id,
        'status': e.status ? 0 : 1
      }
      let res = await user.enable(data)
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
    handleFilter () {
      if (this.loading) return
      this.getUsers(this.list)
    },
    handleDownload () {

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
    async getUsers (data = {}) {
      this.loading = true
      let res = await user.index(data)
      util.response(res, this)
      await util.sleep(500)
      this.loading = false
      if (res.code === 200) {
        this.data = res.data
      }
    }
  },
  mounted () {
    this.getPositions()
    this.getDepartments()
    this.getUsers()
  }
}
</script>
<style lang="scss">
#userDetail{
  padding: 20px;
  height: 100%;
  width: 100%;
}
</style>
