# WPBakery Page Creation

Create WordPress pages with WPBakery content via database operations.

## Usage
```
/wpbakery-page
```

## Instructions

When this skill is invoked, help the user create pages with WPBakery shortcode content.

### Reference Documentation
- Shortcodes: `WPBAKERY_SHORTCODES.md`
- Templates: `PAGE_TEMPLATES.md`
- Examples: `examples/` directory

### Page Creation Command

```bash
# Create page
PAGE_ID=$(wp post create --post_type=page \
  --post_title="Page Title" \
  --post_name="page-slug" \
  --post_content='[vc_row]...[/vc_row]' \
  --post_status=publish \
  --porcelain)

# Set required WPBakery meta
wp post meta update $PAGE_ID _wpb_vc_js_status 'true'

# Set compiled CSS (extract from shortcode css attributes)
wp post meta update $PAGE_ID _wpb_shortcodes_custom_css 'CSS_HERE'
```

### Shortcode Structure

```
[vc_row full_width="stretch_row" css=".vc_custom_TIMESTAMP{...}"]
  [vc_column width="1/2" offset="vc_col-lg-6 vc_col-md-12"]
    [vc_custom_heading text="Title" font_container="tag:h1|font_size:42px|text_align:center|color:%23333333"]
    [vc_column_text css="..."]Content here[/vc_column_text]
    [vc_btn title="Button" style="gradient-custom" gradient_custom_color_1="#ff7eb9" gradient_custom_color_2="#FF3C88"]
  [/vc_column]
[/vc_row]
```

### Available Templates
- Homepage - `examples/homepage.txt`
- Contact Page - `examples/contact-page.txt`
- About Page - `examples/about-page.txt`

### Workflow

1. Ask user what type of page they want to create
2. Reference PAGE_TEMPLATES.md for ready-made templates
3. Customize content, colors, and images as needed
4. Generate unique CSS timestamps for each element
5. Create the page via WP-CLI
6. Set required post meta (_wpb_vc_js_status, _wpb_shortcodes_custom_css)
7. Verify creation with `wp post get PAGE_ID`

### CSS Timestamp Generation
Generate unique timestamps for CSS classes:
- Format: `.vc_custom_TIMESTAMP{properties}`
- Use current Unix timestamp or sequential numbers
- Each element needs a unique timestamp

### Important Notes

- Colors in font_container use URL encoding: `%23ff7eb9` = `#ff7eb9`
- Links use URL encoding: `url:%2Fshop` = `url:/shop`
- Always set `_wpb_vc_js_status` to `true` for WPBakery to recognize the page
- Compile all CSS from shortcodes into `_wpb_shortcodes_custom_css` meta
