const { defineConfig } = require("@vue/cli-service");
const AutoImport = require("unplugin-auto-import/webpack");
const Components = require("unplugin-vue-components/webpack");
const { ElementPlusResolver } = require("unplugin-vue-components/resolvers");

module.exports = defineConfig({
  transpileDependencies: true,
  publicPath: "./",
  outputDir: process.env.outputDir,

  // 添加以下配置以启用Element Plus的按需导入
  configureWebpack: {
    plugins: [
      AutoImport({
        resolvers: [ElementPlusResolver()],
      }),
      Components({
        resolvers: [ElementPlusResolver()],
      }),
    ],
  },

  // 为了更好的TypeScript支持（如果使用的话）
  pluginOptions: {
    "unplugin-vue-components": {
      /* global */
    },
  },
});
