  </main>

  <?php if (!get_field('hide_footer')): ?>
  <footer class="bottom">
  	<div class="has-global-padding is-layout-constrained">
  		<?php wp_nav_menu([
        'theme_location' => 'footer_navigation',
        'menu_class' => 'list-unstyled',
      ]); ?>
  	</div>
  </footer>
  <?php endif; ?>

  <?php wp_footer() ?>

  </body>

  </html>