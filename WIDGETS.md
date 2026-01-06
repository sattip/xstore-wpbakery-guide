# Widget Configuration Guide

Complete reference for configuring widgets in XStore theme via WordPress database.

## Table of Contents
1. [Widget System Overview](#widget-system-overview)
2. [Sidebar Areas](#sidebar-areas)
3. [Widget Types](#widget-types)
4. [WP-CLI Widget Commands](#wp-cli-widget-commands)
5. [Database Structure](#database-structure)
6. [Common Configurations](#common-configurations)

---

## Widget System Overview

### How Widgets Work
- Widgets are stored in `wp_options` table
- Each widget type has its own option: `widget_{widget_type}`
- Sidebar assignments stored in `sidebars_widgets` option
- XStore adds custom widget types for e-commerce

### Key Database Options
| Option Name | Purpose |
|-------------|---------|
| `sidebars_widgets` | Widget-to-sidebar assignments |
| `widget_text` | Text widget instances |
| `widget_nav_menu` | Menu widget instances |
| `widget_etheme-static-block` | XStore static block widgets |
| `widget_woocommerce_*` | WooCommerce widgets |

---

## Sidebar Areas

### Default XStore Sidebars
| Sidebar ID | Name | Location |
|------------|------|----------|
| `shop-sidebar` | Shop Sidebar | Shop/category pages |
| `single-sidebar` | Single Product Sidebar | Product detail pages |
| `prefooter` | Pre-Footer | Above footer |
| `footer-1` | Footer Column 1 | Footer area |
| `footer-2` | Footer Column 2 | Footer area |
| `footer-3` | Footer Column 3 | Footer area |
| `footer-4` | Footer Column 4 | Footer area |
| `blog-sidebar` | Blog Sidebar | Blog pages |
| `single-post-sidebar` | Single Post Sidebar | Blog post pages |

### Custom Sidebars
Create custom sidebars via `etheme_custom_sidebars` option:

```php
// Option: etheme_custom_sidebars
[
    'custom-sidebar-1' => 'Custom Sidebar Name',
    'category-skincare-sidebar' => 'Skincare Category Sidebar'
]
```

### WP-CLI: List Sidebars
```bash
wp sidebar list --format=table
```

---

## Widget Types

### XStore Widgets

#### etheme-static-block
Displays a static block by ID.

```php
// Option: widget_etheme-static-block
[
    2 => [
        'title' => '',
        'block_id' => 183  // Static block post ID
    ],
    '_multiwidget' => 1
]
```

**WP-CLI:**
```bash
wp widget add etheme-static-block shop-sidebar --block_id=183
```

#### etheme_widget_products
Displays products in sidebar.

```php
// Option: widget_etheme_widget_products
[
    2 => [
        'title' => 'Featured Products',
        'show' => 'featured',  // recent, featured, on_sale, best_selling
        'number' => 4,
        'hide_free' => 0,
        'show_hidden' => 0
    ],
    '_multiwidget' => 1
]
```

#### etheme_brands_filter
Brand filtering widget for shop.

```php
// Option: widget_etheme_brands_filter
[
    2 => [
        'title' => 'Brands',
        'display_type' => 'list',  // list, dropdown
        'show_count' => 1,
        'hide_empty' => 1
    ],
    '_multiwidget' => 1
]
```

### WooCommerce Widgets

#### woocommerce_product_search
Product search box.

```php
// Option: widget_woocommerce_product_search
[
    2 => [
        'title' => 'Search Products'
    ],
    '_multiwidget' => 1
]
```

**WP-CLI:**
```bash
wp widget add woocommerce_product_search shop-sidebar --title="Search"
```

#### woocommerce_product_categories
Category list/dropdown.

```php
// Option: widget_woocommerce_product_categories
[
    2 => [
        'title' => 'Categories',
        'dropdown' => 0,
        'count' => 1,
        'hierarchical' => 1,
        'show_children_only' => 0,
        'hide_empty' => 1,
        'max_depth' => 0
    ],
    '_multiwidget' => 1
]
```

**WP-CLI:**
```bash
wp widget add woocommerce_product_categories shop-sidebar \
  --title="Categories" \
  --count=1 \
  --hierarchical=1 \
  --hide_empty=1
```

#### woocommerce_price_filter
Price range slider.

```php
// Option: widget_woocommerce_price_filter
[
    2 => [
        'title' => 'Filter by Price'
    ],
    '_multiwidget' => 1
]
```

#### woocommerce_layered_nav
Attribute filter (color, size, etc.).

```php
// Option: widget_woocommerce_layered_nav
[
    2 => [
        'title' => 'Filter by Color',
        'attribute' => 'pa_color',
        'display_type' => 'list',  // list, dropdown
        'query_type' => 'and'  // and, or
    ],
    '_multiwidget' => 1
]
```

#### woocommerce_rating_filter
Star rating filter.

```php
// Option: widget_woocommerce_rating_filter
[
    2 => [
        'title' => 'Filter by Rating'
    ],
    '_multiwidget' => 1
]
```

#### woocommerce_recently_viewed_products
Recently viewed products.

```php
// Option: widget_woocommerce_recently_viewed_products
[
    2 => [
        'title' => 'Recently Viewed',
        'number' => 4
    ],
    '_multiwidget' => 1
]
```

### Standard WordPress Widgets

#### text
HTML/text content widget.

```php
// Option: widget_text
[
    2 => [
        'title' => 'Widget Title',
        'text' => '<p>Your HTML content here</p>',
        'filter' => true  // Apply wpautop
    ],
    '_multiwidget' => 1
]
```

#### custom_html
Raw HTML widget.

```php
// Option: widget_custom_html
[
    2 => [
        'title' => '',
        'content' => '<div class="custom-widget">HTML here</div>'
    ],
    '_multiwidget' => 1
]
```

#### nav_menu
Navigation menu widget.

```php
// Option: widget_nav_menu
[
    2 => [
        'title' => 'Quick Links',
        'nav_menu' => 5  // Menu ID
    ],
    '_multiwidget' => 1
]
```

#### media_image
Image widget.

```php
// Option: widget_media_image
[
    2 => [
        'title' => '',
        'attachment_id' => 123,
        'url' => 'https://example.com/page',
        'link_type' => 'custom',
        'size' => 'full',
        'width' => 300,
        'height' => 200,
        'alt' => 'Image description'
    ],
    '_multiwidget' => 1
]
```

---

## WP-CLI Widget Commands

### List Widgets in Sidebar
```bash
wp widget list shop-sidebar --format=table
```

### Add Widget to Sidebar
```bash
# Add product search
wp widget add woocommerce_product_search shop-sidebar --title="Search"

# Add categories with options
wp widget add woocommerce_product_categories shop-sidebar \
  --title="Categories" \
  --count=1 \
  --hierarchical=1

# Add static block
wp widget add etheme-static-block shop-sidebar --block_id=422

# Add price filter
wp widget add woocommerce_price_filter shop-sidebar --title="Price"

# Add text widget with HTML
wp widget add text shop-sidebar \
  --title="Contact Us" \
  --text="<p>Call: +30 210 1234567</p>"

# Add at specific position (0 = first)
wp widget add woocommerce_product_search shop-sidebar 0 --title="Search"
```

### Update Widget
```bash
# Update widget instance 2 in shop-sidebar
wp widget update shop-sidebar-2 --title="New Title" --count=0
```

### Move Widget
```bash
# Move widget to position 0 (first)
wp widget move shop-sidebar-2 --position=0
```

### Delete Widget
```bash
# Delete specific widget
wp widget delete shop-sidebar-2

# Delete all widgets from sidebar
wp widget reset shop-sidebar
```

### Deactivate Widget
```bash
# Move to inactive widgets
wp widget deactivate shop-sidebar-2
```

---

## Database Structure

### sidebars_widgets Option
Maps widgets to sidebars:

```php
// Option: sidebars_widgets
[
    'wp_inactive_widgets' => [],
    'shop-sidebar' => [
        'woocommerce_product_search-2',
        'woocommerce_product_categories-2',
        'woocommerce_price_filter-2',
        'etheme-static-block-2'
    ],
    'footer-1' => [
        'text-2',
        'nav_menu-2'
    ],
    'footer-2' => [
        'text-3'
    ],
    'array_version' => 3
]
```

### Widget Instance Storage
Each widget type stores instances in its own option:

```php
// Option: widget_woocommerce_product_categories
[
    2 => [
        'title' => 'Categories',
        'count' => 1,
        'hierarchical' => 1,
        'dropdown' => 0,
        'hide_empty' => 1
    ],
    3 => [
        'title' => 'Shop by Category',
        'count' => 0,
        'hierarchical' => 0,
        'dropdown' => 1,
        'hide_empty' => 1
    ],
    '_multiwidget' => 1
]
```

### Direct SQL Updates

**Get current sidebar widgets:**
```sql
SELECT option_value FROM wp_options WHERE option_name = 'sidebars_widgets';
```

**Update sidebar widgets:**
```sql
UPDATE wp_options
SET option_value = 'SERIALIZED_ARRAY'
WHERE option_name = 'sidebars_widgets';
```

**Get widget instances:**
```sql
SELECT option_value FROM wp_options
WHERE option_name = 'widget_woocommerce_product_categories';
```

---

## Common Configurations

### Shop Sidebar (E-commerce)

Complete shop sidebar setup:

```bash
# Clear existing widgets
wp widget reset shop-sidebar

# Add widgets in order
wp widget add woocommerce_product_search shop-sidebar 0 --title=""
wp widget add woocommerce_product_categories shop-sidebar 1 \
  --title="Categories" --count=1 --hierarchical=1 --hide_empty=1
wp widget add woocommerce_price_filter shop-sidebar 2 --title="Price"
wp widget add woocommerce_layered_nav shop-sidebar 3 \
  --title="Brand" --attribute=pa_brand --display_type=list
wp widget add etheme_brands_filter shop-sidebar 4 \
  --title="Brands" --display_type=list --show_count=1
wp widget add woocommerce_rating_filter shop-sidebar 5 --title="Rating"
wp widget add etheme-static-block shop-sidebar 6 --block_id=422
```

### Footer Widgets

Four-column footer configuration:

```bash
# Footer Column 1 - About
wp widget add text footer-1 --title="About Us" \
  --text="<p>Your trusted online store since 2020.</p><p>Quality products, fast shipping.</p>"
wp widget add etheme-static-block footer-1 --block_id=SOCIAL_BLOCK_ID

# Footer Column 2 - Quick Links
wp widget add nav_menu footer-2 --title="Quick Links" --nav_menu=MENU_ID

# Footer Column 3 - Customer Service
wp widget add nav_menu footer-3 --title="Customer Service" --nav_menu=SERVICE_MENU_ID

# Footer Column 4 - Contact
wp widget add custom_html footer-4 --title="Contact" \
  --content="<p><strong>Phone:</strong> +30 210 1234567</p><p><strong>Email:</strong> info@store.gr</p>"
```

### Blog Sidebar

```bash
wp widget add search blog-sidebar 0 --title="Search"
wp widget add recent-posts blog-sidebar 1 --title="Recent Posts" --number=5
wp widget add categories blog-sidebar 2 --title="Categories" --count=1
wp widget add tag_cloud blog-sidebar 3 --title="Tags" --taxonomy=post_tag
```

### Category-Specific Sidebar

Create a custom sidebar for specific categories:

```bash
# 1. Create custom sidebar (via theme options)
wp option patch update etheme_custom_sidebars skincare-sidebar "Skincare Sidebar"

# 2. Add widgets
wp widget add woocommerce_product_search skincare-sidebar 0
wp widget add etheme-static-block skincare-sidebar 1 --block_id=SKINCARE_BANNER_ID
wp widget add woocommerce_layered_nav skincare-sidebar 2 \
  --title="Skin Type" --attribute=pa_skin-type
wp widget add woocommerce_price_filter skincare-sidebar 3
```

---

## Complete Setup Script

Full widget configuration via WP-CLI:

```bash
#!/bin/bash
# XStore Widget Setup Script

# ==================
# SHOP SIDEBAR
# ==================
echo "Setting up shop sidebar..."
wp widget reset shop-sidebar 2>/dev/null

# Search (no title for cleaner look)
wp widget add woocommerce_product_search shop-sidebar 0 --title=""

# Categories
wp widget add woocommerce_product_categories shop-sidebar 1 \
  --title="Categories" \
  --count=1 \
  --hierarchical=1 \
  --hide_empty=1

# Price filter
wp widget add woocommerce_price_filter shop-sidebar 2 \
  --title="Filter by Price"

# Brand filter (if using brand taxonomy)
wp widget add woocommerce_layered_nav shop-sidebar 3 \
  --title="Brand" \
  --attribute=pa_brand \
  --display_type=list \
  --query_type=or

# Rating filter
wp widget add woocommerce_rating_filter shop-sidebar 4 \
  --title="Filter by Rating"

# Promotional banner (static block)
wp widget add etheme-static-block shop-sidebar 5 \
  --block_id=422

echo "Shop sidebar setup complete!"

# ==================
# FOOTER WIDGETS
# ==================
echo "Setting up footer widgets..."

# Footer 1 - Logo & About
wp widget reset footer-1 2>/dev/null
wp widget add media_image footer-1 0 \
  --attachment_id=LOGO_ID \
  --size=medium \
  --link_type=none
wp widget add text footer-1 1 \
  --title="" \
  --text="<p style='font-size:14px;'>Quality products delivered to your door. Free shipping on orders over 50 EUR.</p>"

# Footer 2 - Shop Links
wp widget reset footer-2 2>/dev/null
wp widget add nav_menu footer-2 0 \
  --title="Shop" \
  --nav_menu=SHOP_MENU_ID

# Footer 3 - Information
wp widget reset footer-3 2>/dev/null
wp widget add nav_menu footer-3 0 \
  --title="Information" \
  --nav_menu=INFO_MENU_ID

# Footer 4 - Contact
wp widget reset footer-4 2>/dev/null
wp widget add custom_html footer-4 0 \
  --title="Contact Us" \
  --content="<p><i class='fa fa-phone'></i> +30 210 1234567</p><p><i class='fa fa-envelope'></i> info@store.gr</p><p><i class='fa fa-clock-o'></i> Mon-Fri 9:00-18:00</p>"

echo "Footer widgets setup complete!"

# ==================
# VERIFY SETUP
# ==================
echo ""
echo "Current widget configuration:"
echo "============================"
echo ""
echo "Shop Sidebar:"
wp widget list shop-sidebar --format=table

echo ""
echo "Footer 1:"
wp widget list footer-1 --format=table

echo ""
echo "Setup complete!"
```

---

## Troubleshooting

### Widgets Not Appearing
1. Check sidebar is registered in theme
2. Verify widget is assigned to correct sidebar
3. Clear cache: `wp cache flush`
4. Check if sidebar is displayed in template

### Widget Order Wrong
```bash
# List current order
wp widget list shop-sidebar --format=table

# Move widget to specific position
wp widget move shop-sidebar-5 --position=0
```

### Reset All Widgets
```bash
# Reset all sidebars to empty
wp sidebar list --field=id | xargs -I {} wp widget reset {}
```

### Debug Widget Data
```bash
# Export all widget data
wp option get sidebars_widgets --format=json > sidebars.json
wp option get widget_text --format=json > widget_text.json
```
