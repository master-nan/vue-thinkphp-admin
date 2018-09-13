import http from '@/utils/http'
import md5 from 'js-md5'
import _ from 'lodash'

let path = 'user'

let index = async (data = {}) => {
  let url = path
  let result = await http.get(url, {'data': JSON.stringify(data)})
  return result
}

let save = async (data) => {
  let url = path
  let d = {}
  _.forEach(data, function (v, k) {
    if (k === 'password') {
      d[k] = md5(v)
    } else {
      d[k] = v
    }
  })
  let result = await http.post(url, d)
  return result
}

let read = async (id) => {
  let url = path + '/' + id
  let result = await http.get(url, {})
  return result
}

let update = async (data) => {
  let url = path + '/' + data.id
  let d = {}
  _.forEach(data, function (v, k) {
    if (k === 'password' && v) {
      d[k] = md5(v)
    } else {
      d[k] = v
    }
  })
  let result = await http.put(url, d)
  return result
}

let changePass = async (data) => {
  let url = path + '/changePass'
  let d = {
    oldPass: md5(data.pass1),
    newPass: md5(data.pass2)
  }
  let result = await http.post(url, d)
  return result
}

let setUserInfo = async (data) => {
  let url = path + '/setUserInfo'
  let result = await http.post(url, {'data': JSON.stringify(data)})
  return result
}

let enable = async (data) => {
  let url = path + '/enable'
  let result = await http.post(url, data)
  return result
}

let del = async (id) => {
  let url = path + '/' + id
  let result = await http.del(url, {})
  return result
}

export default{
  index,
  save,
  read,
  update,
  changePass,
  setUserInfo,
  enable,
  del
}
