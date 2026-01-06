# XStore Theme Options Configuration

Configure XStore theme options via WP-CLI commands.

## Usage
```
/xstore-theme-options
```

## Instructions

When this skill is invoked, help the user configure XStore theme options.

### Reference Documentation
Read the theme options reference from: `THEME_OPTIONS.md` in this repository.

### Common Tasks

1. **Set Brand Colors**
```bash
wp option patch update theme_mods_xstore-child activecol '#HEX_COLOR'
wp option patch update theme_mods_xstore-child light_buttons_bg '{"regular":"#HEX","hover":"#HEX"}'
wp option patch update theme_mods_xstore-child light_buttons_color '{"regular":"#ffffff","hover":"#ffffff"}'
```

2. **Set Typography**
```bash
wp option patch update theme_mods_xstore-child sfont '{"font-family":"FONT_NAME","font-size":"17px","line-height":"1.6"}'
wp option patch update theme_mods_xstore-child headings '{"font-family":"FONT_NAME","font-weight":700}'
```

3. **Set Layout**
```bash
wp option patch update theme_mods_xstore-child main_layout 'wide'
wp option patch update theme_mods_xstore-child site_width 1170
```

4. **Set WooCommerce Options**
```bash
wp option patch update theme_mods_xstore-child products_per_page 12
wp option patch update theme_mods_xstore-child grid_sidebar 'left'
wp option patch update theme_mods_xstore-child product_view 'default'
```

### Workflow

1. Ask the user what theme options they want to configure
2. Reference THEME_OPTIONS.md for available options and valid values
3. Generate the appropriate WP-CLI commands
4. Execute commands via SSH or provide them for manual execution
5. Remind user to clear cache after changes: `wp cache flush`

### Important Notes

- Always backup before changes: `wp db export backup.sql`
- Clear cache after changes: `wp cache flush && wp transient delete --all`
- Use JSON format for complex options (typography, colors with states)
- Colors in theme_mods use hex format: `#ff7eb9`
