<template lang="pug">
  div#positionDetail
    el-button.fl.mb-20(type="primary" icon="el-icon-edit" @click="toRouter('addPosition')") 增加岗位
    el-table(:data="data" border v-loading="loading")
      el-table-column(prop="index" label="序号" align="center")
        template(slot-scope="scope")
          span {{scope.$index + 1}}
      el-table-column(prop="name" label="岗位名称" align="center" min-width="150")
      el-table-column(prop="remark" label="描述" align="center" min-width="150")
      el-table-column(prop="status" label="状态" align="center")
        template(slot-scope="scope")
          el-tag(:type="scope.row.status | statusFilterType") {{scope.row.status | statusFilter}}
      el-table-column(label="操作" min-width="150" align="center")
        template(slot-scope="scope")
          el-button(size="mini" type="primary" plain @click="edit(scope.row)") 编辑
          el-button(v-if="scope.row.status==1" size="mini" plain type="danger" @click="enable(scope.row)") 禁用
          el-button(v-if="scope.row.status!=1" size="mini" plain type="success" @click="enable(scope.row)") 启用
</template>
<script>
import position from '@/api/position'
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
      util.toRouter('editPosition', this, {'id': e.id})
    },
    async enable (e) {
      let data = {
        'id': e.id,
        'status': e.status ? 0 : 1
      }
      let res = await position.enable(data)
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
    async getPositions () {
      this.loading = true
      let res = await position.index()
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
  }
}
</script>
<style lang="scss">
#positionDetail{
  padding:20px;
  height: 100%;
  width: 100%;
}
</style>
