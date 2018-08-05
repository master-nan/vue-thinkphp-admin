import Home from '@/views/public/Home'
import menuDetail from '@/views/menu/Index'
import editMenu from '@/views/menu/Edit'
import addMenu from '@/views/menu/Add'
import departmentDetail from '@/views/department/Index'
import editDepartment from '@/views/department/Edit'
import addDepartment from '@/views/department/Add'
import ruleDetail from '@/views/rule/Index'
import editRule from '@/views/rule/Edit'
import addRule from '@/views/rule/Add'
import positionDetail from '@/views/position/Index'
import editPosition from '@/views/position/Edit'
import addPosition from '@/views/position/Add'
import userDetail from '@/views/user/Index'
import editUser from '@/views/user/Edit'
import addUser from '@/views/user/Add'

let comps = {
  'home': Home,
  'menuDetail': menuDetail,
  'editMenu': editMenu,
  'addMenu': addMenu,
  'departmentDetail': departmentDetail,
  'editDepartment': editDepartment,
  'addDepartment': addDepartment,
  'ruleDetail': ruleDetail,
  'editRule': editRule,
  'addRule': addRule,
  'positionDetail': positionDetail,
  'editPosition': editPosition,
  'addPosition': addPosition,
  'userDetail': userDetail,
  'editUser': editUser,
  'addUser': addUser
}
export default comps
