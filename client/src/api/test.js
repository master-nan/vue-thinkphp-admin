import http from '@/utils/http'
let path = 'files'

let index = async (data) => {
  let url = path + '/index'
  let result = await http.post(url, data)
  return result
}

export default{
  index
}
