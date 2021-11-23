/**
 * Custom block styles
 */
wp.domReady(() => {
  // Remove default WP Column blocks to avoid confusion with our own blocks
  wp.blocks.unregisterBlockType("core/columns");
  wp.blocks.unregisterBlockType("core/column");
});
