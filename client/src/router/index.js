import Vue from 'vue'
import Router from 'vue-router'
import store from '@/store'
// import Home from '@/views/public/Home'
import comps from '@/utils/components'
import NProgress from 'nprogress' // progress bar
import 'nprogress/nprogress.css'// progress bar style
import util from '@/utils'
Vue.use(Router)

// NProgress.configure({ trickle: false, showSpinner: false, trickleRate: 0.02, trickleSpeed: 800 })

export const publicRouter = [
  { path: '/login', component: () => import('@/views/public/Login'), hidden: true },
  { path: '/404', component: () => import('@/views/public/404'), hidden: true },
  { path: '/401', component: () => import('@/views/public/401'), hidden: true },
  { path: '/lock', component: () => import('@/views/public/Lock'), hidden: true },
  { path: '/refresh', component: () => import('@/views/public/Refresh'), name: 'refresh', hidden: true },
  { path: '*', component: () => import('@/views/public/404'), hidden: true }
]

// export const privateRouter = [
//   {
//     path: '/menu',
//     component: comps['home'],
//     redirect: '/menu/index',
//     show: true,
//     meta: {
//       title: 'menu',
//       icon: 'nan-icon-shouye'
//     },
//     children: [
//       { path: 'index', component: () => import('@/views/menu/Index'), name: 'menuDetail', meta: { title: 'menuDetail', icon: 'nan-icon-shouye' } },
//       { path: 'edit/:id(\\d+)', component: () => import('@/views/menu/Edit'), name: 'editMenu', meta: { title: 'editMenu' }, hidden: true },
//       { path: 'add', component: () => import('@/views/menu/Add'), name: 'addMenu', meta: { title: 'addMenu', icon: 'nan-icon-shouye' } }
//     ]
//   },
//   {
//     path: '/department',
//     component: comps['home'],
//     redirect: 'noredirect',
//     show: true,
//     meta: {
//       title: 'department',
//       icon: 'nan-icon-shouye'
//     },
//     children: [
//       { path: 'index', component: () => import('@/views/department/Index'), name: 'departmentDetail', meta: { title: 'departmentDetail', icon: 'nan-icon-shouye' } },
//       { path: 'edit/:id(\\d+)', component: () => import('@/views/department/Edit'), name: 'editDepartment', meta: { title: 'editDepartment' }, hidden: true },
//       { path: 'add', component: () => import('@/views/department/Add'), name: 'addDepartment', meta: { title: 'addDepartment', icon: 'nan-icon-shouye' } }
//     ]
//   },
//   {
//     path: '/rule',
//     component: comps['home'],
//     redirect: 'noredirect',
//     show: true,
//     meta: {
//       title: 'rule',
//       icon: 'nan-icon-shouye'
//     },
//     children: [
//       { path: 'index', component: () => import('@/views/rule/Index'), name: 'ruleDetail', meta: { title: 'ruleDetail', icon: 'nan-icon-shouye' } },
//       { path: 'edit/:id(\\d+)', component: () => import('@/views/rule/Edit'), name: 'editRule', meta: { title: 'editRule' }, hidden: true },
//       { path: 'add', component: () => import('@/views/rule/Add'), name: 'addRule', meta: { title: 'addRule', icon: 'nan-icon-shouye' } }
//     ]
//   },
//   {
//     path: '/position',
//     component: comps['home'],
//     redirect: 'noredirect',
//     show: true,
//     meta: {
//       title: 'position',
//       icon: 'nan-icon-shouye'
//     },
//     children: [
//       { path: 'index', component: () => import('@/views/position/Index'), name: 'positionDetail', meta: { title: 'positionDetail', icon: 'nan-icon-shouye'},
//       { path: 'edit/:id(\\d+)', component: () => import('@/views/position/Edit'), name: 'editPosition', meta: { title: 'editPosition' }, hidden: true },
//       { path: 'add', component: () => import('@/views/position/Add'), name: 'addPosition', meta: { title: 'addPosition', icon: 'nan-icon-shouye' } }
//     ]
//   },
//   {
//     path: '/user',
//     component: comps['home'],
//     redirect: 'noredirect',
//     show: true,
//     meta: {
//       title: 'user',
//       icon: 'nan-icon-shouye'
//     },
//     children: [
//       { path: 'index', component: () => import('@/views/user/Index'), name: 'userDetail', meta: { title: 'userDetail', icon: 'nan-icon-shouye' } },
//       { path: 'edit/:id(\\d+)', component: () => import('@/views/user/Edit'), name: 'editUser', meta: { title: 'editUser' }, hidden: true },
//       { path: 'add', component: () => import('@/views/user/Add'), name: 'addUser', meta: { title: 'addUser', icon: 'nan-icon-shouye' } }
//     ]
//   },
//   {
//     path: '/order',
//     component: comps['home'],
//     redirect: 'noredirect',
//     show: true,
//     meta: {
//       title: 'order',
//       icon: 'nan-icon-shouye'
//     },
//     children: [
//       { path: 'index', component: () => import('@/views/order/Index'), name: 'orderDetail', meta: { title: 'orderDetail', icon: 'nan-icon-shouye' } },
//       { path: 'edit/:id(\\d+)', component: () => import('@/views/order/Edit'), name: 'editOrder', meta: { title: 'editOrder' }, hidden: true },
//       { path: 'add', component: () => import('@/views/order/Add'), name: 'addOrder', meta: { title: 'addOrder', icon: 'nan-icon-shouye' } }
//     ]
//   },
//   {
//     path: '/commodity',
//     component: comps['home'],
//     redirect: 'noredirect',
//     show: true,
//     meta: {
//       title: 'commodity',
//       icon: 'nan-icon-shouye'
//     },
//     children: [
//       { path: 'index', component: () => import('@/views/commodity/Index'), name: 'commodityDetail', meta: { title: 'commodityDetail', icon: 'nan-icon-shouye' } },
//       { path: 'edit/:id(\\d+)', component: () => import('@/views/commodity/Edit'), name: 'editCommodity', meta: { title: 'editCommodity' }, hidden: true },
//       { path: 'add', component: () => import('@/views/commodity/Add'), name: 'addCommodity', meta: { title: 'addCommodity', icon: 'nan-icon-shouye' } }
//     ]
//   },
//   {
//     path: '/class',
//     component: comps['home'],
//     redirect: 'noredirect',
//     show: true,
//     meta: {
//       title: 'class',
//       icon: 'nan-icon-shouye',
//       roles: ['admin', 'editor'] // you can set roles in root nav
//     },
//     children: [
//       { path: 'index', component: () => import('@/views/class/Index'), name: 'classDetail', meta: { title: 'classDetail', icon: 'nan-icon-shouye' } },
//       { path: 'edit/:id(\\d+)', component: () => import('@/views/class/Edit'), name: 'editClass', meta: { title: 'editClass' }, hidden: true },
//       { path: 'add', component: () => import('@/views/class/Add'), name: 'addOrder', meta: { title: 'addClass', icon: 'nan-icon-shouye' } }
//     ]
//   }
// ]

export const currentRouter = [
  {
    path: '',
    component: comps['home'],
    // show: true,
    meta: {
      title: '首页',
      icon: '#nan-icon-shouye'
    },
    redirect: 'index',
    children: [{
      path: 'index',
      component: () => import('@/views/public/Index'),
      name: 'index',
      meta: { title: '首页', icon: '#nan-icon-shouye' }
    }]
  },
  {
    path: '/user',
    component: comps['home'],
    redirect: '/user/info',
    hidden: true,
    children: [{
      path: 'info',
      component: () => import('@/views/user/Info'),
      name: 'info',
      meta: { title: '个人信息' },
      hidden: true
    }]
  }
  // {
  //   path: '/sad',
  //   component: comps['home'],
  //   redirect: '/sad/test1',
  //   // show: true,
  //   meta: {
  //     title: '测试',
  //     icon: 'nan-icon-shouye'
  //   },
  //   children: [{
  //     path: 'test1',
  //     component: () => import('@/views/public/Test'),
  //     name: 'test1',
  //     meta: { title: '测试', icon: '#nan-icon-shouye' }
  //   }]
  // }
]

export const router = new Router({
  routes: publicRouter,
  scrollBehavior: () => ({ y: 0 })
})

router.beforeEach((to, from, next) => {
  NProgress.start()
  if (sessionStorage.getItem('token')) {
    if (to.path === '/login') {
      next({path: '/'})
    } else {
      if (!store.getters.getUserInfo.length) {
        let user = JSON.parse(sessionStorage.getItem('user'))
        store.dispatch('setUserInfo', user)
      }
      if (!store.getters.getPrivateRouter.length) {
        let r = util.setMenus()
        if (r) {
          store.dispatch('setPrivateRouter', r).then(() => {
            router.addRoutes(store.getters.getPrivateRouter)
            next({ ...to, replace: true })
          })
        } else {
          sessionStorage.removeItem('token')
          sessionStorage.removeItem('menus')
          store.dispatch('setPrivateRouter', null)
          next({path: '/login'})
        }
      } else {
        next()
      }
    }
  } else {
    if (to.path !== '/login') {
      next({path: '/login'})
    } else {
      next()
    }
  }
  NProgress.done()
})

router.afterEach(to => {
  NProgress.done()
})
export default router
