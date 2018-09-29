import { currentRouter } from '@/router'

const mutations = {
  setPrivateRouter (state, data) {
    if (data) {
      state.privateRouter = currentRouter.concat(data)
    } else {
      state.privateRouter = []
    }
  },
  setUserInfo (state, data) {
    if (data) {
      state.userInfo = data
    } else {
      state.userInfo = []
    }
  }
}
export default mutations
