const actions = {
  setSidebarStatus ({commit}, status) {
    commit('setSidebarStatus', status)
  },
  setPrivateRouter ({commit}, data) {
    return new Promise(resolve => {
      commit('setPrivateRouter', data)
      resolve()
    })
  },
  setUserInfo ({commit}, data) {
    return new Promise(resolve => {
      commit('setUserInfo', data)
      resolve()
    })
  }
}

export default actions
