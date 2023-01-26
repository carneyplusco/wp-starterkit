---
to: functions.php
---
<?php
/**
 * test-theme functions and definitions
 *
 * @link https://developer.wordpress.org/themes/basics/theme-functions/
 *
 * @package test-theme
 * @since 1.0.0
 */

define('LOCAL_DOMAIN', '<%= h.changeCase.param(theme_name) %>.local');

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
define('<%= h.changeCase.constant(theme_name) %>_VERSION', '1.0.0');
<% theme_colors.filter(color => color !== '').forEach(color => { %><% const [colorName, colorHex] = color.split(': ') %>
define('<%= h.changeCase.constant(`${theme_name} ${colorName}`) %>', '<%= colorHex %>');<% }) %>

/**
 * Add theme colors for Gutenberg
 */
add_theme_support('editor-color-palette', array(<% theme_colors.filter(color => color !== '').forEach(color => { %><% const [colorName, colorHex] = color.split(': ') %>
	array(
		'name' => '<%= h.changeCase.title(colorName) %>',
		'slug' => '<%= h.changeCase.snake(colorName) %>',
		'color' => <%= h.changeCase.constant(`${theme_name} ${colorName}`) %>
	),<% }) %>
));

/**
 * Asset path helper
 */
function asset_path($path) {
	$asset_path = get_stylesheet_directory_uri() . '/dist/assets';
  	return "$asset_path/$path";
}

/**
 * Inline SVG helper
 */

function inline_svg($path)
{
	return file_get_contents(asset_path($path), false);
}
/**
 * Setup theme
 */
add_action('init', function() {

	// this makes only the css from blocks on the page load, but it puts their css in the footer
	add_filter('should_load_separate_core_block_assets', '__return_true');

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

	if (!is_user_logged_in()) {
		wp_deregister_script('jquery');
		wp_register_script('jquery', false);
	}

	// create admin-level developer role
	$admin_capabilities = get_role('administrator')->capabilities;
	add_role('developer', 'Developer', $admin_capabilities);

	// hide ACF options for all users except developers
	add_filter('acf/settings/show_admin', function() {
		if (!is_user_logged_in()) {
			return false;
		}

		global $current_user;
    	$user_roles = $current_user->roles;

		return in_array('developer', $user_roles);
	});
});

/**
 * Enqueue additional block editor assets
 */
add_action('enqueue_block_editor_assets', '<%= h.changeCase.snake(theme_name) %>_custom_block_styles');
function <%= h.changeCase.snake(theme_name) %>_custom_block_styles($hook) {
	wp_enqueue_style('<%= h.changeCase.param(theme_name) %>-editor-css', asset_path('styles/editor.css'), array(), <%= h.changeCase.constant(theme_name) %>_VERSION, 'all');
	wp_enqueue_script('<%= h.changeCase.param(theme_name) %>-editor-js', asset_path('scripts/editor.js'), array('wp-blocks', 'wp-dom'), <%= h.changeCase.constant(theme_name) %>_VERSION, true);
}

/**
 * Enqueue styles
 */
add_action('wp_enqueue_scripts', '<%= h.changeCase.snake(theme_name) %>_enqueue_assets', 15);
function <%= h.changeCase.snake(theme_name) %>_enqueue_assets() {
	wp_enqueue_style('<%= h.changeCase.param(theme_name) %>-css', asset_path('styles/main.css'), array(), <%= h.changeCase.constant(theme_name) %>_VERSION, 'all');
  	wp_enqueue_script('<%= h.changeCase.param(theme_name) %>-js', asset_path('scripts/main.js'), array(), <%= h.changeCase.constant(theme_name) %>_VERSION , true );
}

/**
 * Register navigation menus
 */
register_nav_menus([
  'primary_navigation' => __('Primary Navigation', '<%= h.changeCase.param(theme_name) %>'),
  'footer_navigation' => __('Footer Navigation', '<%= h.changeCase.param(theme_name) %>')
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

function contains($str, array $arr)
{
    foreach($arr as $a) {
        if (stripos($str,$a) !== false) return true;
    }
    return false;
}

function get_block_styles($block) {
	// we only use color so make sure the block it available
	if (empty($block['style']) || empty($block['style']['color'])) {
		return '';
	}

	$format_arr = ['hsl', '#', 'rgb'];

	$background_color = !empty($block['style']['color']['background']) ? $block['style']['color']['background'] : '';
	// if there is a gradient style selected, add it as the background color instead of the 
	$has_gradient = !empty($block['style']['color']['gradient']);
	$background_color = $has_gradient ? $block['style']['color']['gradient'] : $background_color;
	$text_color = !empty($block['style']['color']['text']) ? $block['style']['color']['text'] : '';

	// if the background or text color are named values instead of hsl, rgb or hex, we don't want to return a style and overwrite class colors, etc.
	$background_color = contains($background_color, $format_arr) ? $background_color : '';

	$text_color = contains($text_color, $format_arr) ? $text_color : '';
	$background_style = '';
	$text_style = '';

	if ($background_color != '') {
		$background_style = 'background: ' . $background_color . ';';
	}

	if ($text_color != '') {
		$text_style = 'color: ' . $text_color . ';';
	}

	return $text_style . ' ' . $background_style;
}