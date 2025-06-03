CREATE TABLE mock_data (
    id SERIAL,
    customer_first_name TEXT,
    customer_last_name TEXT,
    customer_age INT,
    customer_email TEXT,
    customer_country TEXT,
    customer_postal_code TEXT,
    customer_pet_type TEXT,
    customer_pet_name TEXT,
    customer_pet_breed TEXT,
    seller_first_name TEXT,
    seller_last_name TEXT,
    seller_email TEXT,
    seller_country TEXT,
    seller_postal_code TEXT,
    product_name TEXT,
    product_category TEXT,
    product_price NUMERIC,
    product_quantity INT,
    sale_date DATE,
    sale_customer_id INT,
    sale_seller_id INT,
    sale_product_id INT,
    sale_quantity INT,
    sale_total_price NUMERIC,
    store_name TEXT,
    store_location TEXT,
    store_city TEXT,
    store_state TEXT,
    store_country TEXT,
    store_phone TEXT,
    store_email TEXT,
    pet_category TEXT,
    product_weight NUMERIC,
    product_color TEXT,
    product_size TEXT,
    product_brand TEXT,
    product_material TEXT,
    product_description TEXT,
    product_rating NUMERIC,
    product_reviews INT,
    product_release_date DATE,
    product_expiry_date DATE,
    supplier_name TEXT,
    supplier_contact TEXT,
    supplier_email TEXT,
    supplier_phone TEXT,
    supplier_address TEXT,
    supplier_city TEXT,
    supplier_country TEXT
);

-- Загрузка CSV-файлов (если в них есть заголовки)
COPY mock_data FROM '/docker-entrypoint-initdb.d/mock_data1.csv' WITH CSV HEADER;
COPY mock_data FROM '/docker-entrypoint-initdb.d/mock_data2.csv' WITH CSV HEADER;
COPY mock_data FROM '/docker-entrypoint-initdb.d/mock_data3.csv' WITH CSV HEADER;
COPY mock_data FROM '/docker-entrypoint-initdb.d/mock_data4.csv' WITH CSV HEADER;
COPY mock_data FROM '/docker-entrypoint-initdb.d/mock_data5.csv' WITH CSV HEADER;
COPY mock_data FROM '/docker-entrypoint-initdb.d/mock_data6.csv' WITH CSV HEADER;
COPY mock_data FROM '/docker-entrypoint-initdb.d/mock_data7.csv' WITH CSV HEADER;
COPY mock_data FROM '/docker-entrypoint-initdb.d/mock_data8.csv' WITH CSV HEADER;
COPY mock_data FROM '/docker-entrypoint-initdb.d/mock_data9.csv' WITH CSV HEADER;
COPY mock_data FROM '/docker-entrypoint-initdb.d/mock_data10.csv' WITH CSV HEADER;
