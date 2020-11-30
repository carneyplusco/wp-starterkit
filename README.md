# WP Starter Kit

### Requirements

* Node 10+

### Setup

1. Clone the repo into your themes directory:
`npx degit git@github.com:carneyplusco/wp-starterkit.git your-project`
1. Run the scaffold generator to fill in some defaults:
`npx hygen scaffold new`

1. From the theme directory, run `composer install` to install PHP packages/plugins
1. From the theme directory, run `npm install` to install JS dependencies

## Local Development

1. Boot your WordPress install via Local/Docker/etc and run `npm start` from the theme directory to start the local development server

> Your local domain is derived from the theme name. Check the `LOCAL_DOMAIN` constant in `functions.php`

## Building

1. Run `npm run build` from the theme directory to compile assets for production

## Deployment

1. Run `npm run deploy:ENV` from the theme directory to deploy where ENV is one of `staging` or `production`.

> For now, deploys are done locally so be sure your master branch is up-to-date before deploying to production.
