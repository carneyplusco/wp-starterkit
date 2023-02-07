# WP Starter Kit
## Requirements
* Node 10+

## Setup
1. Clone the repo into your themes directory:
`npx degit git@github.com:carneyplusco/wp-starterkit.git your-project`
2. From the theme directory, run the scaffold generator to fill in some defaults:
`npx hygen scaffold new`
    *  Overrwite the current `.gitignore` if prompted
3. From the theme directory, run `composer install` to install PHP packages/plugins
4. From the theme directory, run `npm install` to install JS dependencies
5. Before running the project, uncomment the commented variables section in `_variables.scss` and update the vars as needed. This is because we need the `$theme-colors` set before the SCSS can compile.

## Local Development

Boot your WordPress install via Local/Docker/etc and run `npm start` from the theme to start `parcel` which watches and builds the following directories and files, forcing hot reloads on saved changes.

* `assets/styles/main.scss`
* `assets/styles/editor.scss`
* All Javascript files inside `assets/scripts/`
* All assets inside `asset/images`
* All Javascript and SCSS files that do not begin with an `_` inside all directories inside `blocks`

> Your local domain is derived from the theme name. Check the `LOCAL_DOMAIN` constant in `functions.php`

### Building
Run `npm run build` from the theme directory to compile assets for production

### Deployment
Run `npm run deploy:ENV` from the theme directory to deploy where ENV is one of `staging` or `production`.

> For now, deploys are done locally so be sure your master branch is up-to-date before deploying to production.

## Development Notes

### ACF
This theme is heavily dependent on ACF Pro and was developed assuming that any site that uses it also uses ACF Pro. If this is not the case, your mileage *will* vary.

A custom Developer user role is added and is the only user role that can see the ACF Options page.

### Block Assets
This theme by default utilizes the `should_load_separate_core_block_assets` filter in `init` within the generated `functions.php`. The positive effect of this is only scripts and styles relevant to blocks on the current page are loaded; the negative is styles specifically are loaded _after_ the `<footer>`, which can cause issues where content appears on the page before styles for it appear, aka cumulative layout shift or CLS. This is a tradeoff for smaller initial css load. To disable, remove this filter or change to `__return_true`. Disabling this will load all individually registered scripts on every page within the `<head>`.

### Block Creation
Run the block generator `npx hygen block new` to create a custom block. This creates a subdirectory that shares its name with the block name, as well as `block.json`, `block-name.php`, `block-name.scss`, `block-name.js` inside. It is important for block registration that all generated files remain in the block folder and are not renamed. `parcel` will not watch files that begin with `_`, so you may split modules or partials out with this prefix and `import` or `@use` them as needed.

Blocks inside `blocks/` are auto-registered by the `acf/init` action within `includes/blocks.php`. Note: if there are no blocks present inside `blocks/`, the structure of `dist/` (output by `parcel`) will change, building children of `assets/` to `dist/` instead of `dist/assets/`. This is more or less accounted for in `asset_path()` within `includes/utilities.php`, but it is worth being aware of this quirk.
