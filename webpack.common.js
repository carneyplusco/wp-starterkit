const path = require("path");
const MiniCssExtractPlugin = require("mini-css-extract-plugin");

module.exports = {
  entry: {
    editor: ["./assets/scripts/editor.js", "./assets/styles/editor.scss"],
    main: ["./assets/scripts/main.js", "./assets/styles/main.scss"],
  },
  externals: {
    jquery: "jQuery",
  },
  output: {
    filename: "scripts/[name].js",
    path: path.resolve(__dirname, "dist"),
  },
  module: {
    rules: [
      {
        test: /\.js$/,
        exclude: /node_modules/,
        use: {
          loader: "babel-loader",
        },
      },
      {
        test: /\.(sass|scss|css)$/,
        use: [
          {
            loader: MiniCssExtractPlugin.loader,
            options: {
              publicPath: process.env.NODE_ENV === "production" ? "./" : "../",
            },
          },
          {
            loader: "css-loader",
          },
          {
            loader: "postcss-loader",
          },
          {
            loader: "sass-loader",
            options: {
              sassOptions: {
                quietDeps: true,
              },
            },
          },
        ],
      },
      {
        test: /\.(jpg|png|gif)([\?]?.*)$/,
        use: [
          {
            loader: "file-loader",
            options: {
              name: () =>
                process.env.NODE_ENV === "production"
                  ? "[name].[contentHash].[ext]"
                  : "[name].[ext]",
            },
          },
        ],
      },
      {
        test: /\.svg$/,
        loader: "svg-inline-loader",
      },
      {
        test: /\.(eot|woff|woff2|ttf)([\?]?.*)$/,
        use: [
          {
            loader: "file-loader",
            options: {
              name: () =>
                process.env.NODE_ENV === "production"
                  ? "[name].[contentHash].[ext]"
                  : "[name].[ext]",
            },
          },
        ],
      },
      {
        test: /\.(mp4)([\?]?.*)$/,
        use: [
          {
            loader: "file-loader",
            options: {
              name: () =>
                process.env.NODE_ENV === "production"
                  ? "[name].[contentHash].[ext]"
                  : "[name].[ext]",
            },
          },
        ],
      },
    ],
  },
};
