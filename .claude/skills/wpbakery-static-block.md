# WPBakery Static Block Creation

Create reusable static blocks (footer, mega menus, banners) for XStore theme.

## Usage
```
/wpbakery-static-block
```

## Instructions

When this skill is invoked, help the user create static blocks with WPBakery content.

### Reference Documentation
- Shortcodes: `WPBAKERY_SHORTCODES.md`
- Footer Template: `examples/footer-block.txt`

### What Are Static Blocks?

Static blocks are reusable WPBakery content pieces used for:
- **Footer content** - Site-wide footer with columns
- **Mega menu content** - Category dropdowns with images
- **Sidebar banners** - Promotional banners
- **Product tabs** - Custom tab content
- **Header elements** - Top bar content

### Create Static Block

```bash
# Create static block
BLOCK_ID=$(wp post create --post_type=staticblocks \
  --post_title="Block Name" \
  --post_name="block-slug" \
  --post_content='[vc_row]...[/vc_row]' \
  --post_status=publish \
  --porcelain)

# Set WPBakery meta
wp post meta update $BLOCK_ID _wpb_vc_js_status 'true'

echo "Created static block ID: $BLOCK_ID"
```

### Footer Block Template (5 columns)

```
[vc_row full_width="stretch_row" css=".vc_custom_TIMESTAMP{padding:40px !important;background-color:#f8cae2 !important;}"]
  [vc_column width="1/5"]
    [vc_single_image image="LOGO_ID" img_size="150x50" onclick="custom_link" link="/"]
    [follow facebook="URL" instagram="URL" size="small"]
  [/vc_column]
  [vc_column width="1/5"]
    [vc_custom_heading text="Shop" font_container="tag:h4|font_size:16px"]
    [vc_column_text]
      <a href="/shop">All Products</a><br>
      <a href="/sale">Sale</a>
    [/vc_column_text]
  [/vc_column]
  [vc_column width="1/5"]
    [vc_custom_heading text="Info" font_container="tag:h4|font_size:16px"]
    [vc_column_text]
      <a href="/about">About</a><br>
      <a href="/contact">Contact</a>
    [/vc_column_text]
  [/vc_column]
  [vc_column width="1/5"]
    [vc_custom_heading text="Policies" font_container="tag:h4|font_size:16px"]
    [vc_column_text]
      <a href="/terms">Terms</a><br>
      <a href="/privacy">Privacy</a>
    [/vc_column_text]
  [/vc_column]
  [vc_column width="1/5"]
    [vc_custom_heading text="Contact" font_container="tag:h4|font_size:16px"]
    [vc_column_text]
      Phone: +30 210 1234567<br>
      Email: info@store.gr
    [/vc_column_text]
  [/vc_column]
[/vc_row]
```

### Mega Menu Block Template

```
[vc_row gap="20"]
  [vc_column width="1/4"]
    [vc_custom_heading text="Category 1" font_container="tag:h4|font_size:16px|color:%23ff7eb9"]
    [vc_column_text]
      <a href="/category/sub1">Subcategory 1</a><br>
      <a href="/category/sub2">Subcategory 2</a>
    [/vc_column_text]
  [/vc_column]
  [vc_column width="1/4"]
    [vc_single_image image="PROMO_ID" img_size="full" onclick="custom_link" link="/sale"]
  [/vc_column]
[/vc_row]
```

### Shop Banner Block

```
[vc_row full_width="stretch_row" css=".vc_custom_TIMESTAMP{padding:30px !important;background-color:#FFF5F7 !important;}"]
  [vc_column width="2/3"]
    [vc_custom_heading text="Free Shipping on Orders Over 50€!" font_container="tag:h3|font_size:24px|color:%23ff7eb9"]
  [/vc_column]
  [vc_column width="1/3"]
    [vc_btn title="Shop Now" style="gradient-custom" gradient_custom_color_1="#ff7eb9" gradient_custom_color_2="#FF3C88" align="right"]
  [/vc_column]
[/vc_row]
```

### List Existing Blocks

```bash
wp post list --post_type=staticblocks --format=table --fields=ID,post_title,post_status
```

### Workflow

1. Ask user what type of static block they need (footer, menu, banner, etc.)
2. Reference examples or create custom content
3. Create the block via WP-CLI
4. Provide the block ID for use in theme settings or widgets
5. Blocks can be displayed via `etheme-static-block` widget using the ID
