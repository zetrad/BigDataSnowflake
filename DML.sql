INSERT INTO dim_customer (
    first_name, last_name, age, email, country, postal_code,
    pet_type, pet_name, pet_breed
)
SELECT DISTINCT
    customer_first_name, customer_last_name, customer_age, customer_email,
    customer_country, customer_postal_code,
    customer_pet_type, customer_pet_name, customer_pet_breed
FROM mock_data;

INSERT INTO dim_seller (
    first_name, last_name, email, country, postal_code
)
SELECT DISTINCT
    seller_first_name, seller_last_name, seller_email,
    seller_country, seller_postal_code
FROM mock_data;

INSERT INTO dim_product (
    name, category, price, weight, color, size,
    brand, material, description, rating, reviews,
    release_date, expiry_date
)
SELECT DISTINCT
    product_name, product_category, product_price, product_weight,
    product_color, product_size, product_brand, product_material,
    product_description, product_rating, product_reviews,
    product_release_date, product_expiry_date
FROM mock_data;

INSERT INTO dim_store (
    name, location, city, state, country, phone, email
)
SELECT DISTINCT
    store_name, store_location, store_city, store_state,
    store_country, store_phone, store_email
FROM mock_data;


INSERT INTO dim_supplier (
    name, contact, email, phone, address, city, country
)
SELECT DISTINCT
    supplier_name, supplier_contact, supplier_email,
    supplier_phone, supplier_address, supplier_city, supplier_country
FROM mock_data;

INSERT INTO dim_date (
    full_date, year, month, day, day_of_week
)
SELECT DISTINCT
    sale_date,
    EXTRACT(YEAR FROM sale_date),
    EXTRACT(MONTH FROM sale_date),
    EXTRACT(DAY FROM sale_date),
    TO_DATE(sale_date, 'DD.MM.YYYY')
FROM mock_data;

INSERT INTO sales_fact (
    sale_date_id, customer_id, seller_id, product_id, store_id, supplier_id,
    sale_quantity, sale_total_price
)
SELECT
    dd.id,
    dc.id,
    ds.id,
    dp.id,
    dst.id,
    dsup.id,
    md.sale_quantity,
    md.sale_total_price
FROM mock_data md
JOIN dim_date dd
  ON md.sale_date = dd.full_date
JOIN dim_customer dc
  ON md.customer_email = dc.email
JOIN dim_seller ds
  ON md.seller_email = ds.email
JOIN dim_product dp
  ON md.product_name = dp.name AND md.product_category = dp.category
JOIN dim_store dst
  ON md.store_name = dst.name AND md.store_email = dst.email
JOIN dim_supplier dsup
  ON md.supplier_email = dsup.email;
