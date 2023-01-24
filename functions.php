<?php
/**
 * test-theme functions and definitions
 *
 * @link https://developer.wordpress.org/themes/basics/theme-functions/
 *
 * @package test-theme
 * @since 1.0.0
 */

define('LOCAL_DOMAIN', 'test-theme.local');

/**
 * Includes
 */
array_map(function ($file) {
	$filepath = "/includes/{$file}.php";
  require_once(get_stylesheet_directory() . $filepath);
}, ['blocks', 'post-types', 'taxonomies']);

/**
 * Define Constants
 */
define('TEST_THEME_VERSION', '1.0.0');


/**
 * Add theme colors for Gutenberg
 */
add_theme_support('editor-color-palette', array(
));

/**
 * Asset path helper
 */
function asset_path($path) {
	$asset_path = get_stylesheet_directory_uri() . '/dist';
  	return "$asset_path/$path";
}

/**
 * Inline SVG helper
 */

// function is_local() {
//   $is_dev = in_array(wp_get_environment_type(), ['local', 'development']);
//   return $is_dev && $_SERVER['HTTP_HOST'] == LOCAL_DOMAIN;
// }

// function inline_svg($path) {
//   $is_local = is_local();
//   $asset_path = asset_path($path);
//   $svg_path = $is_local ? str_replace('http://localhost:9000', dirname(__FILE__), $asset_path) : $asset_path;
//   $stream_context = $is_local ? stream_context_create([
//     'ssl' => [
//       'verify_peer'=> false,
//       'verify_peer_name'=> false,
//     ]
//   ]) : null;
//   return file_get_contents($svg_path, false, $stream_context);
// }

/**
 * Setup theme
 */
add_action('init', function() {
	add_post_type_support('page', 'excerpt');

  /**
   * Enable plugins to manage the document title
   * @link https://developer.wordpress.org/reference/functions/add_theme_support/#title-tag
   */
  add_theme_support('title-tag');

  /**
   * Enable post thumbnails
   * @link https://developer.wordpress.org/themes/functionality/featured-images-post-thumbnails/
   */
  add_theme_support('post-thumbnails');

  /**
   * Enable HTML5 markup support
   * @link https://developer.wordpress.org/reference/functions/add_theme_support/#html5
   */
  add_theme_support('html5', ['caption', 'comment-form', 'comment-list', 'gallery', 'search-form']);

  /**
   * Block editor features
   */
  add_theme_support("align-wide");
  add_theme_support("disable-custom-font-sizes");
  remove_theme_support("core-block-patterns");

  add_theme_support("editor-styles");
//   add_editor_style(asset_path("styles/main.css"));

	var_dump(__DIR__ . '/templates/blocks/test-block/block.json');
  $test = register_block_type( __DIR__ . '/templates/blocks/test-block/block.json' );
	var_dump($test);
});

/**
 * Enqueue additional block editor assets
 */
add_action('enqueue_block_editor_assets', 'test_theme_custom_block_styles');
function test_theme_custom_block_styles($hook) {
	wp_enqueue_style('test-theme-editor-css', asset_path('styles/editor.css'), array(), TEST_THEME_VERSION, 'all');
	wp_enqueue_script('test-theme-editor-js', asset_path('scripts/editor.js'), array('wp-blocks', 'wp-dom'), TEST_THEME_VERSION, true);
}

/**
 * Enqueue styles
 */
add_action('wp_enqueue_scripts', 'test_theme_enqueue_assets', 15);
function test_theme_enqueue_assets() {
	wp_enqueue_style('test-theme-css', asset_path('styles/main.css'), array(), TEST_THEME_VERSION, 'all');
  wp_enqueue_script('test-theme-js', asset_path('scripts/main.js'), array('jquery'), TEST_THEME_VERSION , true );
}

/**
 * Register navigation menus
 */
register_nav_menus([
  'primary_navigation' => __('Primary Navigation', 'test-theme'),
  'footer_navigation' => __('Footer Navigation', 'test-theme')
]);

/**
 * Adds Reusable Blocks to ACF post types
 */
add_filter('acf/get_post_types', function ($post_types) {
  if (!in_array('wp_block', $post_types)):
    $post_types[] = 'wp_block';
	endif;
  return $post_types;
});


/**
 * Create a Custom Category (custom-blocks) and reorder all categories so it is at the top
 * https://developer.wordpress.org/block-editor/reference-guides/filters/block-filters/#managing-block-categories
 * https://wordpress.org/support/topic/reorder-editor-inserter-blocks/
 */
function custom_block_category($categories, $editor_context) {
	// Make sure a post is provided
	if (!empty($editor_context->post)) {

		// Create new category, Custom
		$custom_category = [
			'slug' => 'custom-blocks',
			'title' => __('Custom Blocks', 'custom-layout' ),
		];

		// Move the Custom category to the top
		$reordered_categories = [];
		$reordered_categories[0] = $custom_category;

		// Rebuild cats array
		foreach($categories as $category) {
			$reordered_categories[] = $category;
		}

		return $reordered_categories;
	}
}
add_filter('block_categories_all', 'custom_block_category', 10, 2);