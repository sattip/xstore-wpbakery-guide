# WPBakery Shortcodes Reference

Complete reference for WPBakery (Visual Composer) shortcodes used with XStore theme.

## Table of Contents
1. [Container Elements](#container-elements)
2. [Content Elements](#content-elements)
3. [Media Elements](#media-elements)
4. [Interactive Elements](#interactive-elements)
5. [XStore Custom Elements](#xstore-custom-elements)
6. [CSS Styling](#css-styling)
7. [Column Widths](#column-widths)
8. [Responsive Classes](#responsive-classes)

---

## Container Elements

### vc_row
Main row container for page sections.

```
[vc_row full_width="stretch_row" content_placement="middle" css=".vc_custom_TIMESTAMP{...}"]
  ...content...
[/vc_row]
```

| Attribute | Values | Description |
|-----------|--------|-------------|
| `full_width` | `stretch_row`, `stretch_row_content`, `stretch_row_content_no_spaces` | Row width behavior |
| `content_placement` | `top`, `middle`, `bottom` | Vertical alignment |
| `gap` | number | Gap between columns |
| `columns_placement` | `top`, `middle`, `bottom` | Column vertical alignment |
| `equal_height` | `yes` | Equal height columns |
| `css` | `.vc_custom_TIMESTAMP{...}` | Custom CSS styling |
| `el_class` | string | Additional CSS class |
| `el_id` | string | Element ID |
| `disable_element` | `yes` | Hide element |

**Full Width Options:**
- `stretch_row` - Stretch row and content
- `stretch_row_content` - Stretch row only
- `stretch_row_content_no_spaces` - Stretch with no padding

### vc_column
Column container within a row.

```
[vc_column width="1/2" offset="vc_col-lg-6 vc_col-md-12" css=".vc_custom_TIMESTAMP{...}"]
  ...content...
[/vc_column]
```

| Attribute | Values | Description |
|-----------|--------|-------------|
| `width` | `1/1`, `1/2`, `1/3`, `2/3`, `1/4`, `3/4`, `1/6`, `5/6` | Column width fraction |
| `offset` | `vc_col-lg-X vc_col-md-X vc_col-sm-X` | Responsive width overrides |
| `css` | `.vc_custom_TIMESTAMP{...}` | Custom CSS styling |
| `el_class` | string | Additional CSS class |

### vc_row_inner
Nested row within a column.

```
[vc_row_inner]
  [vc_column_inner width="1/2"]
    ...content...
  [/vc_column_inner]
[/vc_row_inner]
```

### vc_column_inner
Nested column within an inner row.

```
[vc_column_inner width="1/3" css=".vc_custom_TIMESTAMP{...}"]
  ...content...
[/vc_column_inner]
```

---

## Content Elements

### vc_column_text
Rich text content with HTML support.

```
[vc_column_text css=".vc_custom_TIMESTAMP{...}"]
<p>Your HTML content here</p>
<ul>
  <li>List item</li>
</ul>
[/vc_column_text]
```

| Attribute | Values | Description |
|-----------|--------|-------------|
| `css` | `.vc_custom_TIMESTAMP{...}` | Custom CSS styling |
| `el_class` | string | Additional CSS class |

### vc_custom_heading
Styled heading element.

```
[vc_custom_heading text="Your Heading" font_container="tag:h2|font_size:24px|text_align:center|color:%23ff7eb9" use_theme_fonts="yes" css=".vc_custom_TIMESTAMP{...}"]
```

| Attribute | Values | Description |
|-----------|--------|-------------|
| `text` | string | Heading text |
| `font_container` | `tag:h1-h6\|font_size:Xpx\|text_align:left/center/right\|color:%23HEX` | Font settings (URL encoded) |
| `use_theme_fonts` | `yes` | Use theme typography |
| `google_fonts` | font specification | Custom Google font |
| `css` | `.vc_custom_TIMESTAMP{...}` | Custom CSS styling |
| `link` | `url:URL\|title:TITLE\|target:_blank` | Link settings |
| `el_class` | string | Additional CSS class |

**Font Container Format:**
```
font_container="tag:h2|font_size:18px|text_align:left|color:%23ff7eb9|line_height:1.5"
```
Note: Colors use URL-encoded hex (`%23` = `#`)

### vc_separator
Horizontal line separator.

```
[vc_separator color="custom" accent_color="#ff7eb9" style="dashed" border_width="2"]
```

| Attribute | Values | Description |
|-----------|--------|-------------|
| `color` | `grey`, `custom` | Color type |
| `accent_color` | `#HEX` | Custom color |
| `style` | `solid`, `dashed`, `dotted`, `double` | Line style |
| `border_width` | number | Line thickness in px |
| `el_width` | `10`, `20`, `30`, `40`, `50`, `60`, `70`, `80`, `90`, `100` | Width percentage |
| `align` | `align_left`, `align_center`, `align_right` | Alignment |

### vc_empty_space
Vertical spacing element.

```
[vc_empty_space height="30px"]
```

| Attribute | Values | Description |
|-----------|--------|-------------|
| `height` | `Xpx` | Space height |
| `el_class` | string | Additional CSS class |

### vc_raw_html
Raw HTML content (base64 encoded).

```
[vc_raw_html]BASE64_ENCODED_HTML[/vc_raw_html]
```

---

## Media Elements

### vc_single_image
Single image with optional link.

```
[vc_single_image image="IMAGE_ID" img_size="full" alignment="center" onclick="custom_link" link="https://example.com" css=".vc_custom_TIMESTAMP{...}"]
```

| Attribute | Values | Description |
|-----------|--------|-------------|
| `image` | number | WordPress media library image ID |
| `img_size` | `full`, `large`, `medium`, `thumbnail`, `WxH` | Image size |
| `alignment` | `left`, `center`, `right` | Image alignment |
| `style` | `vc_box_border`, `vc_box_shadow`, `vc_box_rounded` | Border style |
| `onclick` | `img_link_large`, `link_image`, `custom_link`, `zoom` | Click action |
| `link` | URL | Custom link URL |
| `css` | `.vc_custom_TIMESTAMP{...}` | Custom CSS styling |
| `el_class` | string | Additional CSS class |

### vc_gallery
Image gallery/slider.

```
[vc_gallery type="image_grid" images="ID1,ID2,ID3" img_size="medium" columns="3"]
```

| Attribute | Values | Description |
|-----------|--------|-------------|
| `type` | `image_grid`, `flexslider_fade`, `flexslider_slide`, `nivo` | Gallery type |
| `images` | comma-separated IDs | Image IDs from media library |
| `img_size` | size name or `WxH` | Image dimensions |
| `columns` | `1`-`6` | Grid columns |
| `onclick` | `link_image`, `custom_link`, `link_no` | Click behavior |

### vc_video
Embedded video.

```
[vc_video link="https://www.youtube.com/watch?v=VIDEO_ID" align="center"]
```

| Attribute | Values | Description |
|-----------|--------|-------------|
| `link` | URL | YouTube/Vimeo URL |
| `align` | `left`, `center`, `right` | Video alignment |
| `el_width` | percentage | Video width |
| `el_aspect` | `16-9`, `4-3`, `1-1` | Aspect ratio |

---

## Interactive Elements

### vc_btn
Button element with multiple styles.

```
[vc_btn title="Click Here" style="gradient-custom" gradient_custom_color_1="#ff7eb9" gradient_custom_color_2="#FF3C88" shape="round" size="lg" align="center" link="url:https%3A%2F%2Fexample.com|title:Button|target:_blank"]
```

| Attribute | Values | Description |
|-----------|--------|-------------|
| `title` | string | Button text |
| `style` | `modern`, `classic`, `flat`, `outline`, `3d`, `custom`, `gradient`, `gradient-custom` | Button style |
| `gradient_custom_color_1` | `#HEX` | Gradient start color |
| `gradient_custom_color_2` | `#HEX` | Gradient end color |
| `color` | `blue`, `turquoise`, `pink`, `violet`, `peacoc`, `chino`, `mulled-wine`, `vista-blue`, `black`, `grey`, `orange`, `sky`, `green`, `juicy-pink`, `sandy-brown`, `purple`, `white` | Preset color |
| `shape` | `square`, `rounded`, `round` | Button shape |
| `size` | `xs`, `sm`, `md`, `lg` | Button size |
| `align` | `left`, `center`, `right`, `inline` | Button alignment |
| `link` | `url:URL\|title:TITLE\|target:_blank` | Link settings (URL encoded) |
| `i_icon_fontawesome` | `fa fa-icon-name` | FontAwesome icon |
| `add_icon` | `true` | Enable icon |
| `i_position` | `left`, `right` | Icon position |
| `css` | `.vc_custom_TIMESTAMP{...}` | Custom CSS styling |

**Link Format:**
```
link="url:https%3A%2F%2Fexample.com%2Fpage|title:Button%20Text|target:_blank"
```

### vc_accordion
Accordion/collapsible content.

```
[vc_accordion active_tab="1" collapsible_all="true"]
  [vc_accordion_tab title="Section 1"]
    Content here
  [/vc_accordion_tab]
  [vc_accordion_tab title="Section 2"]
    Content here
  [/vc_accordion_tab]
[/vc_accordion]
```

### vc_tta_tabs
Tabbed content.

```
[vc_tta_tabs style="modern" color="pink" active_section="1"]
  [vc_tta_section title="Tab 1" tab_id="tab-1"]
    Content here
  [/vc_tta_section]
  [vc_tta_section title="Tab 2" tab_id="tab-2"]
    Content here
  [/vc_tta_section]
[/vc_tta_tabs]
```

### contact-form-7
Contact Form 7 integration.

```
[contact-form-7 id="FORM_ID" title="Contact Form"]
```

| Attribute | Values | Description |
|-----------|--------|-------------|
| `id` | number | Form post ID |
| `title` | string | Form title |

---

## XStore Custom Elements

### etheme_products
XStore product grid display.

```
[etheme_products ids="1,2,3" limit="8" columns="4" orderby="date" order="DESC"]
```

| Attribute | Values | Description |
|-----------|--------|-------------|
| `ids` | comma-separated IDs | Specific product IDs |
| `skus` | comma-separated SKUs | Product SKUs |
| `limit` | number | Number of products |
| `columns` | `1`-`6` | Grid columns |
| `orderby` | `date`, `title`, `price`, `rand`, `popularity`, `rating`, `menu_order` | Sort field |
| `order` | `ASC`, `DESC` | Sort direction |
| `category` | slug | Category filter |
| `on_sale` | `true` | Show only sale items |
| `best_selling` | `true` | Show best sellers |
| `top_rated` | `true` | Show top rated |

### etheme_carousel
XStore carousel slider.

```
[etheme_carousel slides_per_view="4" autoplay="true" loop="true"]
  ...slides content...
[/etheme_carousel]
```

| Attribute | Values | Description |
|-----------|--------|-------------|
| `slides_per_view` | number | Visible slides |
| `autoplay` | `true`, `false` | Auto advance |
| `loop` | `true`, `false` | Infinite loop |
| `navigation` | `true`, `false` | Show arrows |
| `pagination` | `true`, `false` | Show dots |
| `speed` | number | Transition speed (ms) |
| `space_between` | number | Gap between slides |

### follow
Social media follow icons.

```
[follow facebook="URL" instagram="URL" size="normal" tooltip="true"]
```

| Attribute | Values | Description |
|-----------|--------|-------------|
| `facebook` | URL | Facebook page URL |
| `instagram` | URL | Instagram profile URL |
| `twitter` | URL | Twitter profile URL |
| `youtube` | URL | YouTube channel URL |
| `pinterest` | URL | Pinterest profile URL |
| `linkedin` | URL | LinkedIn profile URL |
| `tiktok` | URL | TikTok profile URL |
| `size` | `small`, `normal`, `large` | Icon size |
| `tooltip` | `true`, `false` | Show tooltips |
| `target` | `_blank`, `_self` | Link target |

### countdown
Countdown timer.

```
[countdown date="2025-12-31 23:59:59" style="1"]
```

| Attribute | Values | Description |
|-----------|--------|-------------|
| `date` | `YYYY-MM-DD HH:MM:SS` | Target date/time |
| `style` | `1`, `2`, `3` | Display style |
| `scheme` | `dark`, `light` | Color scheme |

### etheme_slider
Revolution Slider integration.

```
[etheme_slider alias="slider-alias"]
```

### etheme_banner
Promotional banner.

```
[etheme_banner image="IMAGE_ID" link="URL" hover="zoom" align="center"]
```

---

## CSS Styling

### Custom CSS Pattern
WPBakery generates timestamped CSS classes:

```
css=".vc_custom_1747813803140{padding-top: 20px !important;padding-bottom: 20px !important;background-color: #FFF5F7 !important;}"
```

**Structure:**
- `.vc_custom_TIMESTAMP` - Unique class name
- Properties use `!important` for specificity
- Common properties: `margin-*`, `padding-*`, `background-color`, `background-image`, `border-*`

### Common CSS Properties

```css
/* Padding */
padding-top: 20px !important;
padding-right: 15px !important;
padding-bottom: 20px !important;
padding-left: 15px !important;

/* Margin */
margin-top: 30px !important;
margin-bottom: 30px !important;

/* Background */
background-color: #FFF5F7 !important;
background-image: url(IMAGE_URL) !important;
background-position: center !important;
background-repeat: no-repeat !important;
background-size: cover !important;

/* Border */
border-top-width: 1px !important;
border-right-width: 1px !important;
border-bottom-width: 1px !important;
border-left-width: 1px !important;
border-color: #ff7eb9 !important;
border-style: solid !important;
border-radius: 10px !important;
```

### _wpb_shortcodes_custom_css Meta
All page CSS is compiled into the `_wpb_shortcodes_custom_css` post meta:

```css
.vc_custom_1747813803140{padding-top: 20px !important;background-color: #FFF5F7 !important;}
.vc_custom_1747813803141{margin-bottom: 30px !important;}
```

---

## Column Widths

### Fraction System

| Fraction | Percentage | Use Case |
|----------|------------|----------|
| `1/1` | 100% | Full width |
| `1/2` | 50% | Two equal columns |
| `1/3` | 33.33% | Three equal columns |
| `2/3` | 66.66% | Wide + narrow |
| `1/4` | 25% | Four columns |
| `3/4` | 75% | Main + sidebar |
| `1/6` | 16.66% | Six columns |
| `5/6` | 83.33% | Very wide + narrow |
| `1/12` | 8.33% | Twelve column grid |

### Width Examples

**Two Equal Columns:**
```
[vc_row]
  [vc_column width="1/2"]Content 1[/vc_column]
  [vc_column width="1/2"]Content 2[/vc_column]
[/vc_row]
```

**Three Columns:**
```
[vc_row]
  [vc_column width="1/3"]Content 1[/vc_column]
  [vc_column width="1/3"]Content 2[/vc_column]
  [vc_column width="1/3"]Content 3[/vc_column]
[/vc_row]
```

**Sidebar Layout:**
```
[vc_row]
  [vc_column width="3/4"]Main content[/vc_column]
  [vc_column width="1/4"]Sidebar[/vc_column]
[/vc_row]
```

**Five Columns (Footer Pattern):**
```
[vc_row]
  [vc_column width="1/5"]Col 1[/vc_column]
  [vc_column width="1/5"]Col 2[/vc_column]
  [vc_column width="1/5"]Col 3[/vc_column]
  [vc_column width="1/5"]Col 4[/vc_column]
  [vc_column width="1/5"]Col 5[/vc_column]
[/vc_row]
```

---

## Responsive Classes

### Offset System
Override column widths at different breakpoints:

```
offset="vc_col-lg-6 vc_col-md-8 vc_col-sm-12"
```

| Class | Breakpoint | Screen Width |
|-------|------------|--------------|
| `vc_col-lg-X` | Desktop | >= 992px |
| `vc_col-md-X` | Tablet | >= 768px |
| `vc_col-sm-X` | Mobile landscape | >= 576px |
| `vc_col-xs-X` | Mobile portrait | < 576px |

### Visibility Classes
Hide elements at specific breakpoints:

| Class | Effect |
|-------|--------|
| `vc_hidden-lg` | Hidden on desktop |
| `vc_hidden-md` | Hidden on tablet |
| `vc_hidden-sm` | Hidden on mobile landscape |
| `vc_hidden-xs` | Hidden on mobile portrait |

**Example:**
```
[vc_column width="1/2" offset="vc_col-md-12 vc_hidden-sm vc_hidden-xs"]
  Desktop/Tablet only content
[/vc_column]
```

---

## Complete Page Example

```
[vc_row full_width="stretch_row" css=".vc_custom_1747813803140{padding-top: 60px !important;padding-bottom: 60px !important;background-color: #FFF5F7 !important;}"]
  [vc_column width="1/2" offset="vc_col-lg-6 vc_col-md-12"]
    [vc_custom_heading text="Welcome to Our Store" font_container="tag:h1|font_size:42px|text_align:left|color:%23333333" use_theme_fonts="yes"]
    [vc_column_text css=".vc_custom_1747813803141{margin-bottom: 30px !important;}"]
      <p>Discover our amazing collection of products.</p>
    [/vc_column_text]
    [vc_btn title="Shop Now" style="gradient-custom" gradient_custom_color_1="#ff7eb9" gradient_custom_color_2="#FF3C88" shape="round" size="lg" link="url:%2Fshop|title:Shop|target:_self"]
  [/vc_column]
  [vc_column width="1/2" offset="vc_col-lg-6 vc_col-md-12"]
    [vc_single_image image="123" img_size="full" alignment="center"]
  [/vc_column]
[/vc_row]

[vc_row]
  [vc_column]
    [vc_custom_heading text="Featured Products" font_container="tag:h2|font_size:32px|text_align:center" use_theme_fonts="yes" css=".vc_custom_1747813803142{margin-bottom: 40px !important;}"]
    [etheme_products limit="8" columns="4" orderby="popularity" order="DESC"]
  [/vc_column]
[/vc_row]

[vc_row full_width="stretch_row" css=".vc_custom_1747813803143{background-color: #f8cae2 !important;padding-top: 40px !important;padding-bottom: 40px !important;}"]
  [vc_column width="1/3"]
    [vc_custom_heading text="Free Shipping" font_container="tag:h3|font_size:20px|text_align:center"]
    [vc_column_text css=".vc_custom_1747813803144{text-align: center;}"]On orders over 50 EUR[/vc_column_text]
  [/vc_column]
  [vc_column width="1/3"]
    [vc_custom_heading text="Secure Payment" font_container="tag:h3|font_size:20px|text_align:center"]
    [vc_column_text css=".vc_custom_1747813803145{text-align: center;}"]100% secure checkout[/vc_column_text]
  [/vc_column]
  [vc_column width="1/3"]
    [vc_custom_heading text="24/7 Support" font_container="tag:h3|font_size:20px|text_align:center"]
    [vc_column_text css=".vc_custom_1747813803146{text-align: center;}"]Contact us anytime[/vc_column_text]
  [/vc_column]
[/vc_row]
```

---

## Best Practices

1. **Always generate unique timestamps** for CSS classes
2. **Use URL encoding** for special characters in attributes
3. **Test responsive behavior** with offset classes
4. **Keep CSS in the custom_css attribute** not inline styles
5. **Use XStore elements** (`etheme_*`) for WooCommerce integration
6. **Set `_wpb_vc_js_status` meta to `true`** after creating pages
