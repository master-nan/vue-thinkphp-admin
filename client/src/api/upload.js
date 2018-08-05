import http from '@/utils/http'
let path = 'files'

let avatar = () => {
  let url = http.baseURL + path + '/index'
  return url
}

export default{
  avatar
}
