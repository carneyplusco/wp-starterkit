<?php

// determine if a string contains any string from an array
function str_contains($str, array $arr)
{
    foreach($arr as $a) {
        if (stripos($str,$a) !== false) return true;
    }
    return false;
}

// determines if a block requires inline styles for font color, background-color or background gradient
// returns either an empty string or a string containing inline styles for 'color' and 'background'
// returned string does not contain "style" attribute so it can be modified or appended later
function get_block_styles($block) {
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
	$background_color = str_contains($background_color, $format_arr) ? $background_color : '';

	$text_color = str_contains($text_color, $format_arr) ? $text_color : '';
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