<template lang="pug">
  div#test 111
    <div style="margin-top:50px;">
      <el-upload class="avatar-uploader" :headers="header" name="file" accept=".jpg,.png,.jpeg" :action="path" :show-file-list="false" :on-success="handleAvatarSuccess" :before-upload="beforeAvatarUpload">
        <img v-if="imageUrl" :src="imageUrl" class="avatar">
        <i v-else class="el-icon-plus avatar-uploader-icon"></i>
      </el-upload>
    </div>
</template>
<script>
// import util from '@/utils'
import upload from '@/api/upload'
export default {
  data () {
    return {
      imageUrl: '',
      path: upload.avatar()
    }
  },
  methods: {
    handleAvatarSuccess (res, file) {
      console.log(res)
      this.imageUrl = URL.createObjectURL(file.raw)
      // console.log(this.imageUrl)
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
      // base64显示图片
      // let reader = new FileReader()
      // let self = this
      // reader.readAsDataURL(file)
      // reader.onload = function (e) {
      //   self.imageUrl = this.result
      // }
      return true
    }
  },
  computed: {
    header () {
      return {
        'X-Requested-Token': sessionStorage.getItem('token') ? sessionStorage.getItem('token') : null
      }
    }
  }
}
</script>
<style lang="less">
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
    width: 178px;
    height: 178px;
    line-height: 178px;
    text-align: center;
  }
  .avatar {
    width: 178px;
    height: 178px;
    display: block;
  }
</style>
