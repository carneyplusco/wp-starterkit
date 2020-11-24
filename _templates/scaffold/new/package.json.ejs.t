---
to: package.json
---
{
  "name": "<%= h.changeCase.param(theme_name) %>",
  "version": "1.0.0",
  "description": "",
  "main": "webpack.config.js",
  "dependencies": {
    "bootstrap": "^4.5.2",
    "core-js": "^3.6.5",
    "hamburgers": "^1.1.3",
    "jquery": "^3.5.1",
    "popper.js": "^1.16.1"
  },
  "devDependencies": {
    "@babel/core": "^7.0.0",
    "@babel/preset-env": "^7.0.0",
    "@babel/preset-react": "^7.10.4",
    "@fullhuman/postcss-purgecss": "^1.1.0",
    "ajv": "^6.3.0",
    "autoprefixer": "^9.8.4",
    "babel-loader": "^8.0.2",
    "clean-webpack-plugin": "^0.1.19",
    "copy-webpack-plugin": "^6.0.3",
    "css-loader": "^4.3.0",
    "css-minimizer-webpack-plugin": "^1.1.4",
    "cssnano": "^4.1.10",
    "eslint": "^7.9.0",
    "file-loader": "^1.1.11",
    "mini-css-extract-plugin": "^0.11.2",
    "node-sass": "^4.14.1",
    "postcss-loader": "^2.1.3",
    "prettier": "^2.1.2",
    "prettier-eslint": "^11.0.0",
    "resolve-url-loader": "^3.1.1",
    "sass-loader": "^6.0.7",
    "source-map-loader": "^0.2.3",
    "style-loader": "^0.20.3",
    "svg-inline-loader": "^0.8.2",
    "terser-webpack-plugin": "^4.2.2",
    "url-loader": "^1.0.1",
    "webpack": "^4.43.0",
    "webpack-cli": "^3.3.11",
    "webpack-dev-server": "^3.11.0",
    "webpack-manifest-plugin": "^2.2.0",
    "webpack-merge": "^4.2.2"
  },
  "scripts": {
    "test": "echo \"Error: no test specified\" && exit 1",
    "start": "webpack-dev-server --config webpack.dev.js --mode development",
    "watch": "NODE_ENV=production webpack --config webpack.prod.js --mode development --watch",
    "build": "NODE_ENV=production webpack --config webpack.prod.js --mode production",
  },
  "browserslist": [
    "last 2 versions",
    "android 4",
    "opera 12"
  ],
  "author": "Carney",
  "license": "ISC"
}
