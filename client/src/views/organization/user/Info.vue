<template lang="pug">
  div#Info
    div.content
      el-form(:model="ruleForm" :rules="rules" ref="ruleForm" style="text-align:left" label-width="60px" v-loading="loading")
        el-form-item(label="昵称" prop="nickname")
          el-input(v-model="ruleForm.nickname")
        el-form-item(label="头像" prop="status")
          el-upload.avatar-uploader(:headers="header" name="file" accept=".jpg,.png,.jpeg" :action="path" :show-file-list="false" :on-success="handleAvatarSuccess" :before-upload="beforeAvatarUpload")
            img.avatar(v-if="imageUrl" :src="imageUrl")
            i.el-icon-plus.avatar-uploader-icon(v-else)
        el-form-item
          el-button(type="primary" @click="submitForm('ruleForm')" style="width:35%") 修 改
</template>
<script>
import util from '@/utils'
import user from '@/api/user'
import upload from '@/api/upload'
export default {
  data () {
    return {
      loading: false,
      ruleForm: {
        nickname: '',
        avatar: ''
      },
      rules: {
        nickname: [
          { required: false, message: '昵称不能为空', trigger: 'blur' }
        ],
        avatar: [
          { required: false, message: '用户名不能为空', trigger: 'blur' }
        ]
      },
      imageUrl: '',
      path: upload.avatar()
    }
  },
  methods: {
    async submitForm (formName) {
      this.loading = true
      let res = await user.setUserInfo(this.ruleForm)
      util.response(res, this)
      await util.sleep(500)
      this.loading = false
      if (res.code === 200) {
        util.setUser(this.ruleForm, this)
        util.message('操作成功')
      } else {
        util.message(res.error, 'error')
      }
    },
    handleAvatarSuccess (res, file) {
      util.response(res, this)
      if (res.data) {
        this.ruleForm.avatar = res.data.path + res.data.name
        this.imageUrl = URL.createObjectURL(file.raw)
      }
    },
    beforeAvatarUpload (file) {
      const isLt2M = file.size / 1024 / 1024 < 2
      if (file.type !== 'image/jpeg' && file.type !== 'image/jpg' && file.type !== 'image/png') {
        this.$message.error('上传头像图片只能是jpg/png/ipeg格式!')
        return false
      }
      if (!isLt2M) {
        this.$message.error('上传头像图片大小不能超过 2MB!')
        return false
      }
      return true
    },
    setUser () {
      this.ruleForm.nickname = this.$store.getters.getUserInfo['nickname']
      this.imageUrl = this.$store.getters.getUserInfo['avatar']
    }
  },
  computed: {
    header () {
      return {
        'X-Requested-Token': sessionStorage.getItem('token') ? sessionStorage.getItem('token') : null
      }
    }
  },
  mounted () {
    this.setUser()
  }
}
</script>
<style lang="scss">
#Info{
  width: 100%;
  height: 100%;
  &>.content{
    width: 20%;
    min-width: 200px;
    padding: 1%;

    .avatar-uploader .el-upload {
        border: 1px dashed #d9d9d9;
        border-radius: 6px;
        cursor: pointer;
        position: relative;
        overflow: hidden;
    }
    .avatar-uploader .el-upload:hover {
      border-color: #409EFF;
    }
    .avatar-uploader-icon {
      font-size: 28px;
      color: #8c939d;
      width: 100px;
      height: 100px;
      line-height: 100px;
      text-align: center;
    }
    .avatar {
      width: 100px;
      height: 100px;
      display: block;
    }
  }
}
</style>
