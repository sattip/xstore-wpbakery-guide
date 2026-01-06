-- Create Pages with WPBakery Content
-- =====================================
-- WARNING: Always backup before running these queries!
-- Prefer WP-CLI for page creation when possible.

-- ==========================================
-- CREATE A NEW PAGE
-- ==========================================

-- Insert page
INSERT INTO wp_posts (
    post_author,
    post_date,
    post_date_gmt,
    post_content,
    post_title,
    post_excerpt,
    post_status,
    comment_status,
    ping_status,
    post_password,
    post_name,
    to_ping,
    pinged,
    post_modified,
    post_modified_gmt,
    post_content_filtered,
    post_parent,
    guid,
    menu_order,
    post_type,
    post_mime_type,
    comment_count
) VALUES (
    1,                              -- post_author (admin user ID)
    NOW(),                          -- post_date
    UTC_TIMESTAMP(),                -- post_date_gmt
    '[vc_row full_width="stretch_row" css=".vc_custom_1747813803140{padding-top: 60px !important;padding-bottom: 60px !important;background-color: #FFF5F7 !important;}"][vc_column][vc_custom_heading text="Page Title" font_container="tag:h1|font_size:42px|text_align:center|color:%23333333" use_theme_fonts="yes"][vc_column_text]Your content here[/vc_column_text][/vc_column][/vc_row]',  -- post_content
    'New Page Title',               -- post_title
    '',                             -- post_excerpt
    'publish',                      -- post_status (publish, draft, private)
    'closed',                       -- comment_status
    'closed',                       -- ping_status
    '',                             -- post_password
    'new-page-slug',                -- post_name (URL slug)
    '',                             -- to_ping
    '',                             -- pinged
    NOW(),                          -- post_modified
    UTC_TIMESTAMP(),                -- post_modified_gmt
    '',                             -- post_content_filtered
    0,                              -- post_parent
    '',                             -- guid (will be updated)
    0,                              -- menu_order
    'page',                         -- post_type
    '',                             -- post_mime_type
    0                               -- comment_count
);

-- Get the new page ID
SET @new_page_id = LAST_INSERT_ID();

-- Update GUID with proper URL
UPDATE wp_posts
SET guid = CONCAT('https://yoursite.com/?page_id=', @new_page_id)
WHERE ID = @new_page_id;

-- Add required WPBakery meta
INSERT INTO wp_postmeta (post_id, meta_key, meta_value)
VALUES
    (@new_page_id, '_wpb_vc_js_status', 'true'),
    (@new_page_id, '_wp_page_template', 'default'),
    (@new_page_id, '_wpb_shortcodes_custom_css', '.vc_custom_1747813803140{padding-top: 60px !important;padding-bottom: 60px !important;background-color: #FFF5F7 !important;}');

-- Verify creation
SELECT ID, post_title, post_name, post_status FROM wp_posts WHERE ID = @new_page_id;

-- ==========================================
-- CREATE STATIC BLOCK
-- ==========================================

INSERT INTO wp_posts (
    post_author,
    post_date,
    post_date_gmt,
    post_content,
    post_title,
    post_excerpt,
    post_status,
    comment_status,
    ping_status,
    post_name,
    post_modified,
    post_modified_gmt,
    post_parent,
    menu_order,
    post_type
) VALUES (
    1,
    NOW(),
    UTC_TIMESTAMP(),
    '[vc_row full_width="stretch_row" css=".vc_custom_1747813803700{padding-top: 40px !important;padding-bottom: 30px !important;background-color: #f8cae2 !important;}"][vc_column width="1/5"][vc_column_text]Footer content[/vc_column_text][/vc_column][/vc_row]',
    'Footer Block',
    '',
    'publish',
    'closed',
    'closed',
    'footer-block',
    NOW(),
    UTC_TIMESTAMP(),
    0,
    0,
    'staticblocks'
);

SET @new_block_id = LAST_INSERT_ID();

-- Add WPBakery meta for static block
INSERT INTO wp_postmeta (post_id, meta_key, meta_value)
VALUES (@new_block_id, '_wpb_vc_js_status', 'true');

-- ==========================================
-- UPDATE EXISTING PAGE CONTENT
-- ==========================================

-- Update page content
UPDATE wp_posts
SET post_content = '[vc_row][vc_column][vc_column_text]Updated content[/vc_column_text][/vc_column][/vc_row]',
    post_modified = NOW(),
    post_modified_gmt = UTC_TIMESTAMP()
WHERE ID = 123;  -- Replace with actual page ID

-- Update page meta (CSS)
UPDATE wp_postmeta
SET meta_value = '.vc_custom_1747813803140{padding:60px !important;}'
WHERE post_id = 123
AND meta_key = '_wpb_shortcodes_custom_css';

-- ==========================================
-- CREATE MULTIPLE PAGES (BATCH)
-- ==========================================

-- Create About page
INSERT INTO wp_posts (post_author, post_date, post_date_gmt, post_content, post_title, post_status, comment_status, ping_status, post_name, post_modified, post_modified_gmt, post_type)
VALUES (1, NOW(), UTC_TIMESTAMP(), '[vc_row][vc_column][vc_custom_heading text="About Us"][/vc_column][/vc_row]', 'About Us', 'publish', 'closed', 'closed', 'about', NOW(), UTC_TIMESTAMP(), 'page');
SET @about_id = LAST_INSERT_ID();
INSERT INTO wp_postmeta (post_id, meta_key, meta_value) VALUES (@about_id, '_wpb_vc_js_status', 'true');

-- Create Contact page
INSERT INTO wp_posts (post_author, post_date, post_date_gmt, post_content, post_title, post_status, comment_status, ping_status, post_name, post_modified, post_modified_gmt, post_type)
VALUES (1, NOW(), UTC_TIMESTAMP(), '[vc_row][vc_column][vc_custom_heading text="Contact Us"][/vc_column][/vc_row]', 'Contact', 'publish', 'closed', 'closed', 'contact', NOW(), UTC_TIMESTAMP(), 'page');
SET @contact_id = LAST_INSERT_ID();
INSERT INTO wp_postmeta (post_id, meta_key, meta_value) VALUES (@contact_id, '_wpb_vc_js_status', 'true');

-- Create FAQ page
INSERT INTO wp_posts (post_author, post_date, post_date_gmt, post_content, post_title, post_status, comment_status, ping_status, post_name, post_modified, post_modified_gmt, post_type)
VALUES (1, NOW(), UTC_TIMESTAMP(), '[vc_row][vc_column][vc_custom_heading text="FAQ"][/vc_column][/vc_row]', 'FAQ', 'publish', 'closed', 'closed', 'faq', NOW(), UTC_TIMESTAMP(), 'page');
SET @faq_id = LAST_INSERT_ID();
INSERT INTO wp_postmeta (post_id, meta_key, meta_value) VALUES (@faq_id, '_wpb_vc_js_status', 'true');

-- Create Terms page
INSERT INTO wp_posts (post_author, post_date, post_date_gmt, post_content, post_title, post_status, comment_status, ping_status, post_name, post_modified, post_modified_gmt, post_type)
VALUES (1, NOW(), UTC_TIMESTAMP(), '[vc_row][vc_column][vc_custom_heading text="Terms & Conditions"][/vc_column][/vc_row]', 'Terms & Conditions', 'publish', 'closed', 'closed', 'terms', NOW(), UTC_TIMESTAMP(), 'page');
SET @terms_id = LAST_INSERT_ID();
INSERT INTO wp_postmeta (post_id, meta_key, meta_value) VALUES (@terms_id, '_wpb_vc_js_status', 'true');

-- Create Privacy page
INSERT INTO wp_posts (post_author, post_date, post_date_gmt, post_content, post_title, post_status, comment_status, ping_status, post_name, post_modified, post_modified_gmt, post_type)
VALUES (1, NOW(), UTC_TIMESTAMP(), '[vc_row][vc_column][vc_custom_heading text="Privacy Policy"][/vc_column][/vc_row]', 'Privacy Policy', 'publish', 'closed', 'closed', 'privacy', NOW(), UTC_TIMESTAMP(), 'page');
SET @privacy_id = LAST_INSERT_ID();
INSERT INTO wp_postmeta (post_id, meta_key, meta_value) VALUES (@privacy_id, '_wpb_vc_js_status', 'true');

-- Output created page IDs
SELECT 'Created pages:' as message;
SELECT @about_id as about_page, @contact_id as contact_page, @faq_id as faq_page, @terms_id as terms_page, @privacy_id as privacy_page;

-- ==========================================
-- DELETE PAGE (CAREFUL!)
-- ==========================================

-- Move to trash
UPDATE wp_posts
SET post_status = 'trash'
WHERE ID = 123;

-- Permanently delete (use with caution!)
-- DELETE FROM wp_postmeta WHERE post_id = 123;
-- DELETE FROM wp_posts WHERE ID = 123;

-- ==========================================
-- USEFUL QUERIES
-- ==========================================

-- Find pages by slug
SELECT ID, post_title, post_status
FROM wp_posts
WHERE post_type = 'page'
AND post_name = 'about';

-- List all published pages
SELECT ID, post_title, post_name
FROM wp_posts
WHERE post_type = 'page'
AND post_status = 'publish'
ORDER BY post_title;

-- Find pages with specific shortcode
SELECT ID, post_title
FROM wp_posts
WHERE post_type = 'page'
AND post_content LIKE '%[contact-form-7%';

-- Get page with all meta
SELECT p.ID, p.post_title, pm.meta_key, pm.meta_value
FROM wp_posts p
LEFT JOIN wp_postmeta pm ON p.ID = pm.post_id
WHERE p.ID = 123;
