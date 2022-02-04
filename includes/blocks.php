<?php

// Remove default Block Editor patterns, custom font sizing
remove_theme_support("core-block-patterns");
add_theme_support("disable-custom-font-sizes");

// Custom ACF Blocks
add_action('acf/init', function () {
  if (function_exists('acf_register_block_type')):
  endif;
});
