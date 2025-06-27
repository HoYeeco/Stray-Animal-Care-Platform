import { createRouter, createWebHistory } from 'vue-router';

const router = createRouter({
  history: createWebHistory(),
  routes: [
    // 默认跳转页
    { path: '/', 
      redirect: '/home' 
    },
    // 主页
    { path: '/home', 
      name: 'home', 
      component: () => import('../views/Home.vue') 
    },
    // 上报流浪
    { 
      path: '/upload', 
      name: 'UploadStray', 
      component: () => import('../views/Upload/UploadStray.vue'), 
    },
  /*{ 
      path: '/upload', 
      component: () => import('../views/Upload/UploadStray.vue'), 
      children: [
        { path: 'records', name: 'UploadRecords', component: () => import('../views/Upload/UploadRecords.vue') },
      ]
    }, */
    // 上报流浪
    { 
      path: '/upload/records', 
      name: 'UploadRecords', 
      component: () => import('../views/Upload/UploadRecords.vue'), 
    },
    // 终止流浪
    { 
      path: '/adoption', 
      name: 'EndStray',
      component: () => import('../views/Adoption/EndStray.vue'), 
    },
    // 领养信息
    { 
      path: '/adoption/info', 
      name: 'AdoptionInfo', 
      component: () => import('../views/Adoption/AdoptionInfo.vue'), 
    },
    // 领养记录
    { 
      path: '/adoption/records', 
      name: 'AdoptionRecords', 
      component: () => import('../views/Adoption/AdoptionRecords.vue'), 
    },
    // 救助基地
    { 
      path: '/rescuebase', 
      name: 'RescueBase', 
      component: () => import('../views/RescueBase.vue') 
    },
    // 交流科普
    { 
      path: '/communication', 
      name: 'Communication', 
      component: () => import('../views/Communication/Communication.vue') 
    },
    // 社区论坛
    { 
      path: '/communication/forum', 
      name: 'Forum', 
      component: () => import('../views/Communication/Forum.vue') 
    },
    // 智能科普
    { 
      path: '/communication/ai', 
      name: 'AI', 
      component: () => import('../views/Communication/AI.vue') 
    },

  ]
});

export default router;