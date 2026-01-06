# XStore Theme Options Reference

Complete reference for all XStore theme customizer options. Options are stored in `wp_options` table under `theme_mods_xstore-child` (or `theme_mods_xstore` for parent theme).

## How to Set Options

### Via WP-CLI

```bash
# Set single option
wp option patch update theme_mods_xstore-child activecol '#ff7eb9'

# Set nested option (e.g., typography)
wp option patch update theme_mods_xstore-child sfont --format=json '{"font-family":"Manrope","font-size":"17px"}'

# Export current options
wp option get theme_mods_xstore-child --format=json > theme-backup.json

# Import options
wp option update theme_mods_xstore-child --format=json < theme-config.json
```

### Via PHP/SQL

```php
// Get current mods
$mods = get_theme_mod('activecol');

// Set single mod
set_theme_mod('activecol', '#ff7eb9');

// Set multiple mods
$mods = get_option('theme_mods_xstore-child');
$mods['activecol'] = '#ff7eb9';
$mods['site_width'] = 1400;
update_option('theme_mods_xstore-child', $mods);
```

---

## 1. GENERAL / LAYOUT

Source: `framework/customizer/theme-options/general/layout.php`

| Option | Type | Default | Values/Range | Description |
|--------|------|---------|--------------|-------------|
| `main_layout` | select | `wide` | `wide`, `boxed`, `framed`, `bordered` | Site layout type |
| `site_width` | slider | `1170` | 970-3000 (px) | Content container width |
| `mobile_header_start_from` | slider | `992` | 320-1440 (px) | Mobile header breakpoint |
| `mobile_optimization` | toggle | `0` | 0/1 | Disable unused HTML/CSS/JS for mobile |
| `mobile_scalable` | toggle | `0` | 0/1 | Allow pinch-to-zoom on mobile |
| `site_preloader` | toggle | `0` | 0/1 | Show loading animation |
| `preloader_img` | image | - | array (id, url) | Custom preloader image |
| `preloader_images` | image | - | array | Placeholder for lazy images |
| `static_blocks` | toggle | `1` | 0/1 | Enable static blocks post type |
| `testimonials_type` | toggle | `0` | 0/1 | Enable testimonials post type |
| `old_widgets_panel_type` | toggle | `0` | 0/1 | Use classic widgets editor |
| `etheme_studio_on` | toggle | `1` | 0/1 | Enable XStudio for Elementor |
| `et_wpbakery_css_module` | toggle | `0` | 0/1 | WPBakery responsive CSS boxes |
| `et_menu_options` | toggle | `1` | 0/1 | Advanced mega menu options |

### Example: Set Wide Layout with Custom Width

```bash
wp option patch update theme_mods_xstore-child main_layout 'wide'
wp option patch update theme_mods_xstore-child site_width 1400
```

---

## 2. STYLING / COLORS

Source: `framework/customizer/theme-options/styling/styling.php`

### Main Colors

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `dark_styles` | toggle | `0` | Enable dark mode site-wide |
| `activecol` | color | `#a4004f` | Main accent color (links, buttons, active states) |
| `browser_bar_color` | color | - | Mobile browser theme color |
| `background_img` | background | `#ffffff` | Site background (color + image) |
| `container_bg` | color | - | Content container background |

### Slider Arrows

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `slider_arrows_colors` | select | `transparent` | `transparent` or `custom` |
| `slider_arrows_bg_color` | color | - | Arrow background (if custom) |
| `slider_arrows_color` | color | - | Arrow icon color |
| `bold_icons` | toggle | `0` | Make all icons bold |

### Form Inputs

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `form_inputs_border_radius` | slider | `0` | Input border radius (0-50px) |
| `forms_inputs_bg` | color | - | Input background color |
| `forms_inputs_br` | color | - | Input border color |

### Alerts/Notices

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `notices_bg` | multicolor | - | Background: `notice` (success), `info`, `error` |
| `notices_color` | multicolor | - | Text color: `notice`, `info`, `error` |

### Light Buttons

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `light_buttons_fonts` | typography | - | Button font settings |
| `light_buttons_bg` | multicolor | - | Background: `regular`, `hover` |
| `light_buttons_color` | multicolor | - | Text: `regular`, `hover` |
| `light_buttons_border_color` | multicolor | - | Border: `regular`, `hover` |
| `light_buttons_border_width` | dimensions | - | Border width (top/right/bottom/left) |
| `light_buttons_border_radius` | dimensions | - | Border radius (corners) |
| `light_buttons_border_style` | select | `none` | `none`, `solid`, `dashed`, `dotted` |

### Dark Buttons

Same pattern as light buttons with `dark_buttons_*` prefix.

### Active Buttons

Same pattern with `active_buttons_*` prefix.

### Example: Set Brand Colors

```bash
# Set main accent color
wp option patch update theme_mods_xstore-child activecol '#ff7eb9'

# Set button colors (JSON format for multicolor)
wp option patch update theme_mods_xstore-child light_buttons_bg --format=json '{"regular":"#ff7eb9","hover":"#ff65a3"}'
wp option patch update theme_mods_xstore-child light_buttons_color --format=json '{"regular":"#ffffff","hover":"#ffffff"}'
```

---

## 3. TYPOGRAPHY

Source: `framework/customizer/theme-options/typography/content.php`

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `sfont` | typography | Lato | Body font (family, variant, size, line-height, color, transform) |
| `paragraph_font_size` | slider | `16` | Paragraph size (10-35px) |
| `paragraph_line_height` | slider | `1.6` | Paragraph line height (1-2) |
| `headings` | typography | Lato | Headings font (h1-h6) |

### Typography Object Structure

```json
{
  "font-family": "Manrope-Regular",
  "variant": "regular",
  "font-size": "17px",
  "line-height": "1.6",
  "letter-spacing": "",
  "color": "#000000",
  "text-transform": "",
  "font-weight": 400,
  "font-style": "normal"
}
```

### Example: Set Custom Fonts

```bash
wp option patch update theme_mods_xstore-child sfont --format=json '{
  "font-family": "Manrope-Regular",
  "variant": "regular",
  "font-size": "17px",
  "line-height": "1.6",
  "color": "#000000",
  "font-weight": 400
}'

wp option patch update theme_mods_xstore-child headings --format=json '{
  "font-family": "Manrope-SemiBold",
  "variant": "700",
  "color": "#222222",
  "text-transform": "none",
  "font-weight": 700
}'
```

---

## 4. HEADER BUILDER

XStore uses a drag-and-drop header builder. Header elements are stored as JSON.

### Header Rows

| Option | Type | Description |
|--------|------|-------------|
| `header_top_elements` | JSON | Top header row elements |
| `header_main_elements` | JSON | Main header row elements |
| `header_bottom_elements` | JSON | Bottom header row elements |
| `header_mobile_main_elements` | JSON | Mobile header elements |

### Header Element Structure

```json
{
  "element-ID": {
    "size": "4",
    "index": "1",
    "offset": "0",
    "element": "contacts"
  }
}
```

### Available Header Elements

- `logo` - Site logo
- `main_menu` - Primary navigation
- `secondary_menu` - Secondary menu
- `search` - Search form
- `cart` - WooCommerce cart
- `wishlist` - Wishlist icon
- `account` - User account
- `contacts` - Contact info
- `html_block1` to `html_block5` - Custom HTML
- `button` - CTA button
- `mobile_menu` - Mobile menu toggle
- `connect_block` - Icon group

### Header Background Options

| Option | Type | Description |
|--------|------|-------------|
| `top_header_background_et-desktop` | background | Top header background |
| `main_header_background_et-desktop` | background | Main header background |
| `bottom_header_background_et-desktop` | background | Bottom header background |
| `*_et-mobile` variants | background | Mobile-specific backgrounds |

### Header Heights

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `top_header_height_et-desktop` | slider | - | Top row height (px) |
| `main_header_height_et-desktop` | slider | - | Main row height (px) |
| `bottom_header_height_et-desktop` | slider | - | Bottom row height (px) |

### Logo Options

| Option | Type | Description |
|--------|------|-------------|
| `logo_img_et-desktop` | image | Logo image (id, url, width, height) |
| `logo_width_et-desktop` | slider | Logo width in pixels |
| `logo_align_et-desktop` | select | Logo alignment (start/center/end) |

---

## 5. BREADCRUMBS

Source: `framework/customizer/theme-options/breadcrumbs/breadcrumbs.php`

| Option | Type | Default | Values | Description |
|--------|------|---------|--------|-------------|
| `breadcrumb_type` | select | `left2` | `left2`, `default`, `left`, `disable` | Breadcrumb style |
| `breadcrumb_title_tag` | select | `h1` | h1-h6, p, span, div | Title HTML tag |
| `breadcrumb_category_title_tag` | select | `h1` | h1-h6, p, span, div | Category title tag |
| `cart_special_breadcrumbs` | toggle | `1` | 0/1 | Step breadcrumbs on cart/checkout |
| `breadcrumb_bg` | background | - | color + image | Breadcrumb area background |
| `breadcrumb_color` | select | `dark` | `dark`, `white` | Text color scheme |
| `breadcrumb_effect` | select | `mouse` | `none`, `mouse`, `text-scroll` | Animation effect |
| `breadcrumb_padding` | dimensions | - | padding values | Area padding |
| `bc_breadcrumbs_font` | typography | - | font settings | Breadcrumb text font |
| `bc_title_font` | typography | - | font settings | Title font |
| `bc_page_numbers` | toggle | `0` | 0/1 | Disable page numbers |
| `return_to_previous` | toggle | `1` | 0/1 | Show back link |
| `bc_return_font` | typography | - | font settings | Back link font |

---

## 6. FOOTER

Source: `framework/customizer/theme-options/footer/layout.php`

| Option | Type | Default | Values | Description |
|--------|------|---------|--------|-------------|
| `footer_columns` | select | `4` | 1, 2, 3, 4 | Number of widget columns |
| `footer_demo` | toggle | `1` | 0/1 | Show demo content |
| `footer_fixed` | toggle | `0` | 0/1 | Sliding footer effect |
| `footer_widgets_open_close` | toggle | `1` | 0/1 | Collapsible widgets on mobile |
| `footer_widgets_open_close_type` | select | `closed_mobile` | `open_mobile`, `closed_mobile` | Default state |

### Footer Styling

| Option | Type | Description |
|--------|------|-------------|
| `footer_bg_color` | background | Footer background |
| `footer-links` | multicolor | Link colors (regular/hover/active) |
| `footer_padding` | dimensions | Footer padding |
| `footer_border_width` | slider | Border width |
| `footer_border_style` | select | Border style |

---

## 7. SPEED OPTIMIZATION

Source: `framework/customizer/theme-options/speed-optimization/speed-optimization.php`

| Option | Type | Default | Values | Description |
|--------|------|---------|--------|-------------|
| `images_loading_type_et-desktop` | select | `lazy` | `lazy`, `lqip`, `default` | Image loading method |
| `images_loading_offset_et-desktop` | slider | `200` | 0-1000 (px) | Lazy load trigger offset |
| `disable_wordpress_lazy_loading` | toggle | `0` | 0/1 | Disable native WP lazy load |
| `rocket_delay_js_exclusions` | toggle | `0` | 0/1 | WP Rocket JS exclusions |
| `disable_old_browsers_support` | toggle | `1` | 0/1 | Skip old browser polyfills |
| `fa_icons_library` | select | `disable` | `disable`, `4.7.0`, `5.15.3`, `6.4.0` | FontAwesome version |
| `menu_dropdown_ajax` | toggle | `1` | 0/1 | Ajax-load menu dropdowns |
| `menu_dropdown_ajax_cache` | toggle | `1` | 0/1 | Cache menu in localStorage |
| `menu_cache` | toggle | `0` | 0/1 | Server-side menu cache |

---

## 8. WOOCOMMERCE - SHOP LAYOUT

Source: `framework/customizer/theme-options/woocommerce/shop/layout.php`

| Option | Type | Default | Values | Description |
|--------|------|---------|--------|-------------|
| `products_per_page` | slider | `12` | -1 to 100 | Products per page |
| `et_ppp_options` | text | `12,24,36,-1` | comma-separated | Per-page dropdown options |
| `grid_sidebar` | radio-image | `left` | `left`, `right`, `without` | Shop sidebar position |
| `category_sidebar` | radio-image | `left` | same | Category page sidebar |
| `category_page_columns` | select | `inherit` | 1-6 or inherit | Category columns |
| `brand_sidebar` | radio-image | `left` | same | Brand page sidebar |
| `brand_page_columns` | select | `inherit` | 1-6 or inherit | Brand page columns |
| `shop_sticky_sidebar` | toggle | `0` | 0/1 | Sticky sidebar |
| `sidebar_for_mobile` | select | `off_canvas` | `top`, `bottom`, `off_canvas` | Mobile sidebar |
| `sidebar_for_mobile_icon` | image | - | SVG icon | Mobile toggle icon |
| `shop_sidebar_hide_mobile` | toggle | `0` | 0/1 | Hide sidebar on mobile |
| `shop_full_width` | toggle | `0` | 0/1 | Full-width shop |
| `products_masonry` | toggle | `0` | 0/1 | Masonry layout |
| `view_mode` | select | `grid_list` | `grid_list`, `list_grid`, `grid`, `list`, `smart` | View mode |
| `view_mode_smart_active` | select | `4` | 2-6, list | Default smart view |

---

## 9. WOOCOMMERCE - PRODUCTS STYLE

Source: `framework/customizer/theme-options/woocommerce/shop/products-style.php`

| Option | Type | Default | Values | Description |
|--------|------|---------|--------|-------------|
| `product_view` | select | `disable` | `disable`, `default`, `overlay`, `info`, `mask`, `mask2`, `mask3`, `custom` | Product card design |
| `custom_product_template` | select | `default` | WPBakery grid IDs | Custom grid template |
| `custom_product_template_list` | select | `default` | WPBakery grid IDs | Custom list template |
| `product_bordered_layout` | toggle | `0` | 0/1 | Add borders |
| `product_no_space` | toggle | `0` | 0/1 | Remove spacing |
| `product_view_color` | select | `white` | `white`, `dark` | Hover color scheme |
| `product_img_hover` | select | `slider` | `none`, `swap`, `slider`, `carousel`, `zoom-in`, `back-zoom-in`, `back-zoom-out` | Image hover effect |
| `product_stretch_img` | toggle | `1` | 0/1 | Stretch images to fill |
| `product_title_tag` | select | `h2` | h1-h6, div, span, p | Title HTML tag |
| `product_title_limit_type` | select | `chars` | `chars`, `lines` | Limit type |
| `product_title_limit` | slider | `0` | 0-100 | Character limit |
| `product_title_limit_lines` | slider | `2` | 1-5 | Line limit |
| `star-rating-color` | color | `#fdd835` | hex color | Star rating color |
| `product_page_switchers` | multicheck | various | array | Elements to display |

### Product Content Elements (product_page_switchers)

- `product_page_productname` - Product name
- `product_page_cats` - Categories
- `product_page_price` - Price
- `product_page_addtocart` - Add to cart button
- `product_page_productrating` - Star rating
- `product_page_product_sku` - SKU
- `hide_buttons_mobile` - Show hover buttons on mobile

---

## 10. WOOCOMMERCE - SINGLE PRODUCT

Source: `framework/customizer/theme-options/woocommerce/single-product/layout.php`

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `single_sidebar` | radio-image | `right` | Product page sidebar |
| `single_product_hide_sidebar` | toggle | `1` | Hide sidebar |
| `thumbs_slider_vertical` | select | `vertical` | Thumbnail orientation |
| `count_slides` | slider | `5` | Number of thumbnails |
| `product_zoom` | toggle | `0` | Enable image zoom |
| `show_brand` | toggle | `0` | Show brand |
| `product_posts_links` | toggle | `0` | Prev/next product links |
| `related_slides` | dimensions | - | Related products layout |

---

## 11. BLOG

Source: `framework/customizer/theme-options/blog/layout.php`

| Option | Type | Default | Values | Description |
|--------|------|---------|--------|-------------|
| `blog_layout` | select | `grid` | `grid`, `list`, `timeline` | Blog archive layout |
| `blog_columns` | select | `3` | 1-4 | Grid columns |
| `blog_masonry` | toggle | `0` | 0/1 | Masonry layout |
| `blog_sidebar` | select | `without` | `left`, `right`, `without` | Sidebar position |
| `blog_categories` | toggle | `0` | 0/1 | Show categories |
| `excerpt_length` | slider | `25` | 0-100 | Excerpt word count |
| `read_more` | select | `off` | `off`, `button`, `link` | Read more style |
| `blog_pagination_align` | select | `center` | alignment | Pagination alignment |

### Single Post

| Option | Type | Default | Description |
|--------|------|---------|-------------|
| `post_sidebar` | select | `without` | Sidebar position |
| `post_template` | select | `framed` | Post template style |
| `post_related` | toggle | `0` | Show related posts |
| `posts_links` | toggle | `0` | Prev/next post links |
| `single_post_title` | toggle | `1` | Show post title |

---

## 12. CUSTOM CSS

Source: `framework/customizer/theme-options/custom-css/custom-css.php`

| Option | Type | Description |
|--------|------|-------------|
| `custom_css_global` | textarea | CSS for all devices |
| `custom_css_desktop` | textarea | Desktop-only CSS |
| `custom_css_tablet` | textarea | Tablet-only CSS |
| `custom_css_mobile` | textarea | Mobile-only CSS |

### Example: Add Custom CSS

```bash
wp option patch update theme_mods_xstore-child custom_css_global '
.products-loop .product:hover {
    box-shadow: 0px 0px 10px 3px rgba(0,0,0,.1);
    transform: translateY(-5px);
}
'
```

---

## Complete Configuration Example

Here's how to configure a site similar to beautypin.gr:

```bash
#!/bin/bash

# Layout
wp option patch update theme_mods_xstore-child main_layout 'wide'
wp option patch update theme_mods_xstore-child site_width 1951

# Colors
wp option patch update theme_mods_xstore-child activecol '#fff3f7'
wp option patch update theme_mods_xstore-child light_buttons_bg --format=json '{"regular":"#ff7eb9","hover":"#ff65a3"}'
wp option patch update theme_mods_xstore-child light_buttons_color --format=json '{"regular":"#ffffff","hover":"#ffffff"}'

# Typography
wp option patch update theme_mods_xstore-child sfont --format=json '{"font-family":"Manrope-Regular","font-size":"17px","color":"#000000","font-weight":400}'
wp option patch update theme_mods_xstore-child headings --format=json '{"font-family":"Manrope-SemiBold","color":"#222222","font-weight":700}'

# Breadcrumbs
wp option patch update theme_mods_xstore-child breadcrumb_bg --format=json '{"background-color":"#f8cae2"}'

# Shop
wp option patch update theme_mods_xstore-child products_per_page 32
wp option patch update theme_mods_xstore-child product_img_hover 'swap'

# Speed
wp option patch update theme_mods_xstore-child images_loading_type_et-desktop 'lazy'
wp option patch update theme_mods_xstore-child menu_dropdown_ajax 1

# Clear cache
wp cache flush
```
