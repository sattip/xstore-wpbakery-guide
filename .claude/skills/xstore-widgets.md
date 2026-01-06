# XStore Widget Configuration

Configure sidebar widgets for XStore theme via WP-CLI.

## Usage
```
/xstore-widgets
```

## Instructions

When this skill is invoked, help the user configure widgets for XStore theme sidebars.

### Reference Documentation
Read the widget reference from: `WIDGETS.md` in this repository.

### Available Sidebars

| Sidebar ID | Purpose |
|------------|---------|
| `shop-sidebar` | Shop/category pages |
| `single-sidebar` | Product detail pages |
| `footer-1` to `footer-4` | Footer columns |
| `blog-sidebar` | Blog pages |

### Common Widget Commands

**List widgets in sidebar:**
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

# Rating filter
wp widget add woocommerce_rating_filter shop-sidebar --title="Rating"

# Static block (banner)
wp widget add etheme-static-block shop-sidebar --block_id=BLOCK_ID
```

**Reset sidebar:**
```bash
wp widget reset shop-sidebar
```

**Move widget position:**
```bash
wp widget move shop-sidebar-2 --position=0
```

### Complete Shop Sidebar Setup

```bash
# Reset and configure shop sidebar
wp widget reset shop-sidebar

wp widget add woocommerce_product_search shop-sidebar 0 --title=""
wp widget add woocommerce_product_categories shop-sidebar 1 \
  --title="Categories" --count=1 --hierarchical=1 --hide_empty=1
wp widget add woocommerce_price_filter shop-sidebar 2 --title="Price"
wp widget add woocommerce_layered_nav shop-sidebar 3 \
  --title="Brand" --attribute=pa_brand --display_type=list
wp widget add woocommerce_rating_filter shop-sidebar 4 --title="Rating"
```

### Footer Widgets Setup

```bash
# Footer column 1 - About/Logo
wp widget add text footer-1 --title="" \
  --text="<p>Your trusted online store.</p>"

# Footer column 2 - Navigation menu
wp widget add nav_menu footer-2 --title="Quick Links" --nav_menu=MENU_ID

# Footer column 3 - Another menu
wp widget add nav_menu footer-3 --title="Customer Service" --nav_menu=MENU_ID

# Footer column 4 - Contact info
wp widget add custom_html footer-4 --title="Contact" \
  --content="<p>Phone: +30 210 1234567</p>"
```

### Widget Types Reference

| Widget | Purpose |
|--------|---------|
| `woocommerce_product_search` | Product search box |
| `woocommerce_product_categories` | Category list/dropdown |
| `woocommerce_price_filter` | Price range slider |
| `woocommerce_layered_nav` | Attribute filter (brand, color, size) |
| `woocommerce_rating_filter` | Star rating filter |
| `etheme-static-block` | Display static block by ID |
| `etheme_widget_products` | Product display widget |
| `text` | Text/HTML widget |
| `nav_menu` | Navigation menu |
| `custom_html` | Raw HTML |

### Workflow

1. Ask user which sidebar they want to configure
2. List current widgets: `wp widget list SIDEBAR --format=table`
3. Determine which widgets to add/remove
4. Execute WP-CLI widget commands
5. Verify configuration with widget list
