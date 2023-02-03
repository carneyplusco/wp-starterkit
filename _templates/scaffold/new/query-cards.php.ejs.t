---
to: includes/patterns/query-cards.php
---
<?php
/**
 * Title: Query Cards
 * Slug: <%= title %>/query-cards
 * Categories: query, layout
 * Description: Display queried posts in a pre-styled layout
 * Keywords: query, cards, posts
 * Block Types: core/query, core/post-template, core/post-featured-image, core/post-terms, core/post-title, core/post-excerpt, core/columns, core/column
 */
?>
<!-- wp:query {"queryId":15,"query":{"perPage":"3","pages":0,"offset":0,"postType":"post","order":"desc","orderBy":"date","author":"","search":"","exclude":[],"sticky":"exclude","inherit":false},"displayLayout":{"type":"flex","columns":3},"className":"query-cards","layout":{"type":"default"}} -->
<div class="wp-block-query query-cards"><!-- wp:post-template -->
<!-- wp:post-featured-image {"isLink":true,"sizeSlug":"large","className":"mb-0"} /-->

<!-- wp:group {"className":"card-body h-100","layout":{"type":"constrained"}} -->
<div class="wp-block-group card-body h-100"><!-- wp:post-terms {"term":"category","className":"mb-4"} /-->

<!-- wp:post-date {"format":"j F Y","className":"mb-2"} /-->

<!-- wp:post-title {"isLink":true,"className":"card-title w-100 h6 lh-sm mb-2"} /-->

<!-- wp:post-excerpt {"moreText":"Read More","className":"card-text"} /--></div>
<!-- /wp:group -->
<!-- /wp:post-template --></div>
<!-- /wp:query -->