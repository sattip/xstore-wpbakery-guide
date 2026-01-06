# XStore Demo Import Guide

How XStore theme demo content import works and how to use it.

## Important: Demo Content is Remote

XStore demo content is **NOT included in the theme ZIP file**. Demos are downloaded from 8theme.com servers during import. This requires:

1. **Valid license** - Theme must be activated with purchase code
2. **WordPress admin access** - Import runs through WP admin panel
3. **Server connectivity** - Must be able to reach 8theme.com

## Import URL Structure

Demos are fetched from:
```
https://www.8theme.com/import/xstore-demos/{version}/{engine}/{file}
```

Where:
- `{version}` - Demo version name (e.g., `home-beauty`, `home-fashion`)
- `{engine}` - Page builder (`wpb` for WPBakery, `elementor` for Elementor)
- `{file}` - Content file (pages.xml, widgets.json, etc.)

## What Gets Imported

| File | Content |
|------|---------|
| `pages.xml` | Pages with WPBakery/Elementor content |
| `static-blocks.xml` | Reusable static blocks |
| `products.xml` | WooCommerce products |
| `menu.xml` | Navigation menus |
| `widgets.json` | Widget configurations |
| `options.dat` | Theme customizer settings (serialized) |
| `slider.zip` | Revolution Slider templates |
| `fonts.json` | Custom fonts |
| `brands.json` | Product brands |

## Using the Built-in Import

### Via WordPress Admin

1. Go to **XStore > Import Demos**
2. Select a demo version
3. Choose what to import:
   - Pages
   - Products
   - Static Blocks
   - Menus
   - Widgets
   - Theme Options
   - Sliders
4. Click Import

### Import Order (Recommended)

1. **Media** - Images first
2. **Products** - If e-commerce demo
3. **Pages** - Main content
4. **Static Blocks** - Reusable elements
5. **Menu** - Navigation
6. **Widgets** - Sidebar content
7. **Theme Options** - Customizer settings
8. **Sliders** - Revolution sliders

## Manual Theme Options Export/Import

### Export Current Options
```bash
# Export theme_mods to JSON
wp option get theme_mods_xstore-child --format=json > theme-export.json

# Export all etheme options
wp option list --search="etheme*" --format=json > etheme-options.json
```

### Import Options
```bash
# Import theme_mods from JSON
wp option update theme_mods_xstore-child --format=json < theme-export.json
```

## Customizer Export/Import Plugin

XStore includes `customizer-export-import` functionality. To use it:

1. Go to **Appearance > Customize**
2. Find **Export/Import** section
3. Export creates `.dat` file (serialized options)
4. Import loads `.dat` file

### .dat File Format

The `options.dat` file is a serialized PHP array:
```php
// Structure
[
    'mods' => [
        'activecol' => '#ff7eb9',
        'sfont' => ['font-family' => 'Manrope', ...],
        // ... all theme_mods
    ],
    'options' => [
        // Other options
    ]
]
```

### Parse .dat File Manually
```php
<?php
$content = file_get_contents('options.dat');
$data = unserialize($content);
print_r($data['mods']); // Theme mods
?>
```

## Alternative: Copy from Working Site

If you have access to a working XStore site (like beautypin.gr), you can export its configuration:

### Export Theme Options
```bash
# On source site
wp option get theme_mods_xstore-child --format=json > theme-mods.json

# On target site
wp option update theme_mods_xstore-child --format=json < theme-mods.json
```

### Export Pages with WPBakery Content
```bash
# Export specific page
wp post get PAGE_ID --field=post_content > page-content.txt

# Create on target site
wp post create --post_type=page \
  --post_title="Page Name" \
  --post_content="$(cat page-content.txt)" \
  --post_status=publish
```

### Export Static Blocks
```bash
# List blocks
wp post list --post_type=staticblocks --format=table

# Export block content
wp post get BLOCK_ID --field=post_content > block-content.txt
```

### Export Widgets
```bash
# Export sidebar widgets
wp option get sidebars_widgets --format=json > sidebars.json

# Export widget instances
wp option get widget_woocommerce_product_categories --format=json > widget-cats.json
```

## Creating Your Own Import Package

If you want to create portable demo content:

### 1. Export Pages to XML
```bash
wp export --post_type=page --output=pages.xml
```

### 2. Export Products
```bash
wp export --post_type=product --output=products.xml
```

### 3. Export Static Blocks
```bash
wp export --post_type=staticblocks --output=static-blocks.xml
```

### 4. Export Theme Options
```bash
wp option get theme_mods_xstore-child --format=json > options.json
```

### 5. Export Widgets
```bash
# Create widgets.json manually with structure:
{
  "custom-sidebars": ["Custom Sidebar Name"],
  "sidebar-widgets": {
    "shop-sidebar": {
      "flush": true,
      "widgets": [
        {"widget": "woocommerce_product_search", "args": {"title": ""}},
        {"widget": "woocommerce_product_categories", "args": {"title": "Categories", "count": 1}}
      ]
    }
  }
}
```

## Import via WP-CLI

### Import XML Files
```bash
wp import pages.xml --authors=create
wp import products.xml --authors=create
wp import static-blocks.xml --authors=create
```

### Import Theme Options
```bash
# From JSON
wp option update theme_mods_xstore-child --format=json < options.json

# Individual options
wp option patch update theme_mods_xstore-child activecol '#ff7eb9'
```

## Troubleshooting

### Import Fails
- Check server memory limit (256MB+ recommended)
- Increase `max_execution_time` (300+ seconds)
- Verify license is activated
- Check internet connectivity to 8theme.com

### Images Missing
- Run media import first
- Check upload folder permissions
- Verify `wp-content/uploads` is writable

### Styles Not Applied
```bash
# Clear all caches
wp cache flush
wp transient delete --all

# Regenerate CSS
wp option delete wpb_js_compiled_css
```

### WPBakery Content Not Rendering
```bash
# Ensure meta is set
wp post meta update PAGE_ID _wpb_vc_js_status 'true'
```
