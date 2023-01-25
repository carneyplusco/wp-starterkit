<?php
// Custom ACF Blocks
add_action('acf/init', function () {
	// auto register all custom blocks 
	foreach ( glob( get_stylesheet_directory() . "/blocks/*/block.json" ) as $file ) {
		$block_name = basename(dirname($file));
		register_block_type( get_template_directory() . '/blocks/' . $block_name . '/block.json' );
		wp_register_script( $block_name, get_template_directory_uri() . '/dist/blocks/' . $block_name . '/' . $block_name . '.js', [ 'acf' ] );
		wp_register_style( $block_name, get_template_directory_uri() . '/dist/blocks/' . $block_name . '/' . $block_name . '.css');
	}
});