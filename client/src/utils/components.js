import home from '@/views/public/Home'
import department from '@/views/organization/department/Index'
import position from '@/views/organization/position/Index'
import user from '@/views/organization/user/Index'
import menu from '@/views/system/menu/Index'
import rule from '@/views/system/rule/Index'

let comps = {
  'home': home,
  'menu': menu,
  'department': department,
  'position': position,
  'user': user,
  'rule': rule
}
export default comps
