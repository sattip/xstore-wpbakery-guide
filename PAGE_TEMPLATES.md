# Page Templates

Ready-to-use WPBakery page templates for XStore theme. Copy and customize for your needs.

## Table of Contents
1. [Homepage](#homepage)
2. [About Page](#about-page)
3. [Contact Page](#contact-page)
4. [Landing Page](#landing-page)
5. [FAQ Page](#faq-page)
6. [Terms & Conditions](#terms--conditions)
7. [Footer Static Block](#footer-static-block)
8. [Shop Banner Block](#shop-banner-block)
9. [Mega Menu Block](#mega-menu-block)

---

## Homepage

Full-featured homepage with hero, features, products, and testimonials.

```
[vc_row full_width="stretch_row" content_placement="middle" css=".vc_custom_1747813803100{padding-top: 80px !important;padding-bottom: 80px !important;background-color: #FFF5F7 !important;}"]
  [vc_column width="1/2" offset="vc_col-lg-6 vc_col-md-12"]
    [vc_custom_heading text="Welcome to Our Store" font_container="tag:h1|font_size:48px|text_align:left|color:%23333333|line_height:1.2" use_theme_fonts="yes" css=".vc_custom_1747813803101{margin-bottom: 20px !important;}"]
    [vc_column_text css=".vc_custom_1747813803102{margin-bottom: 30px !important;font-size: 18px !important;}"]
      <p>Discover premium quality products at amazing prices. Free shipping on orders over 50 EUR.</p>
    [/vc_column_text]
    [vc_btn title="Shop Now" style="gradient-custom" gradient_custom_color_1="#ff7eb9" gradient_custom_color_2="#FF3C88" shape="round" size="lg" link="url:%2Fshop|title:Shop"]
    [vc_empty_space height="20px"]
    [vc_btn title="View Collections" style="outline" color="pink" shape="round" size="lg" link="url:%2Fcollections|title:Collections"]
  [/vc_column]
  [vc_column width="1/2" offset="vc_col-lg-6 vc_col-md-12"]
    [vc_single_image image="HERO_IMAGE_ID" img_size="full" alignment="center"]
  [/vc_column]
[/vc_row]

[vc_row css=".vc_custom_1747813803103{padding-top: 60px !important;padding-bottom: 60px !important;}"]
  [vc_column]
    [vc_custom_heading text="Shop by Category" font_container="tag:h2|font_size:32px|text_align:center" use_theme_fonts="yes" css=".vc_custom_1747813803104{margin-bottom: 40px !important;}"]
  [/vc_column]
[/vc_row]

[vc_row gap="30"]
  [vc_column width="1/4"]
    [vc_single_image image="CAT1_IMAGE_ID" img_size="full" alignment="center" onclick="custom_link" link="/category/category-1" css=".vc_custom_1747813803105{border-radius: 10px !important;}"]
    [vc_custom_heading text="Category 1" font_container="tag:h3|font_size:18px|text_align:center" use_theme_fonts="yes"]
  [/vc_column]
  [vc_column width="1/4"]
    [vc_single_image image="CAT2_IMAGE_ID" img_size="full" alignment="center" onclick="custom_link" link="/category/category-2" css=".vc_custom_1747813803106{border-radius: 10px !important;}"]
    [vc_custom_heading text="Category 2" font_container="tag:h3|font_size:18px|text_align:center" use_theme_fonts="yes"]
  [/vc_column]
  [vc_column width="1/4"]
    [vc_single_image image="CAT3_IMAGE_ID" img_size="full" alignment="center" onclick="custom_link" link="/category/category-3" css=".vc_custom_1747813803107{border-radius: 10px !important;}"]
    [vc_custom_heading text="Category 3" font_container="tag:h3|font_size:18px|text_align:center" use_theme_fonts="yes"]
  [/vc_column]
  [vc_column width="1/4"]
    [vc_single_image image="CAT4_IMAGE_ID" img_size="full" alignment="center" onclick="custom_link" link="/category/category-4" css=".vc_custom_1747813803108{border-radius: 10px !important;}"]
    [vc_custom_heading text="Category 4" font_container="tag:h3|font_size:18px|text_align:center" use_theme_fonts="yes"]
  [/vc_column]
[/vc_row]

[vc_row css=".vc_custom_1747813803109{padding-top: 60px !important;padding-bottom: 40px !important;}"]
  [vc_column]
    [vc_custom_heading text="Best Sellers" font_container="tag:h2|font_size:32px|text_align:center" use_theme_fonts="yes" css=".vc_custom_1747813803110{margin-bottom: 40px !important;}"]
    [etheme_products limit="8" columns="4" orderby="popularity" order="DESC"]
  [/vc_column]
[/vc_row]

[vc_row full_width="stretch_row" css=".vc_custom_1747813803111{padding-top: 50px !important;padding-bottom: 50px !important;background-color: #f8cae2 !important;}"]
  [vc_column width="1/3"]
    [vc_custom_heading text="Free Shipping" font_container="tag:h3|font_size:20px|text_align:center|color:%23333333" use_theme_fonts="yes"]
    [vc_column_text css=".vc_custom_1747813803112{text-align: center !important;}"]<p>On all orders over 50 EUR</p>[/vc_column_text]
  [/vc_column]
  [vc_column width="1/3"]
    [vc_custom_heading text="Secure Payment" font_container="tag:h3|font_size:20px|text_align:center|color:%23333333" use_theme_fonts="yes"]
    [vc_column_text css=".vc_custom_1747813803113{text-align: center !important;}"]<p>100% secure transactions</p>[/vc_column_text]
  [/vc_column]
  [vc_column width="1/3"]
    [vc_custom_heading text="Easy Returns" font_container="tag:h3|font_size:20px|text_align:center|color:%23333333" use_theme_fonts="yes"]
    [vc_column_text css=".vc_custom_1747813803114{text-align: center !important;}"]<p>14-day return policy</p>[/vc_column_text]
  [/vc_column]
[/vc_row]

[vc_row css=".vc_custom_1747813803115{padding-top: 60px !important;padding-bottom: 60px !important;}"]
  [vc_column]
    [vc_custom_heading text="New Arrivals" font_container="tag:h2|font_size:32px|text_align:center" use_theme_fonts="yes" css=".vc_custom_1747813803116{margin-bottom: 40px !important;}"]
    [etheme_products limit="4" columns="4" orderby="date" order="DESC"]
  [/vc_column]
[/vc_row]
```

---

## About Page

Company information with team and values.

```
[vc_row full_width="stretch_row" css=".vc_custom_1747813803200{padding-top: 60px !important;padding-bottom: 60px !important;background-color: #FFF5F7 !important;}"]
  [vc_column]
    [vc_custom_heading text="About Us" font_container="tag:h1|font_size:42px|text_align:center|color:%23333333" use_theme_fonts="yes" css=".vc_custom_1747813803201{margin-bottom: 20px !important;}"]
    [vc_column_text css=".vc_custom_1747813803202{text-align: center !important;max-width: 800px !important;margin: 0 auto !important;}"]
      <p>Learn more about our story and what drives us to provide the best products and service.</p>
    [/vc_column_text]
  [/vc_column]
[/vc_row]

[vc_row css=".vc_custom_1747813803203{padding-top: 60px !important;padding-bottom: 60px !important;}"]
  [vc_column width="1/2" offset="vc_col-lg-6 vc_col-md-12"]
    [vc_single_image image="ABOUT_IMAGE_ID" img_size="full" css=".vc_custom_1747813803204{border-radius: 10px !important;}"]
  [/vc_column]
  [vc_column width="1/2" offset="vc_col-lg-6 vc_col-md-12"]
    [vc_custom_heading text="Our Story" font_container="tag:h2|font_size:32px|text_align:left|color:%23333333" use_theme_fonts="yes" css=".vc_custom_1747813803205{margin-bottom: 20px !important;}"]
    [vc_column_text css=".vc_custom_1747813803206{font-size: 16px !important;line-height: 1.8 !important;}"]
      <p>Founded in 2020, our company started with a simple mission: to provide high-quality products at affordable prices.</p>
      <p>We believe that everyone deserves access to premium products without breaking the bank. That's why we work directly with manufacturers to bring you the best value.</p>
      <p>Today, we serve thousands of happy customers across Europe, and we're just getting started.</p>
    [/vc_column_text]
  [/vc_column]
[/vc_row]

[vc_row css=".vc_custom_1747813803207{padding-top: 40px !important;padding-bottom: 60px !important;}"]
  [vc_column]
    [vc_custom_heading text="Our Values" font_container="tag:h2|font_size:32px|text_align:center|color:%23333333" use_theme_fonts="yes" css=".vc_custom_1747813803208{margin-bottom: 40px !important;}"]
  [/vc_column]
[/vc_row]

[vc_row gap="30"]
  [vc_column width="1/3"]
    [vc_custom_heading text="Quality First" font_container="tag:h3|font_size:22px|text_align:center|color:%23ff7eb9" use_theme_fonts="yes"]
    [vc_column_text css=".vc_custom_1747813803209{text-align: center !important;}"]
      <p>We never compromise on quality. Every product is carefully selected and tested before reaching you.</p>
    [/vc_column_text]
  [/vc_column]
  [vc_column width="1/3"]
    [vc_custom_heading text="Customer Focus" font_container="tag:h3|font_size:22px|text_align:center|color:%23ff7eb9" use_theme_fonts="yes"]
    [vc_column_text css=".vc_custom_1747813803210{text-align: center !important;}"]
      <p>Your satisfaction is our priority. We're here to help you find exactly what you need.</p>
    [/vc_column_text]
  [/vc_column]
  [vc_column width="1/3"]
    [vc_custom_heading text="Sustainability" font_container="tag:h3|font_size:22px|text_align:center|color:%23ff7eb9" use_theme_fonts="yes"]
    [vc_column_text css=".vc_custom_1747813803211{text-align: center !important;}"]
      <p>We're committed to eco-friendly practices and sustainable packaging solutions.</p>
    [/vc_column_text]
  [/vc_column]
[/vc_row]

[vc_row full_width="stretch_row" css=".vc_custom_1747813803212{padding-top: 60px !important;padding-bottom: 60px !important;background-color: #f8cae2 !important;margin-top: 60px !important;}"]
  [vc_column width="1/2"]
    [vc_custom_heading text="1000+" font_container="tag:div|font_size:48px|text_align:center|color:%23ff7eb9" use_theme_fonts="yes"]
    [vc_column_text css=".vc_custom_1747813803213{text-align: center !important;}"]<p>Happy Customers</p>[/vc_column_text]
  [/vc_column]
  [vc_column width="1/2"]
    [vc_custom_heading text="500+" font_container="tag:div|font_size:48px|text_align:center|color:%23ff7eb9" use_theme_fonts="yes"]
    [vc_column_text css=".vc_custom_1747813803214{text-align: center !important;}"]<p>Products Available</p>[/vc_column_text]
  [/vc_column]
[/vc_row]
```

---

## Contact Page

Contact form with company information and map.

```
[vc_row full_width="stretch_row" css=".vc_custom_1747813803300{padding-top: 60px !important;padding-bottom: 60px !important;background-color: #FFF5F7 !important;}"]
  [vc_column]
    [vc_custom_heading text="Contact Us" font_container="tag:h1|font_size:42px|text_align:center|color:%23333333" use_theme_fonts="yes" css=".vc_custom_1747813803301{margin-bottom: 20px !important;}"]
    [vc_column_text css=".vc_custom_1747813803302{text-align: center !important;}"]
      <p>We'd love to hear from you. Get in touch with us today.</p>
    [/vc_column_text]
  [/vc_column]
[/vc_row]

[vc_row css=".vc_custom_1747813803303{padding-top: 60px !important;padding-bottom: 60px !important;}"]
  [vc_column width="1/2" offset="vc_col-lg-6 vc_col-md-12"]
    [vc_custom_heading text="Send Us a Message" font_container="tag:h2|font_size:28px|text_align:left|color:%23333333" use_theme_fonts="yes" css=".vc_custom_1747813803304{margin-bottom: 30px !important;}"]
    [contact-form-7 id="FORM_ID" title="Contact Form"]
  [/vc_column]
  [vc_column width="1/2" offset="vc_col-lg-6 vc_col-md-12"]
    [vc_custom_heading text="Contact Information" font_container="tag:h2|font_size:28px|text_align:left|color:%23333333" use_theme_fonts="yes" css=".vc_custom_1747813803305{margin-bottom: 30px !important;}"]
    [vc_column_text css=".vc_custom_1747813803306{font-size: 16px !important;line-height: 2 !important;}"]
      <p><strong>Address:</strong><br>
      123 Main Street<br>
      Athens, 10557<br>
      Greece</p>

      <p><strong>Phone:</strong><br>
      +30 210 1234567</p>

      <p><strong>Email:</strong><br>
      info@yourstore.gr</p>

      <p><strong>Working Hours:</strong><br>
      Monday - Friday: 9:00 - 18:00<br>
      Saturday: 10:00 - 14:00<br>
      Sunday: Closed</p>
    [/vc_column_text]
    [vc_empty_space height="20px"]
    [follow facebook="https://facebook.com/yourpage" instagram="https://instagram.com/yourpage" size="normal"]
  [/vc_column]
[/vc_row]

[vc_row full_width="stretch_row"]
  [vc_column]
    [vc_raw_html]JTNDaWZyYW1lJTIwc3JjJTNEJTIyaHR0cHMlM0ElMkYlMkZ3d3cuZ29vZ2xlLmNvbSUyRm1hcHMlMkZlbWJlZCUzRnBiJTNEJTIxMW0xOCUyMTFtMTIlMjExbTMlMjExZDMxNDUuODI5MTUwMjEwNjI1JTIxMmQyMy43Mjc1Mzk4MTUyMTIyODMlMjEzZDM3Ljk4MzgxNzIwMjE1MjQlMjEybTMlMjExZjAlMjEyZjAlMjEzZjAlMjEzbTIlMjExaTEwMjQlMjEyaTc2OCUyMTRmMTMuMSUyMTNtMyUyMTFtMiUyMTFzMHgxNGExYmQxOTJlZjM1ZjQ3JTI1M0EweDdlZjYzYTA0MTc4N2M0YjAlMjEyc0F0aGVucyUyMTVlMCUyMTNtMiUyMTFzZW4lMjEyc2dyJTIxNHYxNjQwMDAwMDAwMDAwJTIxNW0yJTIxMXNlbiUyMTJzZ3IlMjIlMjB3aWR0aCUzRCUyMjEwMCUyNSUyMiUyMGhlaWdodCUzRCUyMjQ1MCUyMiUyMHN0eWxlJTNEJTIyYm9yZGVyJTNBMCUyMiUyMGFsbG93ZnVsbHNjcmVlbiUzRCUyMiUyMiUyMGxvYWRpbmclM0QlMjJsYXp5JTIyJTNFJTNDJTJGaWZyYW1lJTNF[/vc_raw_html]
  [/vc_column]
[/vc_row]
```

---

## Landing Page

Promotional landing page with countdown and CTA.

```
[vc_row full_width="stretch_row" content_placement="middle" css=".vc_custom_1747813803400{padding-top: 100px !important;padding-bottom: 100px !important;background-image: url(BACKGROUND_IMAGE_URL) !important;background-position: center !important;background-size: cover !important;}"]
  [vc_column css=".vc_custom_1747813803401{background-color: rgba(255,255,255,0.9) !important;padding: 60px !important;border-radius: 20px !important;max-width: 700px !important;margin: 0 auto !important;}"]
    [vc_custom_heading text="Summer Sale" font_container="tag:h1|font_size:56px|text_align:center|color:%23ff7eb9" use_theme_fonts="yes"]
    [vc_custom_heading text="Up to 50% Off" font_container="tag:h2|font_size:36px|text_align:center|color:%23333333" use_theme_fonts="yes" css=".vc_custom_1747813803402{margin-bottom: 30px !important;}"]
    [vc_column_text css=".vc_custom_1747813803403{text-align: center !important;font-size: 18px !important;margin-bottom: 30px !important;}"]
      <p>Don't miss our biggest sale of the year! Limited time only.</p>
    [/vc_column_text]
    [countdown date="2025-08-31 23:59:59" style="1"]
    [vc_empty_space height="30px"]
    [vc_btn title="Shop the Sale" style="gradient-custom" gradient_custom_color_1="#ff7eb9" gradient_custom_color_2="#FF3C88" shape="round" size="lg" align="center" link="url:%2Fsale|title:Sale"]
  [/vc_column]
[/vc_row]

[vc_row css=".vc_custom_1747813803404{padding-top: 60px !important;padding-bottom: 60px !important;}"]
  [vc_column]
    [vc_custom_heading text="Sale Items" font_container="tag:h2|font_size:32px|text_align:center" use_theme_fonts="yes" css=".vc_custom_1747813803405{margin-bottom: 40px !important;}"]
    [etheme_products on_sale="true" limit="8" columns="4"]
  [/vc_column]
[/vc_row]

[vc_row full_width="stretch_row" css=".vc_custom_1747813803406{padding-top: 60px !important;padding-bottom: 60px !important;background-color: #FFF5F7 !important;}"]
  [vc_column width="1/2" offset="vc_col-lg-6 vc_col-md-12"]
    [vc_custom_heading text="Why Shop With Us?" font_container="tag:h2|font_size:32px|text_align:left|color:%23333333" use_theme_fonts="yes" css=".vc_custom_1747813803407{margin-bottom: 30px !important;}"]
    [vc_column_text]
      <ul style="font-size: 18px; line-height: 2;">
        <li>✓ Authentic products guaranteed</li>
        <li>✓ Fast shipping across Europe</li>
        <li>✓ Easy 14-day returns</li>
        <li>✓ Secure payment methods</li>
        <li>✓ 24/7 customer support</li>
      </ul>
    [/vc_column_text]
  [/vc_column]
  [vc_column width="1/2" offset="vc_col-lg-6 vc_col-md-12"]
    [vc_single_image image="PROMO_IMAGE_ID" img_size="full"]
  [/vc_column]
[/vc_row]
```

---

## FAQ Page

Frequently asked questions with accordion.

```
[vc_row full_width="stretch_row" css=".vc_custom_1747813803500{padding-top: 60px !important;padding-bottom: 60px !important;background-color: #FFF5F7 !important;}"]
  [vc_column]
    [vc_custom_heading text="Frequently Asked Questions" font_container="tag:h1|font_size:42px|text_align:center|color:%23333333" use_theme_fonts="yes"]
  [/vc_column]
[/vc_row]

[vc_row css=".vc_custom_1747813803501{padding-top: 60px !important;padding-bottom: 60px !important;max-width: 900px !important;margin: 0 auto !important;}"]
  [vc_column]
    [vc_custom_heading text="Shipping & Delivery" font_container="tag:h2|font_size:28px|text_align:left|color:%23ff7eb9" use_theme_fonts="yes" css=".vc_custom_1747813803502{margin-bottom: 20px !important;}"]

    [vc_tta_accordion style="modern" color="pink" active_section="1" collapsible_all="true"]
      [vc_tta_section title="How long does shipping take?" tab_id="faq-1"]
        [vc_column_text]Standard shipping takes 3-5 business days within Greece. Express shipping (1-2 days) is available for an additional fee. International shipping takes 5-10 business days depending on location.[/vc_column_text]
      [/vc_tta_section]
      [vc_tta_section title="Do you offer free shipping?" tab_id="faq-2"]
        [vc_column_text]Yes! We offer free standard shipping on all orders over 50 EUR within Greece. International orders over 100 EUR also qualify for free shipping.[/vc_column_text]
      [/vc_tta_section]
      [vc_tta_section title="Can I track my order?" tab_id="faq-3"]
        [vc_column_text]Absolutely! Once your order ships, you'll receive an email with a tracking number. You can track your package directly on our website or through the carrier's website.[/vc_column_text]
      [/vc_tta_section]
    [/vc_tta_accordion]

    [vc_empty_space height="40px"]

    [vc_custom_heading text="Returns & Refunds" font_container="tag:h2|font_size:28px|text_align:left|color:%23ff7eb9" use_theme_fonts="yes" css=".vc_custom_1747813803503{margin-bottom: 20px !important;}"]

    [vc_tta_accordion style="modern" color="pink" collapsible_all="true"]
      [vc_tta_section title="What is your return policy?" tab_id="faq-4"]
        [vc_column_text]We accept returns within 14 days of delivery. Items must be unused, in original packaging, and with all tags attached. Some items like cosmetics and personal care products cannot be returned once opened.[/vc_column_text]
      [/vc_tta_section]
      [vc_tta_section title="How do I request a return?" tab_id="faq-5"]
        [vc_column_text]To initiate a return, log into your account and go to Order History. Select the order and click "Request Return". You can also contact our customer service team at returns@yourstore.gr.[/vc_column_text]
      [/vc_tta_section]
      [vc_tta_section title="When will I receive my refund?" tab_id="faq-6"]
        [vc_column_text]Refunds are processed within 5-7 business days after we receive your return. The refund will be credited to your original payment method. Please allow additional time for your bank to process the refund.[/vc_column_text]
      [/vc_tta_section]
    [/vc_tta_accordion]

    [vc_empty_space height="40px"]

    [vc_custom_heading text="Payment" font_container="tag:h2|font_size:28px|text_align:left|color:%23ff7eb9" use_theme_fonts="yes" css=".vc_custom_1747813803504{margin-bottom: 20px !important;}"]

    [vc_tta_accordion style="modern" color="pink" collapsible_all="true"]
      [vc_tta_section title="What payment methods do you accept?" tab_id="faq-7"]
        [vc_column_text]We accept all major credit cards (Visa, MasterCard, American Express), PayPal, bank transfer, and cash on delivery for orders within Greece.[/vc_column_text]
      [/vc_tta_section]
      [vc_tta_section title="Is my payment information secure?" tab_id="faq-8"]
        [vc_column_text]Yes, absolutely! We use SSL encryption and PCI-compliant payment processing. Your payment information is never stored on our servers.[/vc_column_text]
      [/vc_tta_section]
    [/vc_tta_accordion]
  [/vc_column]
[/vc_row]

[vc_row full_width="stretch_row" css=".vc_custom_1747813803505{padding-top: 40px !important;padding-bottom: 40px !important;background-color: #f8cae2 !important;}"]
  [vc_column]
    [vc_custom_heading text="Still have questions?" font_container="tag:h3|font_size:24px|text_align:center|color:%23333333" use_theme_fonts="yes"]
    [vc_column_text css=".vc_custom_1747813803506{text-align: center !important;margin-bottom: 20px !important;}"]
      <p>Our customer service team is here to help!</p>
    [/vc_column_text]
    [vc_btn title="Contact Us" style="gradient-custom" gradient_custom_color_1="#ff7eb9" gradient_custom_color_2="#FF3C88" shape="round" align="center" link="url:%2Fcontact|title:Contact"]
  [/vc_column]
[/vc_row]
```

---

## Terms & Conditions

Legal page template.

```
[vc_row full_width="stretch_row" css=".vc_custom_1747813803600{padding-top: 60px !important;padding-bottom: 40px !important;background-color: #FFF5F7 !important;}"]
  [vc_column]
    [vc_custom_heading text="Terms & Conditions" font_container="tag:h1|font_size:42px|text_align:center|color:%23333333" use_theme_fonts="yes"]
    [vc_column_text css=".vc_custom_1747813803601{text-align: center !important;}"]
      <p>Last updated: January 2025</p>
    [/vc_column_text]
  [/vc_column]
[/vc_row]

[vc_row css=".vc_custom_1747813803602{padding-top: 40px !important;padding-bottom: 60px !important;max-width: 900px !important;margin: 0 auto !important;}"]
  [vc_column]
    [vc_column_text css=".vc_custom_1747813803603{font-size: 16px !important;line-height: 1.8 !important;}"]
      <h2>1. Introduction</h2>
      <p>Welcome to our website. By accessing and using this website, you accept and agree to be bound by the terms and conditions set forth below.</p>

      <h2>2. Use of Website</h2>
      <p>You may use this website for lawful purposes only. You agree not to use this website:</p>
      <ul>
        <li>In any way that violates any applicable law or regulation</li>
        <li>To transmit any unsolicited advertising or promotional material</li>
        <li>To impersonate any person or entity</li>
        <li>To interfere with the operation of the website</li>
      </ul>

      <h2>3. Products and Pricing</h2>
      <p>All products are subject to availability. We reserve the right to discontinue any product at any time. Prices are subject to change without notice. We make every effort to display accurate pricing, but errors may occur.</p>

      <h2>4. Orders and Payment</h2>
      <p>When you place an order, you are making an offer to purchase. We reserve the right to accept or reject any order. Payment must be received before order processing. All transactions are processed securely.</p>

      <h2>5. Shipping and Delivery</h2>
      <p>We aim to ship orders within 1-2 business days. Delivery times are estimates only and not guaranteed. We are not responsible for delays caused by shipping carriers or customs.</p>

      <h2>6. Returns and Refunds</h2>
      <p>Please refer to our Returns Policy page for detailed information about returns and refunds.</p>

      <h2>7. Intellectual Property</h2>
      <p>All content on this website, including text, graphics, logos, and images, is the property of our company and protected by copyright laws.</p>

      <h2>8. Limitation of Liability</h2>
      <p>We shall not be liable for any indirect, incidental, special, or consequential damages arising from your use of this website or products purchased.</p>

      <h2>9. Contact Information</h2>
      <p>If you have any questions about these Terms & Conditions, please contact us at legal@yourstore.gr.</p>
    [/vc_column_text]
  [/vc_column]
[/vc_row]
```

---

## Footer Static Block

Five-column footer with links and social icons.

```
[vc_row full_width="stretch_row" css=".vc_custom_1747813803700{padding-top: 40px !important;padding-bottom: 30px !important;background-color: #f8cae2 !important;}"]
  [vc_column width="1/5" offset="vc_col-lg-offset-0 vc_col-md-4 vc_col-xs-6"]
    [vc_single_image image="LOGO_IMAGE_ID" img_size="150x50" onclick="custom_link" link="/"]
    [vc_empty_space height="15px"]
    [vc_column_text css=".vc_custom_1747813803701{font-size: 14px !important;}"]
      <p>Your trusted online store for quality products.</p>
    [/vc_column_text]
    [follow facebook="https://facebook.com/yourpage" instagram="https://instagram.com/yourpage" size="small"]
  [/vc_column]
  [vc_column width="1/5" offset="vc_col-lg-offset-0 vc_col-md-4 vc_col-xs-6"]
    [vc_custom_heading text="Shop" font_container="tag:h4|font_size:16px|text_align:left|color:%23333333" use_theme_fonts="yes" css=".vc_custom_1747813803702{margin-bottom: 15px !important;}"]
    [vc_column_text css=".vc_custom_1747813803703{font-size: 14px !important;line-height: 2 !important;}"]
      <a href="/shop">All Products</a><br>
      <a href="/new-arrivals">New Arrivals</a><br>
      <a href="/sale">Sale</a><br>
      <a href="/brands">Brands</a>
    [/vc_column_text]
  [/vc_column]
  [vc_column width="1/5" offset="vc_col-lg-offset-0 vc_col-md-4 vc_col-xs-6"]
    [vc_custom_heading text="Information" font_container="tag:h4|font_size:16px|text_align:left|color:%23333333" use_theme_fonts="yes" css=".vc_custom_1747813803704{margin-bottom: 15px !important;}"]
    [vc_column_text css=".vc_custom_1747813803705{font-size: 14px !important;line-height: 2 !important;}"]
      <a href="/about">About Us</a><br>
      <a href="/contact">Contact</a><br>
      <a href="/faq">FAQ</a><br>
      <a href="/blog">Blog</a>
    [/vc_column_text]
  [/vc_column]
  [vc_column width="1/5" offset="vc_col-lg-offset-0 vc_col-md-6 vc_col-xs-6"]
    [vc_custom_heading text="Policies" font_container="tag:h4|font_size:16px|text_align:left|color:%23333333" use_theme_fonts="yes" css=".vc_custom_1747813803706{margin-bottom: 15px !important;}"]
    [vc_column_text css=".vc_custom_1747813803707{font-size: 14px !important;line-height: 2 !important;}"]
      <a href="/shipping">Shipping</a><br>
      <a href="/returns">Returns</a><br>
      <a href="/terms">Terms & Conditions</a><br>
      <a href="/privacy">Privacy Policy</a>
    [/vc_column_text]
  [/vc_column]
  [vc_column width="1/5" offset="vc_col-lg-offset-0 vc_col-md-6 vc_col-xs-12"]
    [vc_custom_heading text="Contact" font_container="tag:h4|font_size:16px|text_align:left|color:%23333333" use_theme_fonts="yes" css=".vc_custom_1747813803708{margin-bottom: 15px !important;}"]
    [vc_column_text css=".vc_custom_1747813803709{font-size: 14px !important;line-height: 2 !important;}"]
      <strong>Phone:</strong> +30 210 1234567<br>
      <strong>Email:</strong> info@yourstore.gr<br>
      <strong>Hours:</strong> Mon-Fri 9:00-18:00
    [/vc_column_text]
  [/vc_column]
[/vc_row]

[vc_row full_width="stretch_row" css=".vc_custom_1747813803710{padding-top: 15px !important;padding-bottom: 15px !important;background-color: #e8b8d1 !important;}"]
  [vc_column]
    [vc_column_text css=".vc_custom_1747813803711{text-align: center !important;font-size: 13px !important;}"]
      <p>&copy; 2025 Your Store. All rights reserved.</p>
    [/vc_column_text]
  [/vc_column]
[/vc_row]
```

---

## Shop Banner Block

Promotional banner for shop/category pages.

```
[vc_row full_width="stretch_row" css=".vc_custom_1747813803800{padding-top: 30px !important;padding-bottom: 30px !important;background-color: #FFF5F7 !important;margin-bottom: 30px !important;}"]
  [vc_column width="2/3" offset="vc_col-lg-8 vc_col-md-12"]
    [vc_custom_heading text="Free Shipping on Orders Over 50 EUR!" font_container="tag:h3|font_size:24px|text_align:left|color:%23ff7eb9" use_theme_fonts="yes"]
    [vc_column_text]
      <p>Use code <strong>FREESHIP50</strong> at checkout. Limited time offer!</p>
    [/vc_column_text]
  [/vc_column]
  [vc_column width="1/3" offset="vc_col-lg-4 vc_col-md-12" css=".vc_custom_1747813803801{text-align: right !important;}"]
    [vc_btn title="Shop Now" style="gradient-custom" gradient_custom_color_1="#ff7eb9" gradient_custom_color_2="#FF3C88" shape="round" size="md" link="url:%2Fshop|title:Shop"]
  [/vc_column]
[/vc_row]
```

---

## Mega Menu Block

Category mega menu content block.

```
[vc_row gap="20"]
  [vc_column width="1/4"]
    [vc_custom_heading text="Skincare" font_container="tag:h4|font_size:16px|text_align:left|color:%23ff7eb9" use_theme_fonts="yes" css=".vc_custom_1747813803900{margin-bottom: 10px !important;border-bottom: 1px solid %23f8cae2 !important;padding-bottom: 10px !important;}"]
    [vc_column_text css=".vc_custom_1747813803901{font-size: 14px !important;line-height: 2 !important;}"]
      <a href="/category/cleansers">Cleansers</a><br>
      <a href="/category/moisturizers">Moisturizers</a><br>
      <a href="/category/serums">Serums</a><br>
      <a href="/category/sunscreen">Sunscreen</a><br>
      <a href="/category/masks">Face Masks</a>
    [/vc_column_text]
  [/vc_column]
  [vc_column width="1/4"]
    [vc_custom_heading text="Makeup" font_container="tag:h4|font_size:16px|text_align:left|color:%23ff7eb9" use_theme_fonts="yes" css=".vc_custom_1747813803902{margin-bottom: 10px !important;border-bottom: 1px solid %23f8cae2 !important;padding-bottom: 10px !important;}"]
    [vc_column_text css=".vc_custom_1747813803903{font-size: 14px !important;line-height: 2 !important;}"]
      <a href="/category/foundation">Foundation</a><br>
      <a href="/category/lipstick">Lipstick</a><br>
      <a href="/category/mascara">Mascara</a><br>
      <a href="/category/eyeshadow">Eyeshadow</a><br>
      <a href="/category/brushes">Brushes & Tools</a>
    [/vc_column_text]
  [/vc_column]
  [vc_column width="1/4"]
    [vc_custom_heading text="Hair Care" font_container="tag:h4|font_size:16px|text_align:left|color:%23ff7eb9" use_theme_fonts="yes" css=".vc_custom_1747813803904{margin-bottom: 10px !important;border-bottom: 1px solid %23f8cae2 !important;padding-bottom: 10px !important;}"]
    [vc_column_text css=".vc_custom_1747813803905{font-size: 14px !important;line-height: 2 !important;}"]
      <a href="/category/shampoo">Shampoo</a><br>
      <a href="/category/conditioner">Conditioner</a><br>
      <a href="/category/treatments">Treatments</a><br>
      <a href="/category/styling">Styling</a><br>
      <a href="/category/hair-tools">Hair Tools</a>
    [/vc_column_text]
  [/vc_column]
  [vc_column width="1/4"]
    [vc_single_image image="PROMO_IMAGE_ID" img_size="full" onclick="custom_link" link="/sale" css=".vc_custom_1747813803906{border-radius: 10px !important;}"]
    [vc_btn title="Shop Sale" style="gradient-custom" gradient_custom_color_1="#ff7eb9" gradient_custom_color_2="#FF3C88" shape="round" size="sm" align="center" link="url:%2Fsale|title:Sale"]
  [/vc_column]
[/vc_row]
```

---

## Usage Notes

1. **Replace Placeholders:**
   - `IMAGE_ID` - WordPress media library image ID
   - `FORM_ID` - Contact Form 7 form ID
   - URLs - Update with your actual page URLs
   - Colors - Customize to match your brand

2. **CSS Timestamps:**
   - Generate unique timestamps for each CSS class
   - Format: `.vc_custom_TIMESTAMP{...}`
   - Use current Unix timestamp or sequential numbers

3. **Post Meta:**
   - Set `_wpb_vc_js_status` to `true`
   - Compile all CSS into `_wpb_shortcodes_custom_css`

4. **Static Blocks:**
   - Create with post_type `staticblocks`
   - Reference by ID in theme options
