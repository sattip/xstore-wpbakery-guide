# Database Operations Guide

Complete reference for WordPress database operations using WP-CLI and direct SQL for XStore theme configuration.

## Table of Contents
1. [WP-CLI Basics](#wp-cli-basics)
2. [Theme Options](#theme-options)
3. [Page Operations](#page-operations)
4. [Static Blocks](#static-blocks)
5. [Post Meta](#post-meta)
6. [Menu Configuration](#menu-configuration)
7. [Product Operations](#product-operations)
8. [Bulk Operations](#bulk-operations)
9. [Backup & Restore](#backup--restore)
10. [Direct SQL Queries](#direct-sql-queries)

---

## WP-CLI Basics

### Check WP-CLI Installation
```bash
wp --info
wp --version
```

### Common Options
```bash
--path=/path/to/wordpress    # WordPress installation path
--url=https://example.com    # Site URL (multisite)
--user=admin                 # Run as specific user
--format=json                # Output format (json, csv, table, yaml)
--quiet                      # Suppress output
```

### Database Connection
```bash
# Check database connection
wp db check

# Execute SQL query
wp db query "SELECT option_value FROM wp_options WHERE option_name='siteurl'"

# Export database
wp db export backup.sql

# Import database
wp db import backup.sql
```

---

## Theme Options

### Get Theme Mods
```bash
# Get all theme mods (serialized)
wp option get theme_mods_xstore-child

# Get as JSON
wp option get theme_mods_xstore-child --format=json

# Get specific value using pluck
wp option pluck theme_mods_xstore-child activecol

# Get nested value
wp option pluck theme_mods_xstore-child light_buttons_bg regular
```

### Set Theme Options
```bash
# Set single option
wp option patch update theme_mods_xstore-child activecol '#ff7eb9'

# Set nested option
wp option patch update theme_mods_xstore-child light_buttons_bg '{"regular":"#ff7eb9","hover":"#ff65a3"}'

# Set multiple options at once
wp option patch update theme_mods_xstore-child \
  activecol '#ff7eb9' \
  dark_styles 0 \
  main_layout 'wide'
```

### Common Theme Options

```bash
# Colors
wp option patch update theme_mods_xstore-child activecol '#ff7eb9'
wp option patch update theme_mods_xstore-child browser_bar_color '#ff7eb9'

# Layout
wp option patch update theme_mods_xstore-child main_layout 'wide'
wp option patch update theme_mods_xstore-child site_width 1170

# Typography (JSON format)
wp option patch update theme_mods_xstore-child sfont '{"font-family":"Manrope-Regular","font-size":"17px","line-height":"1.6"}'
wp option patch update theme_mods_xstore-child headings '{"font-family":"Manrope-SemiBold","font-weight":700}'

# Buttons
wp option patch update theme_mods_xstore-child light_buttons_bg '{"regular":"#ff7eb9","hover":"#ff65a3"}'
wp option patch update theme_mods_xstore-child light_buttons_color '{"regular":"#ffffff","hover":"#ffffff"}'

# Breadcrumbs
wp option patch update theme_mods_xstore-child breadcrumb_type 'left2'
wp option patch update theme_mods_xstore-child breadcrumb_bg '{"background-color":"#f8cae2"}'

# WooCommerce
wp option patch update theme_mods_xstore-child products_per_page 12
wp option patch update theme_mods_xstore-child grid_sidebar 'left'
wp option patch update theme_mods_xstore-child product_view 'default'
```

### Update From JSON File
```bash
# Create JSON file with options
cat > theme-options.json << 'EOF'
{
  "activecol": "#ff7eb9",
  "main_layout": "wide",
  "site_width": 1170,
  "sfont": {
    "font-family": "Manrope-Regular",
    "font-size": "17px"
  },
  "light_buttons_bg": {
    "regular": "#ff7eb9",
    "hover": "#ff65a3"
  }
}
EOF

# Apply options
wp option update theme_mods_xstore-child --format=json < theme-options.json
```

---

## Page Operations

### Create Page
```bash
# Basic page
wp post create --post_type=page \
  --post_title="About Us" \
  --post_content="Page content here" \
  --post_status=publish

# Page with WPBakery content
wp post create --post_type=page \
  --post_title="Contact" \
  --post_content='[vc_row][vc_column][vc_column_text]Contact content[/vc_column_text][/vc_column][/vc_row]' \
  --post_status=publish \
  --porcelain
```

### Create Page From File
```bash
# Save content to file
cat > page-content.txt << 'EOF'
[vc_row full_width="stretch_row" css=".vc_custom_1747813803140{padding:60px !important;background-color:#FFF5F7 !important;}"]
[vc_column]
[vc_custom_heading text="Welcome" font_container="tag:h1|font_size:42px|text_align:center"]
[vc_column_text]Your content here[/vc_column_text]
[/vc_column]
[/vc_row]
EOF

# Create page with content from file
wp post create --post_type=page \
  --post_title="New Page" \
  --post_content="$(cat page-content.txt)" \
  --post_status=publish
```

### Update Page
```bash
# Update title
wp post update 123 --post_title="New Title"

# Update content
wp post update 123 --post_content='[vc_row]...[/vc_row]'

# Update status
wp post update 123 --post_status=draft

# Update from file
wp post update 123 --post_content="$(cat updated-content.txt)"
```

### Get Page Info
```bash
# Get page by ID
wp post get 123 --format=json

# Get page content only
wp post get 123 --field=post_content

# List pages
wp post list --post_type=page --format=table

# Find page by title
wp post list --post_type=page --title="Contact" --format=table

# Find page by slug
wp post list --post_type=page --name="contact" --format=table
```

### Delete Page
```bash
# Move to trash
wp post delete 123

# Permanently delete
wp post delete 123 --force
```

---

## Static Blocks

### List Static Blocks
```bash
wp post list --post_type=staticblocks --format=table --fields=ID,post_title,post_status
```

### Create Static Block
```bash
# Create footer block
wp post create --post_type=staticblocks \
  --post_title="Footer Block" \
  --post_content='[vc_row full_width="stretch_row" css=".vc_custom_1747813803700{background-color:#f8cae2 !important;padding:40px !important;}"][vc_column width="1/5"][vc_custom_heading text="Shop" font_container="tag:h4|font_size:16px"][/vc_column][/vc_row]' \
  --post_status=publish \
  --porcelain

# Create menu block
wp post create --post_type=staticblocks \
  --post_title="Mega Menu Block" \
  --post_content='[vc_row gap="20"][vc_column width="1/4"][vc_column_text]Menu content[/vc_column_text][/vc_column][/vc_row]' \
  --post_status=publish
```

### Update Static Block
```bash
wp post update BLOCK_ID --post_content='[vc_row]Updated content[/vc_row]'
```

### Get Block Content
```bash
wp post get BLOCK_ID --field=post_content
```

---

## Post Meta

### WPBakery Required Meta
```bash
# Enable WPBakery for page
wp post meta update PAGE_ID _wpb_vc_js_status 'true'

# Set custom CSS (compile all shortcode CSS here)
wp post meta update PAGE_ID _wpb_shortcodes_custom_css '.vc_custom_1747813803140{padding:60px !important;}.vc_custom_1747813803141{margin-bottom:30px !important;}'

# Set page-level custom CSS
wp post meta update PAGE_ID _wpb_post_custom_css '.custom-class{color:red;}'
```

### XStore Page Meta
```bash
# Override sidebar for page
wp post meta update PAGE_ID _et_widget_area 'shop-sidebar'

# Set page template
wp post meta update PAGE_ID _wp_page_template 'default'

# Custom header
wp post meta update PAGE_ID _et_custom_header '0'

# Hide breadcrumbs
wp post meta update PAGE_ID _et_hide_breadcrumbs '1'
```

### Get Meta Values
```bash
# Get all meta for post
wp post meta list PAGE_ID --format=table

# Get specific meta
wp post meta get PAGE_ID _wpb_shortcodes_custom_css

# Check if meta exists
wp post meta get PAGE_ID _wpb_vc_js_status
```

### Delete Meta
```bash
wp post meta delete PAGE_ID _wpb_post_custom_css
```

---

## Menu Configuration

### List Menus
```bash
wp menu list --format=table
```

### Create Menu
```bash
# Create menu
wp menu create "Main Navigation"

# Get menu ID
wp menu list --format=ids
```

### Add Menu Items
```bash
# Add page to menu
wp menu item add-post main-navigation PAGE_ID --title="About Us"

# Add custom link
wp menu item add-custom main-navigation "https://example.com/shop" "Shop"

# Add category
wp menu item add-term main-navigation product_cat TERM_ID --title="Skincare"

# Add with parent (submenu)
wp menu item add-custom main-navigation "https://example.com/sale" "Sale" --parent-id=PARENT_ITEM_ID
```

### Assign Menu to Location
```bash
# List theme locations
wp menu location list

# Assign menu
wp menu location assign main-navigation primary
```

### Update Menu Item
```bash
wp menu item update ITEM_ID --title="New Title" --url="https://new-url.com"
```

### Delete Menu Item
```bash
wp menu item delete ITEM_ID
```

---

## Product Operations

### List Products
```bash
wp post list --post_type=product --format=table --fields=ID,post_title,post_status
```

### Get Product
```bash
# Get product info
wp post get PRODUCT_ID --format=json

# Get product meta
wp post meta list PRODUCT_ID --format=table
```

### Update Product Meta
```bash
# Update price
wp post meta update PRODUCT_ID _regular_price '29.99'
wp post meta update PRODUCT_ID _price '29.99'

# Update sale price
wp post meta update PRODUCT_ID _sale_price '19.99'
wp post meta update PRODUCT_ID _price '19.99'

# Update stock
wp post meta update PRODUCT_ID _stock '100'
wp post meta update PRODUCT_ID _stock_status 'instock'

# Update SKU
wp post meta update PRODUCT_ID _sku 'PROD-001'
```

### Product Categories
```bash
# List categories
wp term list product_cat --format=table

# Add product to category
wp post term add PRODUCT_ID product_cat "skincare"

# Set product categories (replace existing)
wp post term set PRODUCT_ID product_cat "skincare" "face-care"
```

---

## Bulk Operations

### Bulk Page Creation
```bash
#!/bin/bash
# Create multiple pages from array

pages=("About Us" "Contact" "FAQ" "Terms" "Privacy")

for page in "${pages[@]}"; do
  slug=$(echo "$page" | tr '[:upper:]' '[:lower:]' | tr ' ' '-')
  wp post create --post_type=page \
    --post_title="$page" \
    --post_name="$slug" \
    --post_status=publish
  echo "Created: $page"
done
```

### Bulk Update
```bash
# Update all pages with specific content
wp post list --post_type=page --format=ids | xargs -I {} wp post meta update {} _wpb_vc_js_status 'true'

# Update all products in category
wp post list --post_type=product --product_cat=skincare --format=ids | xargs -I {} wp post meta update {} _featured 'yes'
```

### Search and Replace
```bash
# Replace text in database
wp search-replace 'old-domain.com' 'new-domain.com' --dry-run
wp search-replace 'old-domain.com' 'new-domain.com'

# Replace in specific table
wp search-replace 'old-text' 'new-text' wp_posts --dry-run
```

---

## Backup & Restore

### Full Backup
```bash
# Export database
wp db export backup-$(date +%Y%m%d).sql

# Export with gzip
wp db export - | gzip > backup-$(date +%Y%m%d).sql.gz
```

### Export Specific Data
```bash
# Export theme options
wp option get theme_mods_xstore-child --format=json > theme-mods-backup.json

# Export all pages
wp post list --post_type=page --format=json --fields=ID,post_title,post_name,post_content,post_status > pages-backup.json

# Export specific page
wp post get PAGE_ID --format=json > page-backup.json
```

### Restore
```bash
# Import database
wp db import backup.sql

# Restore theme options
wp option update theme_mods_xstore-child --format=json < theme-mods-backup.json
```

### Before Making Changes
```bash
# Always backup first
wp db export pre-changes-$(date +%Y%m%d-%H%M%S).sql

# Create restore point for specific option
wp option get theme_mods_xstore-child --format=json > theme-mods-before.json
```

---

## Direct SQL Queries

### Database Tables Reference
| Table | Purpose |
|-------|---------|
| `wp_options` | Site options, theme mods |
| `wp_posts` | Pages, products, static blocks |
| `wp_postmeta` | Post metadata (WPBakery CSS, etc.) |
| `wp_terms` | Categories, tags, brands |
| `wp_term_taxonomy` | Term relationships |
| `wp_term_relationships` | Post-term assignments |

### Common Queries

**Get Theme Options:**
```sql
SELECT option_value FROM wp_options WHERE option_name = 'theme_mods_xstore-child';
```

**Get Page Content:**
```sql
SELECT post_content FROM wp_posts WHERE ID = 123;
```

**Get WPBakery CSS:**
```sql
SELECT meta_value FROM wp_postmeta
WHERE post_id = 123 AND meta_key = '_wpb_shortcodes_custom_css';
```

**Find Pages with Specific Shortcode:**
```sql
SELECT ID, post_title FROM wp_posts
WHERE post_type = 'page'
AND post_content LIKE '%[vc_row%'
AND post_status = 'publish';
```

**Get Static Blocks:**
```sql
SELECT ID, post_title, post_content FROM wp_posts
WHERE post_type = 'staticblocks'
AND post_status = 'publish';
```

**Update Theme Option (be careful!):**
```sql
-- First get current value and backup
SELECT option_value FROM wp_options WHERE option_name = 'theme_mods_xstore-child';

-- Update (serialized data - use WP-CLI instead when possible)
UPDATE wp_options SET option_value = 'SERIALIZED_VALUE'
WHERE option_name = 'theme_mods_xstore-child';
```

**Create Page via SQL:**
```sql
INSERT INTO wp_posts (
  post_author, post_date, post_date_gmt, post_content,
  post_title, post_excerpt, post_status, comment_status,
  ping_status, post_name, post_type, post_modified, post_modified_gmt
) VALUES (
  1, NOW(), UTC_TIMESTAMP(), '[vc_row][vc_column][/vc_column][/vc_row]',
  'New Page', '', 'publish', 'closed',
  'closed', 'new-page', 'page', NOW(), UTC_TIMESTAMP()
);

-- Get the new page ID
SELECT LAST_INSERT_ID();

-- Add required meta
INSERT INTO wp_postmeta (post_id, meta_key, meta_value)
VALUES (LAST_INSERT_ID(), '_wpb_vc_js_status', 'true');
```

### Execute SQL via WP-CLI
```bash
# Single query
wp db query "SELECT ID, post_title FROM wp_posts WHERE post_type='page' LIMIT 10"

# Query from file
wp db query < query.sql

# Get result as JSON (via PHP)
wp eval 'global $wpdb; print_r($wpdb->get_results("SELECT * FROM wp_posts LIMIT 5"));'
```

---

## Cache Management

### Clear Caches
```bash
# Clear WordPress object cache
wp cache flush

# Clear transients
wp transient delete --all

# Clear WPBakery cache (if needed)
wp option delete wpb_js_compiled_css

# Clear rewrite rules
wp rewrite flush
```

### After Theme Changes
```bash
# Full cache clear
wp cache flush && wp transient delete --all && wp rewrite flush
```

---

## Complete Setup Script

Full site setup via WP-CLI:

```bash
#!/bin/bash
# XStore Site Setup Script

echo "Starting XStore setup..."

# Backup current state
echo "Creating backup..."
wp db export pre-setup-$(date +%Y%m%d-%H%M%S).sql

# ==================
# THEME OPTIONS
# ==================
echo "Setting theme options..."

wp option patch update theme_mods_xstore-child activecol '#ff7eb9'
wp option patch update theme_mods_xstore-child main_layout 'wide'
wp option patch update theme_mods_xstore-child site_width 1170
wp option patch update theme_mods_xstore-child breadcrumb_type 'left2'
wp option patch update theme_mods_xstore-child products_per_page 12
wp option patch update theme_mods_xstore-child grid_sidebar 'left'

# ==================
# CREATE PAGES
# ==================
echo "Creating pages..."

# About page
ABOUT_ID=$(wp post create --post_type=page \
  --post_title="About Us" \
  --post_name="about" \
  --post_content="$(cat templates/about.txt)" \
  --post_status=publish \
  --porcelain)
wp post meta update $ABOUT_ID _wpb_vc_js_status 'true'
echo "Created About page: $ABOUT_ID"

# Contact page
CONTACT_ID=$(wp post create --post_type=page \
  --post_title="Contact" \
  --post_name="contact" \
  --post_content="$(cat templates/contact.txt)" \
  --post_status=publish \
  --porcelain)
wp post meta update $CONTACT_ID _wpb_vc_js_status 'true'
echo "Created Contact page: $CONTACT_ID"

# ==================
# STATIC BLOCKS
# ==================
echo "Creating static blocks..."

# Footer block
FOOTER_ID=$(wp post create --post_type=staticblocks \
  --post_title="Footer" \
  --post_content="$(cat templates/footer.txt)" \
  --post_status=publish \
  --porcelain)
wp post meta update $FOOTER_ID _wpb_vc_js_status 'true'
echo "Created Footer block: $FOOTER_ID"

# ==================
# MENUS
# ==================
echo "Setting up menus..."

# Create main menu
wp menu create "Main Menu"
wp menu item add-custom main-menu "/" "Home"
wp menu item add-custom main-menu "/shop" "Shop"
wp menu item add-post main-menu $ABOUT_ID
wp menu item add-post main-menu $CONTACT_ID
wp menu location assign main-menu primary

# ==================
# WIDGETS
# ==================
echo "Setting up widgets..."

wp widget reset shop-sidebar 2>/dev/null
wp widget add woocommerce_product_search shop-sidebar 0 --title=""
wp widget add woocommerce_product_categories shop-sidebar 1 --title="Categories" --count=1
wp widget add woocommerce_price_filter shop-sidebar 2 --title="Price"

# ==================
# CLEAR CACHES
# ==================
echo "Clearing caches..."
wp cache flush
wp transient delete --all
wp rewrite flush

echo ""
echo "Setup complete!"
echo "==============="
echo "About page ID: $ABOUT_ID"
echo "Contact page ID: $CONTACT_ID"
echo "Footer block ID: $FOOTER_ID"
```
