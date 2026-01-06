# XStore Database Operations

Direct database operations for XStore/WPBakery via WP-CLI and SQL.

## Usage
```
/xstore-database
```

## Instructions

When this skill is invoked, help the user perform database operations for XStore theme.

### Reference Documentation
Read the database reference from: `DATABASE_OPERATIONS.md` in this repository.

### Backup Commands (ALWAYS RUN FIRST)

```bash
# Full database backup
wp db export backup-$(date +%Y%m%d-%H%M%S).sql

# Backup theme options only
wp option get theme_mods_xstore-child --format=json > theme-backup.json
```

### Common Operations

**Get theme options:**
```bash
wp option get theme_mods_xstore-child --format=json
wp option pluck theme_mods_xstore-child activecol
```

**Set theme options:**
```bash
wp option patch update theme_mods_xstore-child KEY 'VALUE'
```

**Create page:**
```bash
wp post create --post_type=page \
  --post_title="Title" \
  --post_content='[vc_row]...[/vc_row]' \
  --post_status=publish \
  --porcelain
```

**Update page:**
```bash
wp post update PAGE_ID --post_content='NEW_CONTENT'
```

**Set page meta:**
```bash
wp post meta update PAGE_ID _wpb_vc_js_status 'true'
wp post meta update PAGE_ID _wpb_shortcodes_custom_css 'CSS'
```

**Create static block:**
```bash
wp post create --post_type=staticblocks \
  --post_title="Block Name" \
  --post_content='[vc_row]...[/vc_row]' \
  --post_status=publish
```

### Cache Management

```bash
# Clear all caches (run after any changes)
wp cache flush && wp transient delete --all && wp rewrite flush
```

### Search and Replace

```bash
# Preview changes
wp search-replace 'old-text' 'new-text' --dry-run

# Execute replacement
wp search-replace 'old-text' 'new-text'

# Replace in specific table
wp search-replace 'old' 'new' wp_posts
```

### Useful Queries

**Find pages with WPBakery:**
```bash
wp post list --post_type=page --format=table | head -20
wp db query "SELECT ID, post_title FROM wp_posts WHERE post_type='page' AND post_content LIKE '%[vc_row%'"
```

**List static blocks:**
```bash
wp post list --post_type=staticblocks --format=table
```

**Get page content:**
```bash
wp post get PAGE_ID --field=post_content
```

**List all options:**
```bash
wp option list --search="*etheme*" --format=table
wp option list --search="*xstore*" --format=table
```

### Bulk Operations

**Update all pages with WPBakery meta:**
```bash
wp post list --post_type=page --format=ids | xargs -I {} wp post meta update {} _wpb_vc_js_status 'true'
```

**Export all pages:**
```bash
wp post list --post_type=page --format=json > pages-export.json
```

### Workflow

1. ALWAYS backup first: `wp db export backup.sql`
2. Perform the requested operation
3. Clear caches: `wp cache flush`
4. Verify the changes
5. Provide rollback instructions if needed

### Important Safety Notes

- Never run destructive commands without backup
- Use `--dry-run` when available to preview changes
- Clear cache after any database changes
- For serialized data (theme_mods), use WP-CLI not raw SQL
