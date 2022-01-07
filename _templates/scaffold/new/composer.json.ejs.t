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
    "wpackagist-plugin/duplicate-post": "^4.3",
    "wpackagist-plugin/redirection": "^5.1",
    "wpackagist-plugin/enable-media-replace": "^3.6",
    "wpackagist-plugin/wordpress-seo": "^17.8",
    "wpackagist-plugin/safe-svg": "^1.9",
    "wpackagist-plugin/wordpress-importer": "^0.7.0",
    "wpackagist-plugin/wordfence": "^7.5",
    "wpackagist-plugin/wp-mail-smtp": "^3.2",
    "wpackagist-plugin/duracelltomi-google-tag-manager": "^1.14",
    "wpackagist-plugin/google-analytics-for-wordpress": "^8.3",
    "wpackagist-plugin/simple-custom-post-order": "^2.5"
  },
  "extra": {
    "installer-paths": {
      "../../plugins/{$name}": ["type:wordpress-plugin"]
    }
  }
}
