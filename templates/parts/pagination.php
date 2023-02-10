<?php
  $args_defaults = array(
    'aria_label' => 'Results',
    'heading' => 'Results navigation'
  );
  $args = wp_parse_args($args, $args_defaults);
  $current_page = $paged ?: 1;
  $total_pages = $wp_query->max_num_pages;
?>

<?php if ($total_pages > 1): ?>

  <nav class="wp-block-query-pagination" role="navigation" aria-label="<?= $args['aria_label'] ?>">

    <?php if ($paged > 1): ?>
      <a href="<?php previous_posts() ?>" class="wp-block-query-pagination-previous">
        <span class="wp-block-query-pagination-previous-arrow">&xlarr;</span>
      </a>
    <?php endif; ?>


    <div class="wp-block-query-pagination-numbers">
      <?php
        echo paginate_links( array(
          'prev_next' => false,
          'mid_size'  => 2,
          'end_size'  => 1,
          'format' => '?paged=%#%',
          'current' => $current_page,
          'total' => $total_pages,
        ));
      ?>
    </div>
    <?php if ($paged != $total_pages): ?>
      <a href="<?php next_posts() ?>" class="wp-block-query-pagination-next">
        <span class="wp-block-query-pagination-next-arrow">&xrarr;</span>
      </a>
    <?php endif; ?>

  </nav>
<?php endif ?>