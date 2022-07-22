---
to: assets/styles/common/_variables.scss
---
/** Necessary for the negative map function & font sizing */
@import "bootstrap/scss/functions";
@import "functions";

/** Colors */
<% theme_colors.filter(color => color !== '').forEach(color => { %><% const [colorName, colorHex] = color.split(': ') %>
$<%= h.changeCase.param(colorName) %>: <%= colorHex %>;<% }) %>

/*
// This comment block must be completed before `npm run start` can be performed; then you need to delete this line. Bai. :'(

$primary: ;
$secondary: ;
$dark: ;
$light: ;

$body-color: ;
$link-color: ;
$color-contrast-dark: $black;
$color-contrast-light: $white;

$info: ;
$success: ;
$warn: ;
$danger: ;

$theme-colors: (
  primary: $primary,
  secondary: $secondary,
  dark: $dark,
  light: $light,
  white: $white,
  black: $black,
  info: $info,
  success: $success,
  warn: $warn,
  danger: $danger,
);
*/

$utilities-border-colors: $theme-colors;
$utilities-text-colors: $theme-colors;
$utilities-bg-colors: $theme-colors;
$theme-colors-rgb: map-loop($theme-colors, to-rgb, "$value");

/** Fonts */
$enable-responsive-font-sizes: true;
$font-serif: Georgia, serif;
$font-sans: "Helvetica Neue", Arial, sans-serif;
$font-family-base: $font-sans;
/* $line-height-base: 1.5; */

$rem-base: 16px;
$font-size-base: 1rem;
$h1-font-size: rem(48);
$h2-font-size: rem(36);
$h3-font-size: rem(28);
$h4-font-size: rem(24);
$h5-font-size: rem(20);
$h6-font-size: $font-size-base;

$headings-font-family: $font-serif;
$headings-font-weight: 300;
/* $headings-line-height: 1.2; */
/* $headings-color: $primary; */
/* $headings-margin-bottom: .5rem; */

/*
$display-font-sizes: (
  1: 5rem
);
$display-font-weight: 800;
$display-line-height: $headings-line-height;
*/

/* $paragraph-margin-bottom: 1rem; */
$lead-font-size: rem(34);
$small-font-size: rem(14);
$input-btn-font-size: $font-size-base;

/** Grid */
$grid-gutter-width: 1rem;
$grid-breakpoints: (
  xs: 0,
  sm: 576px,
  md: 768px,
  lg: 992px,
  xl: 1144px,
);

/* Remove other breakpoints so its a smooth transition between sizes */
$container-max-width: rem(1240);
$container-max-widths: (
  sm: 1240px,
);

/** Spacing */
$enable-negative-margins: false;
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
$negative-spacers: negativify-map($spacers);
$gutters: $spacers;

/** Utility */
$overflows: auto, hidden, visible;

/** Bootstrap navbar fix (https://git.io/fADqW) */
$navbar-dark-toggler-icon-bg: none;
$navbar-light-toggler-icon-bg: none;

/** Accordions */
/*
$accordion-padding-y: 0;
$accordion-padding-x: 0;
$accordion-color: $body-color;
$accordion-bg: transparent;
$accordion-border-width: 0;
$accordion-border-radius: 0;
$accordion-inner-border-radius: 0;
$accordion-body-padding-y: 1rem;
$accordion-body-padding-x: 0;
$accordion-button-padding-y: 0;
$accordion-button-padding-x: 0;
$accordion-button-color: $primary;
$accordion-button-bg: $accordion-bg;
$accordion-transition: none;
$accordion-button-active-bg: transparent;
$accordion-button-active-color: $primary;
$accordion-icon-width: 1em;
$accordion-icon-color: $accordion-button-color;
$accordion-icon-active-color: $accordion-button-active-color;
$accordion-icon-transition: none;
$accordion-icon-transform: none;
$accordion-button-icon: none;
$accordion-button-active-icon: none;
*/

/** Buttons */
$btn-font-weight: 700;
$btn-border-width: rem(2);
$btn-box-shadow: none;
$btn-focus-width: 0;
$btn-focus-box-shadow: none;

$btn-border-radius: 0;
$btn-font-size: 1rem;
$btn-line-height: 1;
$btn-padding-y: rem(12);
$btn-padding-x: rem(24);

/*
$btn-border-radius-lg: 0;
$btn-font-size-lg: rem(18);
$btn-line-height-lg: 1;
$btn-padding-y-lg: 1rem;
$btn-padding-x-lg: rem(32);
*/

/*
$btn-border-radius-sm: 0;
$btn-font-size-sm: $small-font-size;
$btn-line-height-sm: 1;
$btn-padding-y-sm: rem(8);
$btn-padding-x-sm: 1rem;
*/

$btn-link-color: $link-color;

/** Cards */
/* $card-bg: $white;
$card-cap-bg: $card-bg;
$card-spacer-y: rem(20);
$card-spacer-x: rem(20);
$card-title-spacer-y: rem(8);
$card-border-radius: 0;
$card-inner-border-radius: 0;
$card-border-width: 0;
*/

/** Forms **/
/*
$input-border-radius: 0.75rem;
$input-font-size: 1rem;
$input-padding-y: 1.125rem;
$input-padding-x: 1.5rem;
$input-border-width: rem(1);
$input-border-color: $light;
$input-focus-border-color: $dark;
$input-focus-box-shadow: none;
*/