<?php

// Remove default Block Editor patterns
remove_theme_support("core-block-patterns");

// Custom ACF Blocks
add_action('acf/init', function () {
  if (function_exists('acf_register_block_type')):
  endif;
});
