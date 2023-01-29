# WP Starter Kit

### Requirements

* Node 10+

### Setup

1. Clone the repo into your themes directory:
`npx degit git@github.com:carneyplusco/wp-starterkit.git your-project`
2. From the theme directory, run the scaffold generator to fill in some defaults:
`npx hygen scaffold new`
3. From the theme directory, run `composer install` to install PHP packages/plugins
4. From the theme directory, run `npm install` to install JS dependencies

## Local Development

Boot your WordPress install via Local/Docker/etc and run `npm start` from the theme to watch build files and provide a hot reload service via `parcel`. By default, `parcel` watches the following directories and files and hot reloads on saving changes.

* `assets/styles/main.scss`
* all Javascript files within `assets/scripts/`
* All assets within `asset/images`
* All Javascript and SCSS files that do not begin with an `_` within all directories inside `blocks`

> Your local domain is derived from the theme name. Check the `LOCAL_DOMAIN` constant in `functions.php`
## Building

Run `npm run build` from the theme directory to compile assets for production

## Deployment

Run `npm run deploy:ENV` from the theme directory to deploy where ENV is one of `staging` or `production`.

> For now, deploys are done locally so be sure your master branch is up-to-date before deploying to production.
## Development Notes

### ACF
This theme is heavily dependent on ACF Pro and was developed assuming that any site that uses it also uses ACF Pro. If this is not the case, your mileage *will* vary.

A custom Developer user role is added and is the only user role that can see the ACF Options page.

### Block Assets
This theme by default utilizes the `should_load_separate_core_block_assets` filter in `init` within the generated `functions.php`. The positive effect of this is only scripts and styles relevant to blocks on the current page are loaded; the negative is styles specifically are loaded _after_ the `<footer>`, which can cause issues where content appears on the page before styles for it appear, aka cumulative layout shift or CLS. This is a tradeoff for smaller initial css load. To disable, remove this filter or change to `__return_true`. Disabling this will load all individually registered scripts on every page within the `<head>`.

### Block Creation
Run the block generator `npx hygen block new` to create a custom block. This creates a subdirectory that shares its name with the block name, as well as `block.json`, `block-name.php`, `block-name.scss`, `block-name.js` within it. It is important for block registration that all generated files remain in the block folder and are not renamed. `parcel` will not watch files that begin with `_`, so you may split modules or partials out with this prefix and `import` or `@use` them as needed.

Blocks within `blocks/` are auto-registered by the `acf/init` action within `includes/blocks.php`. Note: if there are no blocks present in `blocks/`, the structure of `dist/` (output by Parcel) will change, building children of `assets/` to `dist/` instead of `dist/assets/`. This is more or less accounted for in `asset_path()` within the generated `functions.php` file, but it is worth being aware of this quirk.
