---
to: composer.json
---
{
  "name": "carney/<%= h.changeCase.param(theme_name) %>",
  "license": "MIT",
  "description": "Composer packages for <%= theme_name %>",
  "authors": [
    {
      "name": "Carney",
      "email": "dev.team@carney.co",
      "homepage": "http://carney.co"
    }
  ],
  "keywords": [
    "wordpress"
  ],
  "repositories": [
    {
      "type": "composer",
      "url": "https://wpackagist.org"
    },
    {
      "type": "vcs",
      "url": "git@carney.codes:wp-plugins/building-blocks.git"
    }
  ],
  "require": {
    "carney/building-blocks": "dev-master",
    "wpackagist-plugin/duplicate-post": "^3.2",
    "wpackagist-plugin/redirection": "^4.1",
    "wpackagist-plugin/enable-media-replace": "^3.2",
    "wpackagist-plugin/wordpress-seo": "^13.0",
    "wpackagist-plugin/safe-svg": "^1.9",
    "wpackagist-plugin/wordpress-importer": "^0.7.0",
    "wpackagist-plugin/wordfence": "^7.4",
    "wpackagist-plugin/wp-mail-smtp": "^2.1",
    "wpackagist-plugin/duracelltomi-google-tag-manager": "^1.11",
    "wpackagist-plugin/google-analytics-for-wordpress": "^7.11",
    "wpackagist-plugin/simple-custom-post-order": "^2.5"
  },
  "extra": {
    "installer-paths": {
      "../../plugins/{$name}": ["type:wordpress-plugin"]
    }
  }
}
