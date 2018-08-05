<template lang="pug">
  div#ruleDetail
    el-button.fl.mb-20(type="primary" icon="el-icon-edit" @click="toRouter('addRule')") 增加权限
    el-table(:data="data" border v-loading="loading")
      el-table-column(prop="index" align="center" label="序号")
        template(slot-scope="scope")
          span {{scope.$index + 1}}
      el-table-column(prop="title" align="center" label="岗位名称")
      el-table-column(prop="rs" align="center" label="所有权限")
      el-table-column(prop="remark" align="center" label="描述")
      el-table-column(prop="status" label="状态" align="center")
        template(slot-scope="scope")
          el-tag(:type="scope.row.status | statusFilterType") {{scope.row.status | statusFilter}}
      el-table-column(label="操作" align="center" width="150")
        template(slot-scope="scope")
          el-button(size="mini" type="primary" plain @click="edit(scope.row)") 编辑
          el-button(v-if="scope.row.status==1" size="mini" plain type="danger" @click="enable(scope.row)") 禁用
          el-button(v-if="scope.row.status!=1" size="mini" plain type="success" @click="enable(scope.row)") 启用
</template>
<script>
import rule from '@/api/rule'
import util from '@/utils'
export default{
  data () {
    return {
      data: [],
      loading: false,
      defaultProps: {
        children: 'children',
        label: 'title'
      },
      d: []
    }
  },
  computed: {
  },
  methods: {
    edit (e) {
      util.toRouter('editRule', this, {'id': e.id})
    },
    async enable (e) {
      let data = {
        'id': e.id,
        'status': e.status ? 0 : 1
      }
      let res = await rule.enable(data)
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
    async getRules () {
      this.loading = true
      let res = await rule.index()
      util.response(res, this)
      await util.sleep(500)
      this.loading = false
      if (res.code === 200) {
        this.data = res.data
      }
    }
  },
  created () {
    this.getRules()
  }
}
</script>
<style lang="scss">
#ruleDetail{
  padding:20px;
  height: 100%;
  width: 100%;
}
</style>
