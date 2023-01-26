---
to: blocks/<%= title.toLowerCase().replace(' ', '-') %>/<%= title.toLowerCase().replace(' ', '-') %>.php
---
<?php

extract(wp_parse_args($args, [
	"post" => $post,
	"block" => null,
	"is_preview" => null,
	"class_name" => null,
	"style" => ''
]));

$class = implode(" ", array_filter([
	"<%= title.toLowerCase().replace(' ', '-') %>",
	$class_name
]));

$atts = array_filter(["class" => $class, "id" => $id, "style" => $style]);
$att_string = implode(" ", array_map(function ($key, $value) {
	return "$key='$value'";
}, array_keys($atts), $atts));

?>
<div <?= $att_string; ?> > 
	<h1><%= title %></h1>
</div>
