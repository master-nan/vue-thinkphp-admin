import { Message } from 'element-ui'
import _ from 'lodash'
import comps from './components'
import http from '@/utils/http'

let response = async (res, vm) => {
  if (res.code === 101) {
    message(res.error, 'error', 800)
    await sleep(1000)
    clearSome(vm)
    return false
  } else if (res.code === 102) {
    message(res.error, 'error', 800)
    await sleep(1000)
    vm.$router.push('/index')
    return false
  }
}

let clearSome = (vm) => {
  sessionStorage.removeItem('token')
  sessionStorage.removeItem('menus')
  sessionStorage.removeItem('user')
  vm.$store.dispatch('setPrivateRouter', null)
  vm.$store.dispatch('setUserInfo', null)
  vm.$router.push('/login')
  location.reload() // 为了防止切换账号原有账号下的权限路由还能访问的问题以及避免登陆相同账号重复加载路由
}

let message = (msg, type = 'success', duration = 600) => {
  Message({
    message: msg,
    type: type,
    duration: duration
  })
}

let sleep = (d) => {
  return new Promise((resolve) => {
    setTimeout(resolve, d)
  })
}

let toRouter = (name, vm, data = {}) => {
  if (!name) name = vm.$route.name
  if (name === vm.$route.name) {
    vm.$router.push({name: 'refresh', query: { name: name }})
  } else {
    vm.$router.push({name: name, params: data})
  }
}

let setMenus = () => {
  let data = sessionStorage.getItem('menus')
  let d = []
  if (data) {
    d = setComponent(JSON.parse(data))
  }
  return d
}

let setComponent = (data = {}) => {
  _.forEach(data, function (v, k) {
    v.meta = {
      title: v.title,
      icon: v.icon
    }
    if (v.name && comps[v.name]) {
      v.component = comps[v.name]
    } else {
      v.component = comps['home']
    }
    if (v.children && v.children.length) v.children = setComponent(v.children)
  })
  return data
}

let setUser = (data, vm) => {
  let user = JSON.parse(sessionStorage.getItem('user'))
  _.forEach(data, function (v, k) {
    if (v) {
      if (k === 'avatar') {
        user[k] = http.baseURL + v
      } else {
        user[k] = v
      }
    }
  })
  sessionStorage.setItem('user', JSON.stringify(user))
  vm.$store.dispatch('setUserInfo', user)
}

// 深拷贝
let cloneDeep = (val) => {
  return _.cloneDeep(val)
}

export default {
  response,
  message,
  sleep,
  toRouter,
  setMenus,
  setComponent,
  clearSome,
  setUser,
  cloneDeep
}
