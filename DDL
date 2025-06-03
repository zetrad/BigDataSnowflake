CREATE TABLE dim_date (
    id SERIAL PRIMARY KEY,
    full_date DATE,
    year INT,
    month INT,
    day INT,
    day_of_week VARCHAR(15)
);

CREATE TABLE dim_customer (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    age INT,
    email VARCHAR(100),
    country VARCHAR(50),
    postal_code VARCHAR(20),
    pet_type VARCHAR(50),
    pet_name VARCHAR(50),
    pet_breed VARCHAR(50)
);

CREATE TABLE dim_seller (
    id SERIAL PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    country VARCHAR(50),
    postal_code VARCHAR(20)
);

CREATE TABLE dim_product (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    category VARCHAR(50),
    price NUMERIC(10,2),
    weight NUMERIC(10,2),
    color VARCHAR(30),
    size VARCHAR(20),
    brand VARCHAR(50),
    material VARCHAR(50),
    description TEXT,
    rating NUMERIC(3,2),
    reviews INT,
    release_date DATE,
    expiry_date DATE
);

CREATE TABLE dim_store (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    location VARCHAR(100),
    city VARCHAR(50),
    state VARCHAR(50),
    country VARCHAR(50),
    phone VARCHAR(20),
    email VARCHAR(100)
);

CREATE TABLE dim_supplier (
    id SERIAL PRIMARY KEY,
    name VARCHAR(100),
    contact VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(100),
    city VARCHAR(50),
    country VARCHAR(50)
);

-- Таблица фактов
CREATE TABLE sales_fact (
    id SERIAL PRIMARY KEY,
    sale_date_id INT,
    customer_id INT,
    seller_id INT,
    product_id INT,
    store_id INT,
    supplier_id INT,
    sale_quantity INT,
    sale_total_price NUMERIC(10,2),

    FOREIGN KEY (sale_date_id) REFERENCES dim_date(id),
    FOREIGN KEY (customer_id) REFERENCES dim_customer(id),
    FOREIGN KEY (seller_id) REFERENCES dim_seller(id),
    FOREIGN KEY (product_id) REFERENCES dim_product(id),
    FOREIGN KEY (store_id) REFERENCES dim_store(id),
    FOREIGN KEY (supplier_id) REFERENCES dim_supplier(id)
);
