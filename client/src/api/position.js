import http from '@/utils/http'
let path = 'position'

let index = async (data = {}) => {
  let url = path
  let result = await http.get(url, data)
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

export default{
  index,
  save,
  read,
  update,
  enable
}
