/**
 * Custom block styles
 */
wp.domReady(() => {
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
