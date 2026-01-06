# XStore Theme + WPBakery Guide for Claude Code

## Overview

This documentation provides comprehensive instructions for Claude Code to configure XStore theme and create WPBakery pages via WordPress database operations. Based on analysis of beautypin.gr reference implementation.

## Quick Reference

### Theme Stack
- **Theme**: XStore (8theme)
- **Page Builder**: WPBakery (Visual Composer)
- **E-commerce**: WooCommerce
- **Database**: MySQL with configurable table prefix

### Key Database Tables
| Table | Purpose |
|-------|---------|
| `wp_options` | Theme settings (`theme_mods_xstore-child`) |
| `wp_posts` | Pages, products, static blocks |
| `wp_postmeta` | Page settings, WPBakery CSS |
| `wp_terms` / `wp_term_taxonomy` | Categories, tags, brands |

## File Structure

```
xstore-wpbakery-guide/
├── README.md                    # This file
├── THEME_OPTIONS.md             # Complete theme customizer reference
├── WPBAKERY_SHORTCODES.md       # WPBakery shortcode syntax
├── PAGE_TEMPLATES.md            # Ready-to-use page templates
├── WIDGETS.md                   # Widget configuration guide
├── DATABASE_OPERATIONS.md       # WP-CLI commands and SQL
├── examples/
│   ├── homepage.txt             # Homepage WPBakery content
│   ├── contact-page.txt         # Contact page template
│   ├── footer-block.txt         # Footer static block
│   └── about-page.txt           # About page template
└── sql/
    ├── theme-options.sql        # Theme configuration SQL
    └── create-page.sql          # Page creation SQL
```

## Usage Instructions for Claude Code

### Setting Theme Options

```bash
# Set single option
wp option patch update theme_mods_xstore-child activecol '#ff7eb9'

# Set multiple options from JSON
wp option update theme_mods_xstore-child --format=json < theme-config.json
```

### Creating Pages with WPBakery Content

```bash
# Create page
wp post create --post_type=page \
  --post_title="Page Title" \
  --post_content='[vc_row]...[/vc_row]' \
  --post_status=publish

# Set required meta
wp post meta update <ID> _wpb_vc_js_status true
wp post meta update <ID> _wpb_shortcodes_custom_css '<CSS_HERE>'
```

### Creating Static Blocks

```bash
# Create static block for footer/header/widgets
wp post create --post_type=staticblocks \
  --post_title="Footer Block" \
  --post_content='[vc_row]...[/vc_row]' \
  --post_status=publish
```

## Brand Colors (beautypin.gr Reference)

| Color | Hex | Usage |
|-------|-----|-------|
| Primary Pink | `#ff7eb9` | Main buttons, links, accents |
| Pink Hover | `#ff65a3` | Button hover states |
| Dark Pink | `#FF3C88` | Strong accents |
| Light Pink BG | `#FFF5F7` | Backgrounds, sections |
| Breadcrumb Pink | `#f8cae2` | Breadcrumb area |
| Active BG | `#fff3f7` | Active states |

## Typography (beautypin.gr Reference)

| Element | Font | Weight | Size |
|---------|------|--------|------|
| Body | Manrope-Regular | 400 | 17px |
| Headings | Manrope-SemiBold | 700 | varies |
| Menu | Inter | 300 | varies |

## Important Notes

1. **Always backup** before making database changes
2. **Clear caches** after theme option changes: `wp cache flush`
3. **Regenerate CSS** if WPBakery styles don't apply
4. **Test on staging** before production changes

## Related Documentation

- [THEME_OPTIONS.md](./THEME_OPTIONS.md) - Full theme options reference
- [WPBAKERY_SHORTCODES.md](./WPBAKERY_SHORTCODES.md) - Shortcode syntax
- [PAGE_TEMPLATES.md](./PAGE_TEMPLATES.md) - Copy-paste templates
- [WIDGETS.md](./WIDGETS.md) - Widget configuration
- [DATABASE_OPERATIONS.md](./DATABASE_OPERATIONS.md) - WP-CLI & SQL
