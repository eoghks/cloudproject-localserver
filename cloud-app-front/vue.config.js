const { defineConfig } = require('@vue/cli-service')
var path = require("path");
module.exports = defineConfig({
  // publicPath: process.env.NODE_ENV === 'production'
  //   ? '/https://localhost:3000/'
  //   : '/' ,
  transpileDependencies: true,
  // devServer:{
  //   proxy: {
  //   '/getItem': {
  //     target: 'http://localhost:3000/getItem',
  //     changeOrigin: true,
  //     pathRewrite: {
  //       "^api": ''
  //     },
  //   }
  // }
  // },
  outputDir: path.resolve('../backend/public'),

})
