---
to: assets/styles/common/_variables.scss
---
/** Fonts */
$font-serif: "Georgia", serif;
$font-sans: "Helvetica Neue", Arial, sans-serif;
$enable-responsive-font-sizes: true;

$font-family-base: $font-sans;
$headings-font-family: $font-serif;
$headings-font-weight: 300;

$rem-base: 16px;
$font-size-base: 1rem;
$h1-font-size: $font-size-base * 3; // 48px
$h2-font-size: $font-size-base * 2.25; // 36px
$h3-font-size: $font-size-base * 1.75; // 28px
$h4-font-size: $font-size-base * 1.5; // 24px
$h5-font-size: $font-size-base * 1.25; // 20px
$h6-font-size: $font-size-base; // 16px
$lead-font-size: $font-size-base * 1.5; // 24px

/** Colors */
<% theme_colors.filter(color => color !== '').forEach(color => { %><% const [colorName, colorHex] = color.split(': ') %>
$<%= h.changeCase.param(colorName) %>: <%= colorHex %>;<% }) %>

/*
$theme-colors: (
  white: ,
  light: ,
  dark: ,
  black: ,
  primary: ,
  secondary: ,
  warn: ,
  info: ,
);
*/

/** Grid */
$grid-gutter-width: 1rem;
$grid-breakpoints: (
  xs: 0,
  sm: 576px,
  md: 768px,
  lg: 992px,
  xl: 1144px,
);

/** Spacing */
$spacer: 1rem;
$spacers: (
  0: 0,
  1: $spacer * 0.25,
  2: $spacer * 0.5,
  3: $spacer,
  4: $spacer * 1.5,
  5: $spacer * 2,
  6: $spacer * 2.5,
  sm: $spacer * 4,
  md: $spacer * 6,
  lg: $spacer * 8,
  xl: $spacer * 10,
);

# $negative-spacers: negativify-map($spacers);

/** Utility */
$overflows: auto, hidden, visible;

/** Hamburgers */

/** Bootstrap navbar fix (https://git.io/fADqW) */
$navbar-dark-toggler-icon-bg: none;
$navbar-light-toggler-icon-bg: none;

/** Buttons */
/*
$btn-border-radius: 0.353rem; // 6px
$btn-font-size: 1.125rem; // 18px
$btn-font-weight: 600;
$btn-line-height: 1;
$btn-padding-y: 0.875rem; // 14px
$btn-padding-x: 1.25rem; // 20px
$btn-padding-y-sm: .75rem; // 12px
$btn-padding-x-sm: 1rem;
$btn-font-size-sm: 1rem;
$btn-line-height-sm: 1;
$btn-border-radius-sm: 0;
*/