import { currentRouter } from '@/router'

const mutations = {
  setSidebarStatus (state, status) {
    state.showSidebar = status
  },
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
