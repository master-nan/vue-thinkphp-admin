<template>
  <div></div>
</template>
<script>
export default {
  created () {
    if (this.$route.query.name) {
      console.log('refresh====')
      this.$router.replace({ name: this.$route.query.name })
    } else {
      console.log('refresh fail')
    }
  }
}
</script>
