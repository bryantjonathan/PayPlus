-- DATABASE EXPENSE RECORD
CREATE TABLE expense (
    id INT(11) AUTO_INCREMENT PRIMARY KEY,
    amount INT(11) NOT NULL,
    phone BIGINT(15) NOT NULL,
    receiver VARCHAR(100) NOT NULL,
    type ENUM('normal', 'gift') NOT NULL,
    date DATE NOT NULL,
    message TEXT DEFAULT NULL
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
    phone BIGINT(15) NOT NULL,
    sender VARCHAR(100) NOT NULL,
    type ENUM('normal', 'gift') NOT NULL,
    date DATE NOT NULL,
    message TEXT DEFAULT NULL
);


INSERT INTO income (amount, phone, sender, type, date, message) VALUES
(250000, '83824099809', 'Rama', 'normal', '2024-12-01', NULL),
(100000, '81234567890', 'Siti', 'gift', '2024-12-02', 'Hadiah ulang tahun untuk Siti'),
(300000, '81298765432', 'Dewantara', 'normal', '2024-12-03', NULL),
(150000, '81267854321', 'Kirana', 'gift', '2024-12-04', 'Hadiah pernikahan untuk Kirana'),
(350000, '83899988877', 'Bagas', 'gift', '2024-12-06', 'Hadiah liburan untuk Bagas'),
(175000, '81233344455', 'Putri', 'normal', '2024-12-07', NULL),
(200000, '83822211100', 'Bayu', 'gift', '2024-12-08', 'Hadiah khusus untuk Bayu'),
(120000, '83833322211', 'Amara', 'normal', '2024-12-09', NULL),
(60000, '81244455566', 'Agung', 'gift', '2024-12-10', 'Hadiah sederhana untuk Agung'),
(80000, '83811122233', 'Nisa', 'normal', '2024-12-05', NULL);

