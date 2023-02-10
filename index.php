<?php
	/**
	 * Default Blog & CPT Archive template
	*/

  // Update the archive's meta title
  add_filter( 'rank_math/frontend/title', function( $title ) {
		$post_type = get_post_type();
		$new_title = get_archive_page_title();
		$suffix = substr($title, (strrpos($title, ' |') ?: -1) +1);
		return $new_title . ' ' . $suffix;
	});

	get_header();

  // Get information about the page query which we will leverage later for various conditions
	$q_obj = get_queried_object();
	$post_type = get_post_type();
  $page_title = get_archive_page_title();

  // First we want to check for any non-default CPTs and update our settings as needed
  // By default, the "news-item" CPT will not exist in our WPSK-built theme by default
  // It's been added here for placeholder purposes for future building
  if($post_type === 'news-item') {
    // Set up the custom taxonomy for filtering (if applicable)
		$cat_taxonomy = 'news-item-tax';
    // Get the archive link based on the taxonomy name
		$all_link = get_post_type_archive_link('news-item');
    // Get the page intro from the CPT's ACF Archive Options page
    // This option page will need to be set up
		$page_intro = get_field('page_intro', 'news_items_settings');
	} else {
    // Set the default taxonomy
		$cat_taxonomy = 'category';
		$posts_page_id = get_option('page_for_posts');
		$all_link = get_permalink($posts_page_id);
    // We use the page's excerpt for the intro on the default Archive.
	}

	if(is_category() || is_tax()){
		$page_intro = category_description();
	}
?>

<div class="has-global-padding is-layout-constrained">
	<section>
		<aside class="my-6">
			<?php if (function_exists('rank_math_the_breadcrumbs')) rank_math_the_breadcrumbs(); ?>
		</aside>

		<div class="row">
			<div class="col-12 col-md-8">
				<h1 class="mb-0"><?= $page_title ?></h1>
			</div>
		</div>

		<div class="row">
			<div class="col-12 col-md-7 col-lg-6">
				<?php if (!empty($page_intro)): ?>
				<div class="adjust-wysiwyg mt-3 mb-0"><?= $page_intro ?></div>
				<?php elseif(!empty($q_obj->post_excerpt)): ?>
				<p class="mt-3 mb-0"><?= $q_obj->post_excerpt ?></p>
				<?php endif; ?>
			</div>
		</div>

		<?php if(get_terms($cat_taxonomy)): ?>
		<div class="row">
			<div class="col-12">
				<div class="d-flex flex-row align-items-center flex-wrap gap-2 mt-6">
					<div class="flex-shrink-0">
						<label for="cat_select" class="text-gray-300 small mb-0 me-2">Filter by</label>
					</div>
					<div>
						<div class="d-inline-flex flex-row flex-wrap gap-2">
							<a href="<?= esc_url($all_link); ?>" class="<?= !is_category() && !is_tax() ? 'fw-bold' : '' ?>">All</a>

							<?php
                  $cats = get_terms($cat_taxonomy);
                  if(is_category() || is_tax()){
                    $current = $q_obj->slug;
                  }

                  foreach($cats as $cat){
                    $is_selected = '';
                    if($current === $cat->slug) {
                      $is_selected = ' fw-bold';
                    }
                    echo '<a href="' . esc_attr( get_category_link( $cat->term_id ) ) . '" class="'.$is_selected.'">' . __( $cat->name ) . '</a>';
                  }
                ?>
						</div>
					</div>
				</div>
			</div>
		</div>

		<?php endif; ?>
	</section>

	<section class="mb-md mb-lg-lg">
		<div class="has-global-padding is-layout-constrained wp-block-group" style="padding-top:var(--wp--preset--spacing--4);padding-bottom:var(--wp--preset--spacing--4)">
			<?php if (have_posts()): ?>
			<div class="is-layout-flow wp-block-query">
				<ul class="is-layout-flow is-flex-container columns-3 wp-block-post-template">
					<?php while (have_posts()) : the_post(); ?>
					<li class="wp-block-post">
						<?php get_template_part('templates/parts/wp-block-post', null, ['post' => $post, 'button_text' => 'Read More', 'show_cats' => true]); ?>
					</li>
					<?php endwhile; wp_reset_postdata(); ?>
				</ul>
			</div>

			<?php if (is_paginated()) : ?>
			<div class="row">
				<div class="col-12 mt-3">
					<?php get_template_part('templates/parts/wp-block-query-pagination'); ?>
				</div>
			</div>
			<?php endif; ?>
			<?php else: ?>
			<div class="min-h-50vh">
				<?php get_template_part('templates/content', 'none'); ?>
			</div>
			<?php endif; ?>
		</div>
	</section>
</div>
<?php get_footer(); ?>