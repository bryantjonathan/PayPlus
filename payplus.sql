-- DATABASE EXPENSE RECORD
CREATE TABLE expense (
    id INT AUTO_INCREMENT PRIMARY KEY,
    amount INT NOT NULL,
    phone VARCHAR(20),
    receiver VARCHAR(50),
    type VARCHAR(10),
    date DATE,
    message TEXT
);

-- Mengisi data
INSERT INTO expense (amount, phone, receiver, type, date, message) VALUES
(150000, '83824099809', 'Ahmad', 'normal', '2024-12-01', NULL),
(50000, '0', 'Budi', 'gift', '2024-12-02', 'Hadiah ulang tahun untuk Budi'),
(200000, '0', 'Citra', 'normal', '2024-12-03', NULL),
(100000, '0', 'Dewi', 'gift', '2024-12-04', 'Hadiah pernikahan untuk Dewi'),
(300000, '0', 'Faisal', 'gift', '2024-12-06', 'Hadiah liburan untuk Faisal'),
(125000, '0', 'Gita', 'normal', '2024-12-07', NULL),
(175000, '0', 'Hadi', 'gift', '2024-12-08', 'Hadiah khusus untuk Hadi'),
(100000, '0', 'Indra', 'normal', '2024-12-09', NULL),
(50000, '0', 'Joko', 'gift', '2024-12-10', 'Hadiah sederhana untuk Joko'),
(75000, '0', 'Eka', 'normal', '2024-12-05', NULL);


-- DATABASE INCOMERECORD
CREATE TABLE income (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    amount INT(11) NOT NULL,
    phone VARCHAR(20),
    receiver VARCHAR(50),
    type VARCHAR(10),
    date DATE NULL,
    message TEXT CHARACTER NULL
);

INSERT INTO income (id, amount, phone, receiver, type, date, message) VALUES
(1, 150000, '83824099809', 'Ahmad', 'normal', '2024-12-01', NULL),
(2, 50000, '0', 'Budi', 'gift', '2024-12-02', 'Hadiah ulang tahun untuk Budi'),
(3, 200000, '0', 'Citra', 'normal', '2024-12-03', NULL),
(4, 100000, '0', 'Dewi', 'gift', '2024-12-04', 'Hadiah pernikahan untuk Dewi'),
(5, 300000, '0', 'Faisal', 'gift', '2024-12-06', 'Hadiah liburan untuk Faisal'),
(6, 125000, '0', 'Gita', 'normal', '2024-12-07', NULL),
(7, 175000, '0', 'Hadi', 'gift', '2024-12-08', 'Hadiah khusus untuk Hadi'),
(8, 100000, '0', 'Indra', 'normal', '2024-12-09', NULL),
(9, 50000, '0', 'Joko', 'gift', '2024-12-10', 'Hadiah sederhana untuk Joko'),
(10, 75000, '0', 'Eka', 'normal', '2024-12-05', NULL);
