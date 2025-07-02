/** @type {import('tailwindcss').Config} */
module.exports = {
  content: [
    "./index.html",
    "./src/**/*.{vue,js,ts,jsx,tsx}",
  ],
  theme: {
    extend: {
      colors: {
        orange: {
          600: '#ea580c',
        },
      },
      
      // 添加 rgb 颜色支持
      backgroundColor: (theme) => ({ ...theme('colors'), 'rgb': (value) => `rgb(${value})` }),
    },
  },
  plugins: []
};