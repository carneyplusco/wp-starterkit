const merge = require('webpack-merge');
const MiniCssExtractPlugin = require('mini-css-extract-plugin');
const common = require('./webpack.common');

module.exports = merge(common, {
  mode: 'development',
  devtool: 'cheap-module-eval-source-map',
  devServer: {
    compress: true,
    disableHostCheck: true,
    port: 9000,
    hot: true,
    publicPath: '/',
    headers: {
      "Access-Control-Allow-Origin": "*"
    },
  },
  plugins: [
    new MiniCssExtractPlugin({
      filename: 'styles/[name].css'
    }),
  ]
});
