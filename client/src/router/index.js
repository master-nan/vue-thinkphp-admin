import Vue from 'vue'
import Router from 'vue-router'
import store from '@/store'
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

export const currentRouter = [
  {
    path: '',
    component: comps['home'],
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
]

export const router = new Router({
  mode: 'history',
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
