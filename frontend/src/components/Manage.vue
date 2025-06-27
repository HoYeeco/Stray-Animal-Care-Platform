<template>
    <nav class="bg-white shadow-md fixed w-full z-50 transition-all duration-300" :class="{'bg-opacity-95': scrollPosition > 50, 'bg-opacity-100': scrollPosition <= 50}">
      <div class="w-full px-4">
        <div class="flex justify-between items-center h-16">

          <!-- Logo&平台主题 -->
          <div class="flex items-center space-x-5">
            <img src="../assets/icons/pawprint.png" alt="Logo" class="w-8 h-8">
            <span class="text-xl font-bold text-gray-800 tracking-tight">爪印归途</span>
          </div>

          <!-- 导航栏菜单 -->
          <div class="flex space-x-8">
            <!-- 主页 -->
            <router-link to="/" class="nav-link">主页</router-link>
            <!-- 上报流浪 -->
            <div class="relative group">
              <router-link to="/upload" class="nav-link flex items-center">上报流浪</router-link>
              <div class="absolute left-0 mt-2 w-48 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 opacity-0 group-hover:opacity-100 group-hover:visible transition-all duration-300 z-50 transform origin-top-right scale-95 group-hover:scale-100 dropdown-enter-active dropdown-leave-active">
                <div class="py-1" role="menu" aria-orientation="vertical">
                  <router-link to="/upload/records" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">上报记录</router-link>
                </div>
              </div>
            </div>
            <!-- 终止流浪 -->
            <div class="relative group">
              <router-link to="/adoption" class="nav-link flex items-center">终止流浪</router-link>
              <div class="absolute left-0 mt-2 w-48 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 opacity-0 group-hover:opacity-100 group-hover:visible transition-all duration-300 z-50 transform origin-top-right scale-95 group-hover:scale-100 dropdown-enter-active dropdown-leave-active">
                <div class="py-1" role="menu" aria-orientation="vertical">
                  <router-link to="/adoption/info" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">领养信息</router-link>
                  <router-link to="/adoption/records" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">领养记录</router-link>
                </div>
              </div>
            </div>
            <!-- 救助基地 -->
            <router-link to="/rescuebase" class="nav-link flex items-center">救助基地</router-link>
            <!-- 交流科普 -->
            <div class="relative group">
              <router-link to="/communication" class="nav-link flex items-center">交流科普</router-link>
              <div class="absolute left-0 mt-2 w-48 rounded-md shadow-lg bg-white ring-1 ring-black ring-opacity-5 opacity-0 group-hover:opacity-100 group-hover:visible transition-all duration-300 z-50 transform origin-top-right scale-95 group-hover:scale-100 dropdown-enter-active dropdown-leave-active">
                <div class="py-1" role="menu" aria-orientation="vertical">
                  <router-link to="/communication/forum" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">社区论坛</router-link>
                  <router-link to="/communication/ai" class="block px-4 py-2 text-sm text-gray-700 hover:bg-gray-100">智能科普</router-link>
                </div>
              </div>
            </div>
          </div>
  
          <!-- 用户名 -->
          <div class="flex items-center">
            <div class="flex items-center">
              <span class="ml-2 font-medium text-gray-700 user-info-text">宠物爱好者</span>
            </div>
          </div>
        </div>
      </div>
    </nav>
  </template>
  
<script setup>
import { onMounted, onBeforeUnmount, ref } from 'vue';

/* 导入 font-awesome 字体库 */
import '@fortawesome/fontawesome-free/css/all.css';
const scrollPosition = ref(0);

const handleScroll = () => {
  scrollPosition.value = window.scrollY;
};

onMounted(() => {
  window.addEventListener('scroll', handleScroll);
});

onBeforeUnmount(() => {
  window.removeEventListener('scroll', handleScroll);
});
</script>
  
<style scoped>
  /* 用户信息样式 */
  .user-info-text {
    max-width: 200px;
    overflow: hidden;
    text-overflow: ellipsis;
    white-space: nowrap;
  }

  /* 导航链接基础样式 */
  .nav-link {
    @apply px-3 py-2 rounded-md text-base font-medium text-gray-700 hover:text-orange-600 transition-colors duration-200;
  }
  
  /* 当前激活的导航链接 */
  .router-link-exact-active {
    @apply text-orange-600 font-semibold;
  }
  
  /* 滚动时导航栏样式变化 */
  @media (min-width: 768px) {
    .nav-scrolled {
      @apply shadow-lg bg-opacity-95;
    }
  }
  
  /* 下拉菜单的动画效果 */
  .dropdown-enter-active, .dropdown-leave-active {
    transition: all 0.3s ease;
  }
  
  .dropdown-enter-from, .dropdown-leave-to {
    opacity: 0;
    transform: translateY(-10px);
  }

  nav {
    top: 0; /* 确保导航栏固定在顶部 */
  }
</style>
      