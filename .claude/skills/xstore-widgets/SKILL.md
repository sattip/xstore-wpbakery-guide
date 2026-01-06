---
name: xstore-widgets
description: Configure sidebar widgets for XStore WooCommerce theme via WP-CLI. Use when setting up shop sidebar filters, footer widgets, product categories, price filters, or brand filters.
allowed-tools: Read, Bash, Grep, Glob
---

# XStore Widget Configuration

Configure sidebar widgets for XStore theme via WP-CLI.

## Instructions

When this skill is invoked, help the user configure widgets for XStore theme sidebars.

### Reference Documentation

Read the widget reference from `WIDGETS.md` in this repository.

### Available Sidebars

| Sidebar ID | Purpose |
|------------|---------|
| `shop-sidebar` | Shop/category pages |
| `single-sidebar` | Product detail pages |
| `footer-1` to `footer-4` | Footer columns |
| `blog-sidebar` | Blog pages |

### Common Widget Commands

**List widgets:**
```bash
wp widget list shop-sidebar --format=table
```

**Add widgets:**
```bash
# Product search
wp widget add woocommerce_product_search shop-sidebar --title=""

# Categories
wp widget add woocommerce_product_categories shop-sidebar \
  --title="Categories" --count=1 --hierarchical=1 --hide_empty=1

# Price filter
wp widget add woocommerce_price_filter shop-sidebar --title="Price"

# Brand filter
wp widget add woocommerce_layered_nav shop-sidebar \
  --title="Brand" --attribute=pa_brand --display_type=list

# Static block (banner)
wp widget add etheme-static-block shop-sidebar --block_id=BLOCK_ID
```

**Reset sidebar:**
```bash
wp widget reset shop-sidebar
```

### Complete Shop Sidebar Setup

```bash
wp widget reset shop-sidebar
wp widget add woocommerce_product_search shop-sidebar 0 --title=""
wp widget add woocommerce_product_categories shop-sidebar 1 \
  --title="Categories" --count=1 --hierarchical=1 --hide_empty=1
wp widget add woocommerce_price_filter shop-sidebar 2 --title="Price"
wp widget add woocommerce_layered_nav shop-sidebar 3 \
  --title="Brand" --attribute=pa_brand --display_type=list
wp widget add woocommerce_rating_filter shop-sidebar 4 --title="Rating"
```

### Workflow

1. Ask user which sidebar they want to configure
2. List current widgets: `wp widget list SIDEBAR --format=table`
3. Determine which widgets to add/remove
4. Execute WP-CLI widget commands
5. Verify configuration with widget list
