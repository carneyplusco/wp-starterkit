  </main>

  <footer class="bottom">
  	<div class="has-global-padding is-layout-constrained">
  		<?php
        wp_nav_menu([
          'theme_location'  => 'footer_navigation',
          'menu_class'      => 'list-unstyled'
        ]);
      ?>
  	</div>
  </footer>

  <?php wp_footer() ?>

  </body>

  </html>