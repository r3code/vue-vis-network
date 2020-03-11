const path = require("path");

module.exports = {  
  configureWebpack: {
    resolve: {
      alias: {
        "@": path.join(__dirname, "example", "src")
      }
    },
    entry: {
      app: path.join(__dirname, "example", "src", "main.js")
    },
    
  },

  // Configure Webpack's dev server.
  // https://github.com/vuejs/vue-cli/blob/dev/docs/cli-service.md
  devServer: {
    contentBase:  path.join(__dirname, "example","public"),
    headers: {
      "Access-Control-Allow-Origin": "*",
    }
  }
};
