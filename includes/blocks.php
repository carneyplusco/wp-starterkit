<?php

// function carney_register_block_type($settings)
// {
//   $needs_callback = empty($settings['render_template']) && empty($settings['render_callback']);

//   if ($needs_callback) :
//     $settings['render_callback'] = "carney_render_block";
//   endif;
//   acf_register_block_type($settings);
// }

function carney_block($block_name, $args = [])
{
  	$template_path = "blocks/$block_name/$block_name.php";
  	if (empty(locate_template($template_path, true, false, $args)) && current_user_can('edit_post', $args['post_id'])) :
    	echo "<p>Unable to locate template at: <code>$template_path</code></p>";
  	endif;
}

function carney_render_block($block, $content = '', $is_preview = false, $post_id = 0)
{
  	$block_name = str_replace("acf/", "", $block["name"]);
  	$fields = get_fields() ?: [];
  	$is_jsx = !empty($block["supports"]["jsx"]);
  	$class_name = !empty($block['className']) ? $block['className'] : '';
  	$InnerBlocks = !empty($block["InnerBlocks"]) ? $block["InnerBlocks"] : "<InnerBlocks />";
	$block_id = !empty($block["anchor"]) ? $block["anchor"] : ($block["id"] ?: '');
	$text_color_class = !empty($block['textColor']) ? 'has-' . $block['textColor'] . '-color' : '';
	$background_color_class = !empty($block['backgroundColor']) ? 'has-' . $block['backgroundColor'] . '-background-color' : '';
	$background_color_class = !empty($block['gradient']) ? 'has-' . $block['gradient'] . '-gradient-background' : $background_color_class;
	$style = get_block_styles($block);

  	$args = array_filter(array_merge([
    	"block" => $block,
    	"class_name" => $class_name . ' ' . $text_color_class . ' ' . $background_color_class,
    	"content" => $is_jsx && $is_preview ? $InnerBlocks : $content,
    	"id" => $block_id,
    	"is_preview" => $is_preview,
    	"post_id" => $post_id,
		"style" => $style
  	], $fields), function ($value) {
    	return $value !== null && $value !== '';
  	});

  	carney_block($block_name, $args);
};

// Custom ACF Blocks
add_action('acf/init', function () {
	// auto register all custom blocks 
	foreach ( glob( get_stylesheet_directory() . "/blocks/*/block.json" ) as $file ) {
		$block_name = basename(dirname($file));
		register_block_type( get_template_directory() . '/blocks/' . $block_name . '/block.json', array( 'render_callback' => 'carney_render_block') );
		wp_register_script( $block_name, get_template_directory_uri() . '/dist/blocks/' . $block_name . '/' . $block_name . '.js', [ 'acf' ] );
		wp_register_style( $block_name, get_template_directory_uri() . '/dist/blocks/' . $block_name . '/' . $block_name . '.css');
	}
});