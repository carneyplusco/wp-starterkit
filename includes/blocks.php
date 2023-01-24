<?php
// Custom ACF Blocks
add_action('acf/init', function () {
	die(var_dump('should fucking die'));
  if (function_exists('acf_register_block_type')):
	die(var_dump('fuck'));


	
	
  endif;
});