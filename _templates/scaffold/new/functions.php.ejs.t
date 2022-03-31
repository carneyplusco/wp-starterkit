---
to: functions.php
---
<?php
/**
 * <%= theme_name %> functions and definitions
 *
 * @link https://developer.wordpress.org/themes/basics/theme-functions/
 *
 * @package <%= theme_name %>
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
	global $manifest;

	$is_local = is_local();
	if (!$is_local):
    if (empty($manifest)):
			$manifest_path = dirname(__FILE__) . '/dist/manifest.json';
			$manifest = file_exists($manifest_path) ? json_decode(file_get_contents($manifest_path), true) : [];
    endif;
    $filename = pathinfo($path)['basename'];
    $path = $manifest[$filename] ?? $path;
	endif;

	$asset_path = $is_local ? 'http://localhost:9000/assets' : get_stylesheet_directory_uri();
	return "$asset_path/$path";
}

/**
 * Inline SVG helper
 */

function is_local() {
  $is_dev = in_array(wp_get_environment_type(), ['local', 'development']);
  return $is_dev && $_SERVER['HTTP_HOST'] == LOCAL_DOMAIN;
}

function inline_svg($path) {
  $is_local = is_local();
  $asset_path = asset_path($path);
  $svg_path = $is_local ? str_replace('http://localhost:9000', dirname(__FILE__), $asset_path) : $asset_path;
  $stream_context = $is_local ? stream_context_create([
    'ssl' => [
      'verify_peer'=> false,
      'verify_peer_name'=> false,
    ]
  ]) : null;
  return file_get_contents($svg_path, false, $stream_context);
}

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
  add_editor_style(asset_path("styles/editor.css"));
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
  wp_enqueue_script('<%= h.changeCase.param(theme_name) %>-js', asset_path('scripts/main.js'), array('jquery'), <%= h.changeCase.constant(theme_name) %>_VERSION , true );
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