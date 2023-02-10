<?php

/**
 * Default Singleton Template
 */

get_header();

if($post_type === 'news-item') {
  $cat_taxonomy = 'news-item-tax';
} else {
  $cat_taxonomy = 'category';
}

while (have_posts()) :
  the_post();
?>

<div class="has-global-padding is-layout-constrained">
	<section>
		<aside class="my-6">
			<?php if (function_exists('rank_math_the_breadcrumbs')) rank_math_the_breadcrumbs(); ?>
		</aside>

		<article <?php post_class() ?>>
			<div class="container pb-4 pb-md-md">
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
						<div class="mt-6 mb-4">
							<?php get_template_part("templates/parts/categories", null, ['taxonomy' => $cat_taxonomy]); ?>
						</div>
						<?php endif; ?>

						<div class="modified-typography">
							<h1 class="post-title"><?php the_title(); ?></h1>
							<div class="modified-typography__content mt-5">
								<?php the_content(); ?>
								<aside class="mt-4">
									<p class="mb-0 text-gray-400"><small><em>Published:
												<time datetime="<?= get_the_date('c'); ?>"><?php echo esc_html( get_the_date('F, d Y') ); ?></time></em></small></p>
								</aside>
							</div>
						</div>
					</div>
				</div>
			</div>
		</article>
	</section>
</div>
<?php endwhile; get_footer(); ?>