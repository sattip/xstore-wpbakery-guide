---
name: wpbakery-static-block
description: Create reusable WPBakery static blocks for XStore theme. Use when creating footer blocks, mega menu content, sidebar banners, or any reusable content block.
allowed-tools: Read, Bash, Grep, Glob, Write
---

# WPBakery Static Block Creation

Create reusable static blocks (footer, mega menus, banners) for XStore theme.

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
    [vc_column_text]<a href="/shop">All Products</a>[/vc_column_text]
  [/vc_column]
  ...
[/vc_row]
```

### List Existing Blocks

```bash
wp post list --post_type=staticblocks --format=table --fields=ID,post_title,post_status
```

### Workflow

1. Ask user what type of static block they need (footer, menu, banner)
2. Reference examples or create custom content
3. Create the block via WP-CLI
4. Provide the block ID for use in theme settings or widgets
5. Blocks display via `etheme-static-block` widget using the ID
