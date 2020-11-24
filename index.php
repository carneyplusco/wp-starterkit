<?php get_header() ?>

<div class="container">
  <?php if (have_posts()): ?>
    <?php while (have_posts()): the_post(); ?>
      <article>
        <header>
          <h2><?php the_title() ?></h2>
        </header>
        <?php the_excerpt(); ?>
      </article>
    <?php endwhile; ?>
  <?php endif; ?>
</div>

<?php get_footer() ?>
