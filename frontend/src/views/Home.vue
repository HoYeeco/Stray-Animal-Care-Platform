<template>
  <div class="min-h-screen bg-gray-50">
    <!-- 主要内容区域 -->
    <main class="pt-24 pb-16 px-4 md:px-8 max-w-7xl mx-auto">
      <!-- 英雄区域 -->
      <section class="relative bg-gradient-to-r from-orange-500 to-orange-600 rounded-2xl overflow-hidden shadow-xl mb-16 aspect-video md:aspect-auto">
        <div class="absolute inset-0 bg-black opacity-10"></div>
        <div class="relative z-10 px-6 py-12 md:py-20 md:px-12">
          <div class="max-w-3xl">
            <h1 class="text-[clamp(2rem,5vw,3.5rem)] font-bold text-white leading-tight mb-4">
              每一个生命都值得被温柔以待
            </h1>
            <p class="text-[clamp(1rem,2vw,1.25rem)] text-white/90 mb-8 max-w-2xl">
              我们致力于为流浪动物提供一个温暖的家，通过信息共享、领养对接和救助支持，让每一只流浪动物都能重获新生。
            </p>
            <div class="flex flex-wrap gap-4">
              <router-link to="/report" class="bg-white text-orange-600 px-6 py-3 rounded-full font-semibold shadow-lg hover:shadow-xl transition-all duration-300 transform hover:-translate-y-1">
                上报流浪动物
              </router-link>
              <router-link to="/adopt" class="bg-transparent border-2 border-white text-white px-6 py-3 rounded-full font-semibold hover:bg-white/10 transition-all duration-300">
                我要领养
              </router-link>
            </div>
          </div>
        </div>
        <div class="absolute bottom-0 right-0 w-full h-full md:w-1/2 md:h-full overflow-hidden">
          <img src="https://picsum.photos/id/237/800/600" alt="流浪动物救助" class="w-full h-full object-cover md:scale-110 transform origin-bottom-right">
        </div>
      </section>
      
      <!-- 平台数据 -->
      <section class="grid grid-cols-1 md:grid-cols-3 gap-6 mb-16">
        <div class="bg-white rounded-xl shadow-md p-6 transform transition-all duration-300 hover:shadow-lg hover:-translate-y-1">
          <div class="flex items-center mb-4">
            <div class="bg-orange-100 p-3 rounded-full">
              <i class="fa fa-home text-orange-500 text-xl"></i>
            </div>
            <h3 class="ml-3 text-xl font-semibold text-gray-800">成功救助</h3>
          </div>
          <p class="text-4xl font-bold text-gray-800 mb-2">1,284</p>
          <p class="text-gray-600">一只流浪动物获得新生</p>
        </div>
        
        <div class="bg-white rounded-xl shadow-md p-6 transform transition-all duration-300 hover:shadow-lg hover:-translate-y-1">
          <div class="flex items-center mb-4">
            <div class="bg-orange-100 p-3 rounded-full">
              <i class="fa fa-heart text-orange-500 text-xl"></i>
            </div>
            <h3 class="ml-3 text-xl font-semibold text-gray-800">爱心领养</h3>
          </div>
          <p class="text-4xl font-bold text-gray-800 mb-2">856</p>
          <p class="text-gray-600">个家庭收获幸福</p>
        </div>
        
        <div class="bg-white rounded-xl shadow-md p-6 transform transition-all duration-300 hover:shadow-lg hover:-translate-y-1">
          <div class="flex items-center mb-4">
            <div class="bg-orange-100 p-3 rounded-full">
              <i class="fa fa-users text-orange-500 text-xl"></i>
            </div>
            <h3 class="ml-3 text-xl font-semibold text-gray-800">志愿者</h3>
          </div>
          <p class="text-4xl font-bold text-gray-800 mb-2">327</p>
          <p class="text-gray-600">人加入救助行列</p>
        </div>
      </section>
      
      <!-- 最新救助信息 -->
      <section class="mb-16">
        <div class="flex justify-between items-center mb-8">
          <h2 class="text-2xl md:text-3xl font-bold text-gray-800">最新救助信息</h2>
          <router-link to="/rescue-center" class="text-orange-600 font-medium hover:underline flex items-center">
            查看更多 <i class="fa fa-arrow-right ml-1"></i>
          </router-link>
        </div>
        
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-6">
          <!-- 救助卡片 1 -->
          <div class="bg-white rounded-xl shadow-md overflow-hidden transition-all duration-300 hover:shadow-xl group">
            <div class="relative h-56 overflow-hidden">
              <img src="https://picsum.photos/id/169/600/400" alt="被救助的橘猫" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110">
              <div class="absolute top-3 left-3 bg-orange-500 text-white text-sm font-semibold px-3 py-1 rounded-full">
                已领养
              </div>
            </div>
            <div class="p-5">
              <h3 class="text-xl font-semibold text-gray-800 mb-2">小橘的故事</h3>
              <p class="text-gray-600 mb-4">这只可爱的橘猫在公园被发现时非常瘦弱，经过志愿者的救助和照顾，现在已经找到了温暖的新家。</p>
              <div class="flex justify-between items-center">
                <span class="text-sm text-gray-500">救助于 2023-05-12</span>
                <router-link to="/rescue/detail/1" class="text-orange-600 font-medium hover:underline">
                  查看详情
                </router-link>
              </div>
            </div>
          </div>
          
          <!-- 救助卡片 2 -->
          <div class="bg-white rounded-xl shadow-md overflow-hidden transition-all duration-300 hover:shadow-xl group">
            <div class="relative h-56 overflow-hidden">
              <img src="https://picsum.photos/id/237/600/400" alt="被救助的狗狗" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110">
              <div class="absolute top-3 left-3 bg-blue-500 text-white text-sm font-semibold px-3 py-1 rounded-full">
                待领养
              </div>
            </div>
            <div class="p-5">
              <h3 class="text-xl font-semibold text-gray-800 mb-2">阿黄的等待</h3>
              <p class="text-gray-600 mb-4">这只温顺的狗狗在路边被发现，经过体检和疫苗接种，现在健康状况良好，正在等待一个温暖的家。</p>
              <div class="flex justify-between items-center">
                <span class="text-sm text-gray-500">救助于 2023-06-05</span>
                <router-link to="/rescue/detail/2" class="text-orange-600 font-medium hover:underline">
                  查看详情
                </router-link>
              </div>
            </div>
          </div>
          
          <!-- 救助卡片 3 -->
          <div class="bg-white rounded-xl shadow-md overflow-hidden transition-all duration-300 hover:shadow-xl group">
            <div class="relative h-56 overflow-hidden">
              <img src="https://picsum.photos/id/1025/600/400" alt="救助中的猫咪" class="w-full h-full object-cover transition-transform duration-500 group-hover:scale-110">
              <div class="absolute top-3 left-3 bg-yellow-500 text-white text-sm font-semibold px-3 py-1 rounded-full">
                救助中
              </div>
            </div>
            <div class="p-5">
              <h3 class="text-xl font-semibold text-gray-800 mb-2">小花的康复之路</h3>
              <p class="text-gray-600 mb-4">这只猫咪被发现时受伤严重，目前正在接受治疗，志愿者们正在努力帮助它恢复健康。</p>
              <div class="flex justify-between items-center">
                <span class="text-sm text-gray-500">救助于 2023-06-20</span>
                <router-link to="/rescue/detail/3" class="text-orange-600 font-medium hover:underline">
                  查看详情
                </router-link>
              </div>
            </div>
          </div>
        </div>
      </section>
      
      <!-- 平台功能介绍 -->
      <section class="bg-white rounded-2xl shadow-lg p-8 md:p-12 mb-16">
        <h2 class="text-2xl md:text-3xl font-bold text-gray-800 mb-10 text-center">我们的平台功能</h2>
        
        <div class="grid grid-cols-1 md:grid-cols-2 lg:grid-cols-3 gap-8">
          <div class="flex flex-col items-center text-center p-6 rounded-xl hover:bg-gray-50 transition-colors duration-300">
            <div class="bg-orange-100 p-4 rounded-full mb-4">
              <i class="fa fa-paw text-orange-500 text-2xl"></i>
            </div>
            <h3 class="text-xl font-semibold text-gray-800 mb-3">流浪动物上报</h3>
            <p class="text-gray-600">发现流浪动物？通过我们的平台快速上报，提供位置和照片，帮助流浪动物获得及时救助。</p>
          </div>
          
          <div class="flex flex-col items-center text-center p-6 rounded-xl hover:bg-gray-50 transition-colors duration-300">
            <div class="bg-orange-100 p-4 rounded-full mb-4">
              <i class="fa fa-heart text-orange-500 text-2xl"></i>
            </div>
            <h3 class="text-xl font-semibold text-gray-800 mb-3">爱心领养</h3>
            <p class="text-gray-600">浏览待领养的动物信息，找到适合你的伙伴，给它们一个温暖的家，同时收获一份陪伴。</p>
          </div>
          
          <div class="flex flex-col items-center text-center p-6 rounded-xl hover:bg-gray-50 transition-colors duration-300">
            <div class="bg-orange-100 p-4 rounded-full mb-4">
              <i class="fa fa-medkit text-orange-500 text-2xl"></i>
            </div>
            <h3 class="text-xl font-semibold text-gray-800 mb-3">救助基地</h3>
            <p class="text-gray-600">了解流浪动物的救助情况，查看它们的康复进度，支持救助基地的工作，为它们提供帮助。</p>
          </div>
          
          <div class="flex flex-col items-center text-center p-6 rounded-xl hover:bg-gray-50 transition-colors duration-300">
            <div class="bg-orange-100 p-4 rounded-full mb-4">
              <i class="fa fa-comments text-orange-500 text-2xl"></i>
            </div>
            <h3 class="text-xl font-semibold text-gray-800 mb-3">社区论坛</h3>
            <p class="text-gray-600">与其他爱心人士交流经验，分享救助故事，讨论动物保护话题，共同成长。</p>
          </div>
          
          <div class="flex flex-col items-center text-center p-6 rounded-xl hover:bg-gray-50 transition-colors duration-300">
            <div class="bg-orange-100 p-4 rounded-full mb-4">
              <i class="fa fa-book text-orange-500 text-2xl"></i>
            </div>
            <h3 class="text-xl font-semibold text-gray-800 mb-3">宠物科普</h3>
            <p class="text-gray-600">获取专业的养宠知识，了解动物行为和健康护理，成为一个负责任的宠物主人。</p>
          </div>
          
          <div class="flex flex-col items-center text-center p-6 rounded-xl hover:bg-gray-50 transition-colors duration-300">
            <div class="bg-orange-100 p-4 rounded-full mb-4">
              <i class="fa fa-handshake-o text-orange-500 text-2xl"></i>
            </div>
            <h3 class="text-xl font-semibold text-gray-800 mb-3">志愿者招募</h3>
            <p class="text-gray-600">加入我们的志愿者团队，参与救助活动，为流浪动物贡献你的一份爱心和力量。</p>
          </div>
        </div>
      </section>
      
      <!-- 领养流程 -->
      <section class="mb-16">
        <h2 class="text-2xl md:text-3xl font-bold text-gray-800 mb-10 text-center">领养流程</h2>
        
        <div class="relative">
          <!-- 连接线 -->
          <div class="hidden md:block absolute left-1/2 top-0 bottom-0 w-1 bg-gray-200 transform -translate-x-1/2"></div>
          
          <div class="space-y-8 md:space-y-0">
            <!-- 步骤 1 -->
            <div class="relative flex flex-col md:flex-row items-center">
              <div class="md:w-1/2 md:pr-12 md:text-right order-2 md:order-1 mt-4 md:mt-0">
                <h3 class="text-xl font-semibold text-gray-800 mb-2">浏览和选择</h3>
                <p class="text-gray-600">浏览我们平台上的待领养动物，根据你的喜好和生活条件选择合适的伙伴。</p>
              </div>
              <div class="z-10 flex items-center justify-center w-12 h-12 bg-orange-500 rounded-full text-white text-xl font-bold order-1 md:order-2">
                1
              </div>
              <div class="md:w-1/2 md:pl-12 order-3 hidden md:block"></div>
            </div>
            
            <!-- 步骤 2 -->
            <div class="relative flex flex-col md:flex-row items-center">
              <div class="md:w-1/2 md:pr-12 order-1 md:order-1 hidden md:block"></div>
              <div class="z-10 flex items-center justify-center w-12 h-12 bg-orange-500 rounded-full text-white text-xl font-bold order-2">
                2
              </div>
              <div class="md:w-1/2 md:pl-12 order-3 md:order-3 mt-4 md:mt-0">
                <h3 class="text-xl font-semibold text-gray-800 mb-2">提交申请</h3>
                <p class="text-gray-600">填写领养申请表，提供必要的个人信息和家庭条件，我们会尽快审核你的申请。</p>
              </div>
            </div>
            
            <!-- 步骤 3 -->
            <div class="relative flex flex-col md:flex-row items-center">
              <div class="md:w-1/2 md:pr-12 md:text-right order-2 md:order-1 mt-4 md:mt-0">
                <h3 class="text-xl font-semibold text-gray-800 mb-2">面谈和家访</h3>
                <p class="text-gray-600">我们会与你进行面谈，了解你的养宠经验和准备情况，必要时会进行家访。</p>
              </div>
              <div class="z-10 flex items-center justify-center w-12 h-12 bg-orange-500 rounded-full text-white text-xl font-bold order-1 md:order-2">
                3
              </div>
              <div class="md:w-1/2 md:pl-12 order-3 hidden md:block"></div>
            </div>
            
            <!-- 步骤 4 -->
            <div class="relative flex flex-col md:flex-row items-center">
              <div class="md:w-1/2 md:pr-12 order-1 md:order-1 hidden md:block"></div>
              <div class="z-10 flex items-center justify-center w-12 h-12 bg-orange-500 rounded-full text-white text-xl font-bold order-2">
                4
              </div>
              <div class="md:w-1/2 md:pl-12 order-3 md:order-3 mt-4 md:mt-0">
                <h3 class="text-xl font-semibold text-gray-800 mb-2">领养签约</h3>
                <p class="text-gray-600">申请通过后，签署领养协议，支付少量领养押金（退还条件），准备迎接新成员。</p>
              </div>
            </div>
            
            <!-- 步骤 5 -->
            <div class="relative flex flex-col md:flex-row items-center">
              <div class="md:w-1/2 md:pr-12 md:text-right order-2 md:order-1 mt-4 md:mt-0">
                <h3 class="text-xl font-semibold text-gray-800 mb-2">接宠回家</h3>
                <p class="text-gray-600">在专业人员的指导下，将新伙伴带回家，开始你们的幸福生活。</p>
              </div>
              <div class="z-10 flex items-center justify-center w-12 h-12 bg-orange-500 rounded-full text-white text-xl font-bold order-1 md:order-2">
                5
              </div>
              <div class="md:w-1/2 md:pl-12 order-3 hidden md:block"></div>
            </div>
          </div>
        </div>
      </section>
      
      <!-- 爱心呼吁 -->
      <section class="bg-orange-50 rounded-2xl p-8 md:p-12 mb-16">
        <div class="max-w-4xl mx-auto text-center">
          <h2 class="text-2xl md:text-3xl font-bold text-gray-800 mb-6">加入我们，一起改变它们的命运</h2>
          <p class="text-gray-600 mb-8 text-lg">每一只流浪动物都有自己的故事，每一个生命都值得被尊重和爱护。无论你是想领养、救助还是成为志愿者，我们都欢迎你的加入。</p>
          <div class="flex flex-wrap justify-center gap-4">
            <router-link to="/upload" class="bg-orange-500 hover:bg-orange-600 text-black px-6 py-3 rounded-full font-semibold shadow-md hover:shadow-lg transition-all duration-300 transform hover:-translate-y-1">
              上报流浪
            </router-link>
            <router-link to="/adoption/info" class="bg-orange-500 hover:bg-orange-600 text-black px-6 py-3 rounded-full font-semibold shadow-md hover:shadow-lg transition-all duration-300 transform hover:-translate-y-1">
              领养信息
            </router-link>
            <router-link to="/rescuebase" class="bg-orange-500 hover:bg-orange-600 text-black px-6 py-3 rounded-full font-semibold shadow-md hover:shadow-lg transition-all duration-300 transform hover:-translate-y-1">
              救助基地
            </router-link>
          </div>
        </div>
      </section>
    </main>
    
    <!-- 页脚 -->
    <footer class="bg-gray-800 text-white pt-12 pb-6">
      <div class="container mx-auto px-4">
        <div class="grid grid-cols-1 md:grid-cols-4 gap-8 mb-8">
          <div>
            <div class="flex items-center space-x-2 mb-4">
              <svg class="w-6 h-6 text-orange-400" viewBox="0 0 24 24" fill="currentColor">
                <path d="M12.5,2C11.67,2 11,2.67 11,3.5C11,4.33 11.67,5 12.5,5C13.33,5 14,4.33 14,3.5C14,2.67 13.33,2 12.5,2M16.5,6C15.67,6 15,6.67 15,7.5C15,8.33 15.67,9 16.5,9C17.33,9 18,8.33 18,7.5C18,6.67 17.33,6 16.5,6M9.5,6C8.67,6 8,6.67 8,7.5C8,8.33 8.67,9 9.5,9C10.33,9 11,8.33 11,7.5C11,6.67 10.33,6 9.5,6M5,10.5C5,9.67 5.67,9 6.5,9C7.33,9 8,9.67 8,10.5V11C8,11.53 8.21,12.04 8.59,12.41C8.96,12.79 9.47,13 10,13H14C14.53,13 15.04,12.79 15.41,12.41C15.79,12.04 16,11.53 16,11V10.5C16,9.67 16.67,9 17.5,9C18.33,9 19,9.67 19,10.5V11C19,12.65 17.65,14 16,14H8C6.35,14 5,12.65 5,11V10.5M3,15.5C3,14.12 4.12,13 5.5,13H18.5C19.88,13 21,14.12 21,15.5C21,16.88 19.88,18 18.5,18H5.5C4.12,18 3,16.88 3,15.5Z"/>
              </svg>
              <span class="text-xl font-bold">爪印归途</span>
            </div>
            <p class="text-gray-400 mb-4">让每一只流浪动物都能找到回家的路</p>
            <div class="flex space-x-4">
              <a href="#" class="text-gray-400 hover:text-white transition-colors duration-300">
                <i class="fa fa-weixin text-xl"></i>
              </a>
              <a href="#" class="text-gray-400 hover:text-white transition-colors duration-300">
                <i class="fa fa-weibo text-xl"></i>
              </a>
              <a href="#" class="text-gray-400 hover:text-white transition-colors duration-300">
                <i class="fa fa-instagram text-xl"></i>
              </a>
            </div>
          </div>
          
          <div>
            <h3 class="text-lg font-semibold mb-4">快速链接</h3>
            <ul class="space-y-2">
              <li><a href="#" class="text-gray-400 hover:text-white transition-colors duration-300">关于我们</a></li>
              <li><a href="#" class="text-gray-400 hover:text-white transition-colors duration-300">救助项目</a></li>
              <li><a href="#" class="text-gray-400 hover:text-white transition-colors duration-300">领养指南</a></li>
              <li><a href="#" class="text-gray-400 hover:text-white transition-colors duration-300">志愿者招募</a></li>
              <li><a href="#" class="text-gray-400 hover:text-white transition-colors duration-300">捐赠方式</a></li>
            </ul>
          </div>
          
          <div>
            <h3 class="text-lg font-semibold mb-4">联系方式</h3>
            <ul class="space-y-2">
              <li class="flex items-start">
                <i class="fa fa-map-marker text-orange-400 mt-1 mr-2"></i>
                <span class="text-gray-400">新疆省克拉玛依市安定路</span>
              </li>
              <li class="flex items-start">
                <i class="fa fa-phone text-orange-400 mt-1 mr-2"></i>
                <span class="text-gray-400">010-12345678</span>
              </li>
              <li class="flex items-start">
                <i class="fa fa-envelope text-orange-400 mt-1 mr-2"></i>
                <span class="text-gray-400">contact28@pawpathhome.org</span>
              </li>
            </ul>
          </div>
          
          <div>
            <h3 class="text-lg font-semibold mb-4">订阅我们</h3>
            <p class="text-gray-400 mb-4">订阅我们的电子邮件，获取最新的救助信息和活动通知</p>
            <div class="flex">
              <input type="email" placeholder="输入你的邮箱" class="px-4 py-2 bg-gray-700 text-white rounded-l-md focus:outline-none focus:ring-2 focus:ring-orange-400 w-full">
              <button class="bg-orange-500 hover:bg-orange-600 text-white px-4 py-2 rounded-r-md transition-colors duration-300">
                订阅
              </button>
            </div>
          </div>
        </div>
        
        <div class="border-t border-gray-700 pt-6 text-center text-gray-500 text-sm">
          <p>&copy; 2025 爪印归途 - 流浪动物救助信息交流平台. 保留所有权利.</p>
        </div>
      </div>
    </footer>
  </div>
</template>

<script>
import NavigationBar from '@/components/Manage.vue'

export default {
  name: 'Home',
  components: {
    NavigationBar
  },
  data() {
    return {
      // 页面数据
    }
  },
  mounted() {
    // 页面加载后执行
  },
  methods: {
    // 页面方法
  }
}
</script>

<style scoped>
/* 页面样式 */
</style>