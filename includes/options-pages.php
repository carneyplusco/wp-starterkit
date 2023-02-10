<?php

// Custom Options Pages

add_action('init', function () {
  if (function_exists('acf_add_options_page')) {
    // Default Theme Settings
    acf_add_options_page(array(
      'page_title'   => 'Theme General Settings',
      'menu_title'  => 'Theme Settings',
      'menu_slug'   => 'theme-general-settings',
      'capability'  => 'edit_posts',
      'redirect'    => false
    ));

    // News Archive Settings - Example
    acf_add_options_sub_page(array(
      'page_title' 	=> __('News Items Archive Settings'),
      'menu_title'	=> __('News Archive'),
      'parent_slug'	=> 'edit.php?post_type=news-item',
      'post_id'   => 'news_items_settings'
	  ));
  };
});