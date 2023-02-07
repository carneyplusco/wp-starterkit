---
to: composer.json
---
{
  "name": "carney/test-theme",
  "license": "MIT",
  "description": "Composer packages for Test Theme",
  "authors": [
    {
      "name": "Carney",
      "email": "dev.team@carney.co",
      "homepage": "https://carney.co"
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
    "wpackagist-plugin/enable-media-replace": "^3.6",
    "wpackagist-plugin/safe-svg": "^1.9",
    "wpackagist-plugin/wordpress-importer": "^0.7.0",
    "wpackagist-plugin/wordfence": "^7.5",
    "wpackagist-plugin/wp-mail-smtp": "^3.2",
    "wpackagist-plugin/duracelltomi-google-tag-manager": "^1.14",
    "wpackagist-plugin/simple-custom-post-order": "^2.5",
    "wpackagist-plugin/seo-by-rank-math": "^1.0",
    "wpackagist-plugin/contact-form-entries": "^1.2",
    "wpackagist-plugin/custom-block-patterns": "^1.4"
  },
  "extra": {
    "installer-paths": {
      "../../plugins/{$name}": ["type:wordpress-plugin"]
    }
  },
  "require-dev": {
    "php-stubs/acf-pro-stubs": "^6.0"
  },
  "config": {
    "allow-plugins": {
      "composer/installers": true
    }
  }
}
