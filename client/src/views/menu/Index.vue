<template lang="pug">
  div#menuDetail
    el-button.fl.mb-20(type="primary" icon="el-icon-edit" @click="toRouter('addMenu')") 增加菜单
    el-table(:data="formatData" :row-style="showRow" border v-loading="loading")
      el-table-column(align="center" prop="title" label="标题" min-width="180")
        template(slot-scope="scope")
          span.ms-tree-space(v-for="space in scope.row._level" :key="space")
          span.tree-ctrl(v-if="iconShow(scope.row)" @click="toggleExpanded(scope.$index)")
            i(v-if="!scope.row._expanded")
              svg.icon.fs-20(aria-hidden="true")
                use(xlink:href="#nan-icon-arrows-down-circle")
            i(v-else type="danger")
              svg.icon.fs-20(aria-hidden="true")
                use(xlink:href="#nan-icon-arrows-up-circle")
          slot {{scope.row.title}}
      el-table-column(align="center" prop="name" label="路由名称")
      el-table-column(align="center" prop="path" label="路径")
      el-table-column(align="center" prop="sort" label="排序")
      el-table-column(align="center" prop="show" label="完整子菜单")
        template(slot-scope="scope")
          el-tag(:type="scope.row.show | showFilterType") {{scope.row.show | showFilter}}
      el-table-column(align="center" prop="hidden" label="左侧隐藏")
        template(slot-scope="scope")
          el-tag(:type="scope.row.hidden | hiddenFilterType") {{scope.row.hidden | hiddenFilter}}
      el-table-column(align="center" prop="status" label="状态")
        template(slot-scope="scope")
          el-tag(:type="scope.row.status | statusFilterType") {{scope.row.status | statusFilter}}
      el-table-column(label="操作" width="150" align="center")
        template(slot-scope="scope")
          el-button(size="mini" type="primary" plain @click="edit(scope.row)") 编辑
          el-button(v-if="scope.row.status==1" size="mini" plain type="danger" @click="enable(scope.row)") 禁用
          el-button(v-if="scope.row.status!=1" size="mini" plain type="success" @click="enable(scope.row)") 启用
</template>
<script>
import menu from '@/api/menu'
import util from '@/utils'
import treeToArray from './evl'
export default{
  name: 'menuDetail',
  data () {
    return {
      data: [],
      loading: false
    }
  },
  computed: {
  // 格式化数据源
    formatData: function () {
      let tmp
      if (!Array.isArray(this.data)) {
        tmp = [this.data]
      } else {
        tmp = this.data
      }
      const func = treeToArray
      const args = [tmp, false]
      return func.apply(null, args)
    }
  },
  methods: {
    showRow: function (row) {
      const show = (row.row.parent ? (row.row.parent._expanded && row.row.parent._show) : true)
      row.row._show = show
      return show ? 'animation:treeTableShow 1s;-webkit-animation:treeTableShow 1s;' : 'display:none;'
    },
    // 切换下级是否展开
    toggleExpanded: function (trIndex) {
      const record = this.formatData[trIndex]
      record._expanded = !record._expanded
    },
    // 图标显示
    iconShow (record) {
      return (record.children && record.children.length > 0)
    },
    edit (e) {
      util.toRouter('editMenu', this, {'id': e.id})
    },
    async enable (e) {
      let data = {
        'id': e.id,
        'status': e.status ? 0 : 1
      }
      let res = await menu.enable(data)
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
    async getMenus () {
      this.loading = true
      let res = await menu.index()
      util.response(res, this)
      await util.sleep(500)
      this.loading = false
      if (res.code === 200) {
        this.data = res.data
      }
    }
  },
  mounted () {
    this.getMenus()
  }
}
</script>
<style lang="scss">

@keyframes treeTableShow {
    from {opacity: 0;}
    to {opacity: 1;}
}
@-webkit-keyframes treeTableShow {
  from {opacity: 0;}
  to {opacity: 1;}
}

$color-blue: #2196F3;
$space-width: 15px;
.ms-tree-space {
  position: relative;
  top: 1px;
  display: inline-block;
  font-style: normal;
  font-weight: 400;
  line-height: 1;
  width: $space-width;
  height: 14px;
  &::before {
    content: ""
  }
}
#menuDetail{
  width: 100%;
  height: 100%;
  padding:20px;

  .el-table{
    margin-bottom: 20px;
  }

  .tree-ctrl{
    margin-right: 5px;
  }
}
</style>
