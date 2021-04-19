<!DOCTYPE html>
<html lang="en">
<head>
  <meta charset="UTF-8">
  <meta name="viewport" content="width=device-width, initial-scale=1">
  <meta name="apple-mobile-web-app-status-bar-style" content="default">
  <?php wp_head() ?>
</head>

<body <?php body_class(); ?>>
  <?php wp_body_open() ?>

  <header class="top">
    <nav>
      <?php
        wp_nav_menu([
          'theme_location'  => 'primary_navigation',
          'menu_class'      => 'list-unstyled'
        ]);
      ?>
    </nav>
  </header>

  <main role="main">
