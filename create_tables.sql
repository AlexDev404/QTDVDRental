CREATE TABLE IF NOT EXISTS users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    userName VARCHAR(255) NOT NULL,
    firstName VARCHAR(255) NOT NULL,
    lastName VARCHAR(255) NOT NULL,
    sk VARCHAR(255) NOT NULL,
    addr VARCHAR(255) NOT NULL,
    role TINYINT(1) NOT NULL
);

CREATE TABLE IF NOT EXISTS categories (
    id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(255) NOT NULL,
    descr TEXT NOT NULL
);

CREATE TABLE IF NOT EXISTS products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    c_id INT NOT NULL,
    name VARCHAR(255) NOT NULL,
    descr TEXT NOT NULL,
    rnt_status TINYINT(1) NOT NULL,
    type TINYINT(1) NOT NULL,
    price DECIMAL(10, 2) NOT NULL,
    rating DECIMAL(2, 1) NOT NULL,
    FOREIGN KEY (c_id) REFERENCES categories(id)
);


CREATE TABLE IF NOT EXISTS rentals (
    id INT AUTO_INCREMENT PRIMARY KEY,
    product INT NOT NULL,
    returned_at BIGINT NOT NULL,
    rented_at BIGINT NOT NULL,
    is_due_at BIGINT NOT NULL,
    charge DECIMAL(10, 2) NOT NULL,
    user INT NOT NULL,
    FOREIGN KEY (product) REFERENCES products(id),
    FOREIGN KEY (user) REFERENCES users(id)
);
