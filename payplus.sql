-- DATABASE EXPENSE RECORD
CREATE TABLE expense (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    amount INT(11) NOT NULL,
    phone BIGINT(50) NOT NULL,
    receiver VARCHAR(100) NOT NULL,
    type ENUM('normal', 'gift') NOT NULL,
    date DATE NOT NULL,
    message TEXT DEFAULT NULL
);

-- DATABASE INCOME RECORD
CREATE TABLE income (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    amount INT(11) NOT NULL,
    phone BIGINT(50) NOT NULL,
    sender VARCHAR(100) NOT NULL,
    type ENUM('normal', 'gift', 'topup') NOT NULL,
    date DATE NOT NULL,
    message TEXT DEFAULT NULL
);

-- DATABASE SAVINGS
CREATE TABLE savings (
    id INT(11) NOT NULL PRIMARY KEY,
    phone BIGINT(50) NOT NULL,
    nama VARCHAR(255) NOT NULL,
    deskripsi TEXT DEFAULT NULL,
    target DOUBLE NOT NULL,
    terkumpul DOUBLE DEFAULT 0
);

-- DATABASE USERS
CREATE TABLE users (
    phone BIGINT(50) NOT NULL PRIMARY KEY,
    name VARCHAR(250) NOT NULL,
    email VARCHAR(250) NOT NULL,
    password VARCHAR(250) NOT NULL,
    role VARCHAR(250) NOT NULL,
    balance DOUBLE NOT NULL
);

-- Insert data into users
INSERT INTO users (phone, name, email, password, role, balance) VALUES
(6281301223169, 'Andre Aditya Amann', 'andre@gmail.com', '3169', 'bronze', 5300000),
(6281301223187, 'Zaidaan Afif Randih', 'zaidanrandih@gmail.com', '3187', 'gold', 100900002),
(6281301223393, 'Rafi Suwardana', 'rafisuwardana@gmail.com', '3393', 'bronze', 5000000),
(6281301223401, 'Fahri Adnan', 'fahri@gmail.com', '3401', 'silver', 7500000),
(6281301223412, 'Amelia Yusuf', 'amelia@gmail.com', '3412', 'gold', 15000000);

-- Insert data into expense
INSERT INTO expense (amount, phone, receiver, type, date, message) VALUES
(150000, 6281301223169, 'Ahmad', 'normal', '2024-12-01', NULL),
(50000, 6281301223187, 'Budi', 'gift', '2024-12-02', 'Hadiah ulang tahun untuk Budi'),
(200000, 6281301223393, 'Citra', 'normal', '2024-12-03', NULL),
(125000, 6281301223401, 'Eka', 'normal', '2024-12-05', NULL),
(300000, 6281301223412, 'Faisal', 'gift', '2024-12-06', 'Hadiah liburan untuk Faisal');

-- Insert data into income
INSERT INTO income (amount, phone, sender, type, date, message) VALUES
(250000, 6281301223169, 'Rama', 'normal', '2024-12-01', NULL),
(100000, 6281301223187, 'Siti', 'gift', '2024-12-02', 'Hadiah ulang tahun untuk Siti'),
(300000, 6281301223393, 'Dewantara', 'normal', '2024-12-03', NULL),
(175000, 6281301223401, 'Putri', 'normal', '2024-12-07', NULL),
(200000, 6281301223412, 'Bayu', 'gift', '2024-12-08', 'Hadiah khusus untuk Bayu');

-- Insert data into savings
INSERT INTO savings (id, phone, nama, deskripsi, target, terkumpul) VALUES
(1, 6281301223169, 'Beli motor', 'motor baru untuk kuliah', 20000000, 5000000),
(2, 6281301223187, 'Uang darurat', 'untuk keperluan mendadak', 10000000, 2500000),
(3, 6281301223393, 'Liburan', 'Tabungan untuk liburan ke luar negeri', 0, 1000000),
(4, 6281301223401, 'HP Samsung', 'Beli HP baru', 0, 9000000),
(5, 6281301223412, 'Motor', 'Beli motor buat orang tua', 10000000, 10000000);

-- Add foreign key to expense
ALTER TABLE expense
ADD CONSTRAINT fk_expense_user FOREIGN KEY (phone) REFERENCES users(phone);

-- Add foreign key to income
ALTER TABLE income
ADD CONSTRAINT fk_income_user FOREIGN KEY (phone) REFERENCES users(phone);

-- Add foreign key to savings
ALTER TABLE savings
ADD CONSTRAINT fk_savings_user FOREIGN KEY (phone) REFERENCES users(phone);