import { createRouter, createWebHistory } from 'vue-router'

const router = createRouter({
  history: createWebHistory(import.meta.env.BASE_URL),
  routes: [
    {
      path: '/',
      name: 'home',
      component:() => import('../views/home.vue')
    },
    {
      path: '/usercenter',
      name: 'usercenter',
      component:() => import('../views/usercenter.vue')
    },
    {
      path: '/usercenter/modify',
      name: 'modify',
      component:() => import('../views/modify.vue')
    },
    {
      path: '/list/:id',
      name: 'list',
      component:() => import('../views/list.vue')
    },
    {
      path: '/detail/:id',
      name: 'detail',
      component:() => import('../views/detail.vue')
    },
    {
      path: '/admin/index',
      name: 'admin',
      component:() => import('../views/admin/index.vue')
    },

    {
      path: '/admin/article',
      name: 'article',
      component:() => import('../views/admin/article.vue')
    },
    {
      path: '/admin/star',
      name: 'admin_star',
      component:() => import('../views/admin/star.vue')
    },
    {
      path: '/search/:keyword',
      name: 'search',
      component:() => import('../views/searchresult.vue')
    },
    {
      path: '/star',
      name: 'star',
      component:() => import('../views/star.vue')
    },
    {
      path: '/starnews/:starid',
      name: 'starnews',
      component:() => import('../views/starnews.vue')
    },
    {
      path: '/searchstar/:keyword',
      name: 'searchstar',
      component:() => import('../views/searchstarresult.vue')
    }, 

  ]
})

export default router
