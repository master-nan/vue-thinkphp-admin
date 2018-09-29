const actions = {
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
