---
to: package.json
---
{
  "name": "<%= h.changeCase.param(theme_name) %>",
  "version": "1.0.0",
  "description": "",
  "devDependencies": {
    "@babel/core": "^7.20.7",
    "@parcel/transformer-sass": "^2.8.2",
    "@prettier/plugin-php": "^0.17.6",
    "bootstrap": "^5.2.0",
    "eslint": "^7.9.0",
    "eslint-config-airbnb": "^18.2.1",
    "eslint-config-prettier": "^8.3.0",
    "parcel": "^2.8.2",
    "prettier": "^2.5.1",
    "prettier-eslint": "^11.0.0",
    "sharp": "^0.31.3"
  },
  "scripts": {
	"clean": "rm -rf dist/ && rm -rf .parcel-cache",
    "start": "rm -rf dist/ && npx parcel watch 'blocks/**/*[scss, js]' 'assets/scripts/*.js' 'assets/styles/main.scss' 'assets/styles/editor.scss' 'assets/images/*' --no-source-maps",
    "build": "rm -rf dist/ && rm -rf .parcel-cache && npx parcel build 'blocks/**/*[scss, js]' 'assets/scripts/*.js' 'assets/styles/main.scss' 'assets/styles/editor.scss' 'assets/images/*' --no-source-maps",
    "deploy:staging": "rsync -azvh --progress --exclude '.git' --exclude 'node_modules' --exclude 'assets' --exclude '.parcel-cache' . <%= h.changeCase.param(staging_server) %>:/home/master/applications/<%= h.changeCase.param(application_name) %>/public_html/wp-content/themes/<%= h.changeCase.param(theme_name) %> --delete-after"
  },
  "browserslist": "> 0.5%, last 2 versions, not dead",
  "author": "Carney",
  "license": "ISC"
}
