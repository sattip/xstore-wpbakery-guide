-- XStore Theme Options SQL Reference
-- =====================================
-- WARNING: Always backup before running these queries!
-- Use WP-CLI when possible as it handles serialization correctly.

-- ==========================================
-- GET CURRENT THEME OPTIONS
-- ==========================================

-- Get all theme mods (serialized)
SELECT option_value
FROM wp_options
WHERE option_name = 'theme_mods_xstore-child';

-- Get specific XStore options
SELECT option_name, option_value
FROM wp_options
WHERE option_name LIKE 'etheme%';

-- Get header builder settings
SELECT option_name, option_value
FROM wp_options
WHERE option_name LIKE '%header%builder%';

-- ==========================================
-- BACKUP THEME OPTIONS
-- ==========================================

-- Create backup table (run once)
CREATE TABLE IF NOT EXISTS wp_options_backup (
    option_id BIGINT(20) UNSIGNED AUTO_INCREMENT PRIMARY KEY,
    option_name VARCHAR(191) NOT NULL,
    option_value LONGTEXT NOT NULL,
    backup_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    UNIQUE KEY option_name_date (option_name, backup_date)
);

-- Backup current theme mods
INSERT INTO wp_options_backup (option_name, option_value)
SELECT option_name, option_value
FROM wp_options
WHERE option_name = 'theme_mods_xstore-child';

-- ==========================================
-- EXAMPLE: UPDATE SIMPLE OPTIONS
-- ==========================================
-- Note: For complex serialized data, use WP-CLI instead

-- Update site title (simple text)
UPDATE wp_options
SET option_value = 'Your Store Name'
WHERE option_name = 'blogname';

-- Update site tagline
UPDATE wp_options
SET option_value = 'Premium Beauty Products'
WHERE option_name = 'blogdescription';

-- ==========================================
-- WOOCOMMERCE SETTINGS
-- ==========================================

-- Get WooCommerce settings
SELECT option_name, option_value
FROM wp_options
WHERE option_name LIKE 'woocommerce%'
LIMIT 50;

-- Update products per page
UPDATE wp_options
SET option_value = '12'
WHERE option_name = 'woocommerce_catalog_rows';

-- ==========================================
-- STATIC BLOCKS
-- ==========================================

-- List all static blocks
SELECT ID, post_title, post_status, post_date
FROM wp_posts
WHERE post_type = 'staticblocks'
ORDER BY post_date DESC;

-- Get footer block content
SELECT post_content
FROM wp_posts
WHERE post_type = 'staticblocks'
AND post_title LIKE '%footer%';

-- ==========================================
-- WIDGET CONFIGURATION
-- ==========================================

-- Get sidebar widget assignments
SELECT option_value
FROM wp_options
WHERE option_name = 'sidebars_widgets';

-- Get specific widget type instances
SELECT option_value
FROM wp_options
WHERE option_name = 'widget_woocommerce_product_categories';

-- ==========================================
-- MENU CONFIGURATION
-- ==========================================

-- List all menus
SELECT t.term_id, t.name, t.slug
FROM wp_terms t
JOIN wp_term_taxonomy tt ON t.term_id = tt.term_id
WHERE tt.taxonomy = 'nav_menu';

-- Get menu locations
SELECT option_value
FROM wp_options
WHERE option_name = 'nav_menu_locations';

-- ==========================================
-- FIND PAGES WITH WPBAKERY CONTENT
-- ==========================================

-- Pages using WPBakery
SELECT p.ID, p.post_title, p.post_status
FROM wp_posts p
WHERE p.post_type = 'page'
AND p.post_content LIKE '%[vc_row%'
ORDER BY p.post_title;

-- Pages with custom CSS
SELECT p.ID, p.post_title, pm.meta_value as custom_css
FROM wp_posts p
JOIN wp_postmeta pm ON p.ID = pm.post_id
WHERE pm.meta_key = '_wpb_shortcodes_custom_css'
AND pm.meta_value != '';

-- ==========================================
-- PRODUCT QUERIES
-- ==========================================

-- Get featured products
SELECT p.ID, p.post_title
FROM wp_posts p
JOIN wp_postmeta pm ON p.ID = pm.post_id
WHERE p.post_type = 'product'
AND p.post_status = 'publish'
AND pm.meta_key = '_featured'
AND pm.meta_value = 'yes';

-- Get products on sale
SELECT p.ID, p.post_title,
       pm1.meta_value as regular_price,
       pm2.meta_value as sale_price
FROM wp_posts p
JOIN wp_postmeta pm1 ON p.ID = pm1.post_id AND pm1.meta_key = '_regular_price'
JOIN wp_postmeta pm2 ON p.ID = pm2.post_id AND pm2.meta_key = '_sale_price'
WHERE p.post_type = 'product'
AND p.post_status = 'publish'
AND pm2.meta_value != ''
AND pm2.meta_value IS NOT NULL;

-- ==========================================
-- USEFUL DIAGNOSTICS
-- ==========================================

-- Check database tables
SHOW TABLES LIKE 'wp_%';

-- Check options table size
SELECT COUNT(*) as total_options FROM wp_options;

-- Find large options (potential issues)
SELECT option_name, LENGTH(option_value) as size
FROM wp_options
ORDER BY LENGTH(option_value) DESC
LIMIT 20;

-- Check for transients (can be cleared)
SELECT COUNT(*) as transient_count
FROM wp_options
WHERE option_name LIKE '%transient%';
