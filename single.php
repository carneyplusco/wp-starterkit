<?php

/**
 * Default Singleton Template
 */

get_header();

$is_post = in_array(get_post_type(), ['post', 'news-item']);

if($post_type === 'news-item') {
  $cat_taxonomy = 'news-item-tax';
} else {
  $cat_taxonomy = 'category';
}

if ($is_post) {
	$related_posts = get_posts( array(
		'numberposts' => 3,
		'orderby' => 'date',
		'post_type' => $post_type,
		'category' => wp_get_post_categories( get_the_ID() ),
		'post_status' => 'publish',
		'exclude' => get_the_ID(),
 ) );
}

while (have_posts()) :
  the_post();
?>

<section class="has-global-padding is-layout-constrained">
	<nav class="my-6">
		<?php if (function_exists('rank_math_the_breadcrumbs')) rank_math_the_breadcrumbs(); ?>
	</nav>

	<article <?php post_class() ?>>
		<div class="pb-4 pb-md-md">
			<div class="row">
				<div class="col-lg-9">
					<?php if (has_post_thumbnail()) : ?>
					<div class="mb-5">
						<figure class="ratio ratio-16x9">
							<?php the_post_thumbnail('large', ['style' => 'object-fit: cover;']); ?>
						</figure>
					</div>
					<?php endif; ?>

					<?php if(!empty(get_the_terms($post->ID, $cat_taxonomy))): ?>
					<div class="mb-4">
						<?php get_template_part("templates/parts/categories", null, ['taxonomy' => $cat_taxonomy]); ?>
					</div>
					<?php endif; ?>

					<div class="modified-typography">
						<h1 class="post-title text-primary"><?php the_title(); ?></h1>

						<div class="modified-typography__content">
							<?php the_content(); ?>
							<aside class="mt-6">
								<p class="mb-0 text-gray-400"><small><em>Published:
											<time datetime="<?= get_the_date('c'); ?>"><?php echo esc_html( get_the_date('F d, Y') ); ?></time></em></small></p>
							</aside>
						</div>
					</div>
				</div>
			</div>
		</div>
	</article>

	<?php if ($is_post && !empty($related_posts)): ?>
	<aside class="is-layout-flow wp-block-group alignfull bg-gray-200 py-4">
		<div class="has-global-padding is-layout-constrained wp-block-group">
			<h2 class="h3 mb-4 text-primary">Related Posts</h2>
			<div class="is-layout-flow wp-block-query">
				<ul class="is-layout-flow is-flex-container columns-3 wp-block-post-template">
					<?php foreach ($related_posts as $related): ?>
					<li class="wp-block-post">
						<?php get_template_part('templates/parts/wp-block-post', null, ['post' => $related, 'button_text' => 'Read More', 'show_cats' => true]); ?>
					</li>
					<?php endforeach; ?>
				</ul>
			</div>
		</div>
	</aside>
	<?php endif; ?>
</section>
<?php endwhile; get_footer(); ?>