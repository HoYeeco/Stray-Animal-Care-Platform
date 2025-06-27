<template>
  <header>
    <Manage />
  </header>
  <main>
    <router-view></router-view>
  </main>
</template>

<script setup>
// 引入 Manage 组件
import Manage from './components/Manage.vue';
</script>

<style scoped>
header {
  line-height: 1.5;
}

.logo {
  display: block;
  margin: 0 auto 2rem;
}

@media (min-width: 1024px) {
  header {
    display: flex;
    place-items: center;
    padding-right: calc(var(--section-gap) / 2);
  }

  .logo {
    margin: 0 2rem 0 0;
  }

  header .wrapper {
    display: flex;
    place-items: flex-start;
    flex-wrap: wrap;
  }
}
</style>

<style>
html, body {
  width: 100%;
  margin: 0;
  padding: 0;
  overflow-x: hidden;
}

main {
  padding-top: 64px; /* 为固定导航栏留出空间 */
  width: 100%;
  min-height: calc(100vh - 64px); /* 确保内容区域高度 */
}

#app {
  padding-top: 0; /* 移除顶部内边距，避免导航栏位置异常 */
}
</style>