const path = require("path");
const merge = require("webpack-merge");
const TerserPlugin = require("terser-webpack-plugin");
const CssMinimizerPlugin = require("css-minimizer-webpack-plugin");
const ManifestPlugin = require("webpack-manifest-plugin");
const CopyWebpackPlugin = require("copy-webpack-plugin");
const CleanWebpackPlugin = require("clean-webpack-plugin");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");
const common = require("./webpack.common");

module.exports = merge(common, {
  mode: "production",
  output: {
    filename: `[name].[hash].js`,
  },
  optimization: {
    minimizer: [
      // js minification
      new TerserPlugin({
        cache: true,
        parallel: true,
      }),
      // css minification
      new CssMinimizerPlugin({}),
    ],
  },
  plugins: [
    new CleanWebpackPlugin(path.resolve(__dirname, "dist")),
    new MiniCssExtractPlugin({
      filename: "[name].[hash].css",
    }),
    new CopyWebpackPlugin({
      patterns: [{ from: "assets/images", to: "[name].[contentHash].[ext]" }],
    }),
    new ManifestPlugin({
      publicPath: "dist/",
      map: (file) => {
        // Remove hashes from files copied with CopyWebpackPlugin
        file.name = file.name.replace(/(\.[a-f0-9]{32})(\..*)$/, "$2");
        return file;
      },
    }),
  ],
});
