<?php
/**
 * Update various breadcrumb trails
 * https://rankmath.com/kb/filters-hooks-api-developer/#change-remove-breadcrumb-items
 *
 * @param array       $crumbs The crumbs array.
 * @param Breadcrumbs $this   Current breadcrumb object.
 */

// RANKMATH SETTINGS - Home link is not shown

// Update the various breadcrumbs within the Resources section
add_filter('rank_math/frontend/breadcrumb/items', function( $crumbs, $class ) {

	// Get the Posts Page ID and we will use that to dynamically populate our CPTs that live within the Resource section
	$posts_page_id = get_option('page_for_posts');
	$parent_page_id = wp_get_post_parent_id($posts_page_id);
	$parent_page = get_post($parent_page_id);
	$parent_page_slug = "/".$parent_page->post_name;
	$parent_page_title = $parent_page->post_title;
	$news_title = get_field('page_title', 'news_items_settings') ? get_field('page_title', 'news_items_settings') : get_the_archive_title();
	$news_link = get_post_type_archive_link('news-item');

	if(is_search())
		return $crumbs;

	// Resource Section
	if(in_array(get_post_type(), ['post', 'news-item'])) {
		// Add the Posts Parent page to the start of the crumbs
		$resources_crumb[] = array(
			$parent_page_title,
			$parent_page_slug,
			'hide_in_schema' => true
		);
		array_splice( $crumbs, 0, 0, $resources_crumb );

		if(!is_home()){

			// Update main post archive
			if(get_post_type() === 'post' && is_archive()){
				if(is_category() || is_tax()){
					$current_cat_name = $crumbs[1][0];
					$crumbs[3][0] = "Category: " . $current_cat_name;
				}

				$posts_page_crumb[] = array(
					get_the_title($posts_page_id),
					get_permalink($posts_page_id),
					'hide_in_schema' => true
				);
				array_splice( $crumbs, 1, 1, $posts_page_crumb );
			}

			// Update custom post archives
			if(get_post_type() === 'news-item' && is_archive('news-item')){
				if(is_category() || is_tax()){
					$current_cat_name = $crumbs[2][0];
					$crumbs[2][0] = "Category: " . $current_cat_name;
				}

 				$news_archive_crumb[] = array(
					$news_title,
					$news_link,
					'hide_in_schema' => true
				);
				array_splice( $crumbs, 1, 1, $news_archive_crumb );
			}

			// Update singletons
			if(is_single() || is_singular()){
				$posts_single_crumb[] = array(
					get_the_title(get_option('page_for_posts')),
					get_permalink(get_option('page_for_posts')),
					'hide_in_schema' => true
				);
				array_splice( $crumbs, 1, 1, $posts_single_crumb );

				if(in_array(get_post_type(), ['news-item'])) {
						$news_single_crumb[] = array(
							get_archive_page_title('news-item'),
							get_post_type_archive_link('news-item'),
							'hide_in_schema' => true
						);
						array_splice( $crumbs, 1, 1, $news_single_crumb );
				}
			}
		}

		// Update array order
		$last = array_pop($crumbs);
		array_push($crumbs, $last);

		return $crumbs;
	}

	return $crumbs;
}, 10, 2);