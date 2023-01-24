import { registerBlockType } from "@wordpress/blocks";
/**
 * Custom block styles
 */
wp.domReady(() => {
	// Remove default WP Column blocks to avoid confusion with our own blocks
	wp.blocks.unregisterBlockType("core/columns");
	wp.blocks.unregisterBlockType("core/column");

	// Typography
	[1, 2, 3, 4, 5, 6].forEach((n) => {
		wp.blocks.registerBlockStyle("core/heading", {
			name: `h${n}`,
			label: `H${n} Size`,
		});

		wp.blocks.registerBlockStyle("core/paragraph", {
			name: `h${n}`,
			label: `H${n} Size`,
		});
	});

	wp.blocks.registerBlockStyle("core/paragraph", [
		{
			name: "lead",
			label: "Lead",
		},
	]);

	wp.blocks.registerBlockStyle("core/paragraph", [
		{
			name: "small",
			label: "Small",
		},
	]);
});

(function (blocks, element) {
	var el = element.createElement;

	blocks.registerBlockType("gutenberg-examples/example-01-basic", {
		edit: function () {
			return el("p", {}, "Hello World (from the editor).");
		},
		save: function () {
			return el("p", {}, "Hola mundo (from the frontend).");
		},
	});
})(window.wp.blocks, window.wp.element);
