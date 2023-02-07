---
to: patterns/query-cards.php
---
<?php
/**
 * Title: Query Cards
 * Slug: <%= theme_name %>/query-cards
 * Categories: query, layout
 * Description: Display queried posts in a pre-styled layout
 * Keywords: query, cards, posts
 * Block Types: core/query, core/post-template, core/post-featured-image, core/post-terms, core/post-title, core/post-excerpt, core/columns, core/column, core/group
 */
?>
<!-- wp:query {"queryId":15,"query":{"perPage":"3","pages":0,"offset":0,"postType":"post","order":"asc","orderBy":"date","author":"","search":"","exclude":[],"sticky":"","inherit":false,"parents":[]},"displayLayout":{"type":"flex","columns":3},"className":"query-cards","layout":{"type":"default"}} -->
<div class="wp-block-query query-cards"><!-- wp:post-template -->
<!-- wp:post-featured-image {"isLink":true,"sizeSlug":"large","className":"mb-0"} /-->

<!-- wp:group {"style":{"spacing":{"blockGap":"var:preset|spacing|3","padding":{"top":"var:preset|spacing|4","right":"var:preset|spacing|4","bottom":"var:preset|spacing|4","left":"var:preset|spacing|4"}}},"className":"card-text","layout":{"type":"default"}} -->
<div class="wp-block-group card-text" style="padding-top:var(--wp--preset--spacing--4);padding-right:var(--wp--preset--spacing--4);padding-bottom:var(--wp--preset--spacing--4);padding-left:var(--wp--preset--spacing--4)"><!-- wp:group {"style":{"spacing":{"blockGap":"var:preset|spacing|2","padding":{"top":"0","right":"0","bottom":"0","left":"0"}}},"layout":{"type":"default"}} -->
<div class="wp-block-group" style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:0"><!-- wp:post-date {"format":"j F Y"} /-->

<!-- wp:post-terms {"term":"category"} /--></div>
<!-- /wp:group -->

<!-- wp:group {"style":{"spacing":{"padding":{"top":"0","right":"0","bottom":"0","left":"0"}}},"layout":{"type":"constrained"}} -->
<div class="wp-block-group" style="padding-top:0;padding-right:0;padding-bottom:0;padding-left:0"><!-- wp:post-title {"isLink":true,"className":"card-title w-100 h4"} /-->

<!-- wp:post-excerpt {"moreText":"Read More","className":"card-text"} /--></div>
<!-- /wp:group --></div>
<!-- /wp:group -->
<!-- /wp:post-template --></div>
<!-- /wp:query -->