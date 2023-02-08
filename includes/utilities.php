<?php


/**
 * Checks if a string contains any one string from an array of strings.
 * Returns true if any of the elements in the array exist in the string.
 * @param string $str
 * @param Array<string> $arr;
 * @return bool
 */
function arr_in_string($str, array $arr)
{
	foreach ($arr as $a) {
		if (stripos($str, $a) !== false) return true;
	}
	return false;
}

/**
 * Given a block, returns a string with text and background inline styles.
 * Returns an empty string if the block has no applicable styles.
 * @param WPBlock $block
 * @return string
 */
function get_block_styles($block)
{
	// we only use color so make sure the block it available
	if (empty($block['style']) || empty($block['style']['color'])) {
		return '';
	}

	// array used to test if color is a named or programmatic color
	$format_arr = ['hsl', '#', 'rgb'];
	$background_color = !empty($block['style']['color']['background']) ? $block['style']['color']['background'] : '';
	// if there is a gradient style selected, add it as the background color instead of the 
	$has_gradient = !empty($block['style']['color']['gradient']);
	$background_color = $has_gradient ? $block['style']['color']['gradient'] : $background_color;
	$text_color = !empty($block['style']['color']['text']) ? $block['style']['color']['text'] : '';

	// if the background or text color are named values instead of hsl, rgb or hex, we don't want to return a style and overwrite class colors, etc.
	$background_color = arr_in_string($background_color, $format_arr) ? $background_color : '';
	$text_color = arr_in_string($text_color, $format_arr) ? $text_color : '';

	$styles = array();

	if ($background_color != '') {
		array_push($styles, 'background: ' . $background_color . ';');
	}

	if ($text_color != '') {
		array_push($styles, 'color: ' . $text_color . ';');
	}

	return implode(" ", $styles);
}

/**
 * Asset path helper
 */
function asset_path($path)
{
	// structure of dist directory changes based on whether or not ./blocks is empty before build, so test here
	if (is_dir(get_template_directory() . '/dist/blocks')) {
		$asset_path = get_stylesheet_directory_uri() . '/dist/assets';
	} else {
		$asset_path = get_stylesheet_directory_uri() . '/dist';
	}

	return "$asset_path/$path";
}

/**
 * Inline SVG helper
 */

function inline_svg($path)
{
	return file_get_contents(asset_path($path), false);
}