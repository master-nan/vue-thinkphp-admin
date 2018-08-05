<template lang="pug">
  div#st-404
    div.cont
      div.img
      div.title1 很抱歉，您访问的页面不在地球上。。。
      div.title2 如果想要继续浏览，请点击下面按钮返回首页
      el-button(type="danger" @click="toRouter('index')") 返回首页
</template>
<script>
import util from '@/utils'
export default{
  data () {
    return {

    }
  },
  methods: {
    toRouter (name) {
      util.toRouter(name, this)
    }
  }
}
</script>
<style lang="scss">
  #st-404{
    background-color: #e2fcfe;
    width: 100%;
    height: 100%;

    .cont{
      width: 715px;
      position: absolute;
      left:50%;
      top:20%;
      margin-left:-360px;
      text-align: center;
      .img{
        background-image: url("../../assets/image/404.png");
        width: 715px;
        height: 269px;
      }
      .title1{
        font-size:30px;
        color:#000000;
        height: 70px;
        line-height: 80px;
      }
      .title2{
        font-size:16px;
        color:#323232;
        margin-bottom: 20px;
      }
    }
  }
</style>
