import http from '@/utils/http'
let path = 'menu'

let index = async () => {
  let url = path
  let result = await http.get(url, {})
  return result
}

let save = async (data) => {
  let url = path
  let result = await http.post(url, data)
  return result
}

let read = async (id) => {
  let url = path + '/' + id
  let result = await http.get(url, {})
  return result
}

let update = async (data) => {
  let url = path + '/' + data.id
  let result = await http.put(url, data)
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
  enable,
  del
}
