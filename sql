CREATE TABLE yazar (
    yazar_ID INT PRIMARY KEY NOT NULL,
    yazar_adi VARCHAR(100) NOT NULL,
    dogum_tarihi DATE
);

CREATE TABLE kitap (
    kitap_ID INT PRIMARY KEY NOT NULL,
    kitap_adi VARCHAR(100) NOT NULL,
    yayin_tarihi DATE,
    yazar_ID INT,
    FOREIGN KEY (yazar_ID) REFERENCES yazar(yazar_ID)
);

CREATE TABLE urun (
    urun_ID INT PRIMARY KEY NOT NULL,
    urun_adi VARCHAR(100) NOT NULL,
    urun_fiyati DECIMAL(10, 2) NOT NULL,
    kitap_ID INT,
    FOREIGN KEY (kitap_ID) REFERENCES kitap(kitap_ID)
);

CREATE TABLE kutuphane (
    kutuphane_adi VARCHAR(100),
    kutuphane_kitap_sayisi INT,
    kutuphane_konumu VARCHAR(100)
);

--  ----------------------------- VERi SiLME        i harfleri küçük yazdım bilerek yoksa görüntü kirliliği oluşuyor

INSERT INTO yazar (yazar_ID, yazar_adi, dogum_tarihi) VALUES 
(1, 'Lev Tolstoy','1828-09-09'),
(2, 'Victor Hugo','1802-02-26'),
(3, 'Franz Kafka','1883-07-03'),
(4, 'Anthony Burgess','1917-02-25'),
(5, 'George Orwell','1903-06-25');

INSERT INTO kitap (kitap_ID, kitap_adi, yayin_tarihi, yazar_ID) VALUES 
(101, 'insan Ne ile Yasar','1885-01-01', 1),
(102, 'Sefiller','1862-01-01',2),
(103, 'Dönüsüm','1915-01-01', 3),
(104, 'Otomatik Portakal','1962-01-01', 4),
(105, '1984','1949-06-08',5);

INSERT INTO urun (urun_ID, urun_adi, urun_fiyati, kitap_ID) VALUES 
(201, 'Felsefe Kitaplari', 78.49, 101),
(202, 'Korku Romanlari', 69.49, 102),
(203, 'Polisiye Romanlar', 59.99, 103),
(204, 'Çizgi Romanlar', 45.99, 104),
(205, 'Masal Kitaplari', 12.99, 105);

INSERT INTO kutuphane (kutuphane_adi, kutuphane_kitap_sayisi, kutuphane_konumu) VALUES 
('Bilgi Üniversitesi Kütüphanesi', 15000, 'istanbul'),
('sisli Devlet Kütüphanesi', 10000, 'istanbul'),
('istanbul Kütüphanesi', 5000, 'istanbul'),
('Atatürk Kütüphanesi', 20000, 'izmit'),
('Çocuk Kütüphanesi', 5000, 'Bursa');
--  ------------------------TABLOYA VERİ EKLEME 

INSERT INTO kutuphane (kutuphane_adi, kutuphane_kitap_sayisi, kutuphane_konumu) VALUES 
('Revaha Kütüphanesi', 99999, 'New Jersey'),
('SQL Kütüphanesi', 88888, 'New York');

INSERT INTO yazar (yazar_ID, yazar_adi, dogum_tarihi) VALUES 
(99, 'Revaha SQLSever', '2003-05-19'),
(98, 'Monkey D. Luffy', '1999-10-10');

-- ---------------------------TABLOYA VERi GÜNCELLEME

UPDATE yazar SET yazar_adi = 'Gol D. Roger'WHERE yazar_adi = 'Monkey D. Luffy';
UPDATE kutuphane SET kutuphane_kitap_sayisi = 11111 WHERE kutuphane_adi = 'SQL Kütüphanesi';

-----------------------------DELETE  iLE VERi SiLME

DELETE FROM kutuphane WHERE kutuphane_adi= 'Revaha Kütüphanesi';
-- ------------VIEW iLe GORUNTULEME                1.Soru


CREATE VIEW YazarKitapFiyat AS
SELECT y.yazar_adi, k.kitap_adi, u.urun_fiyati
FROM yazar y
JOIN kitap k ON y.yazar_ID = k.yazar_ID
JOIN urun u ON k.kitap_ID = u.kitap_ID;


-- ---------------------SP iLE VERi EKLEME             2. Ssoru

CREATE PROCEDURE UrunEkle
    @urunID INT,
    @urunAdi VARCHAR(100),
    @urunFiyati DECIMAL(10, 2),
    @kitapID INT
AS
BEGIN
    INSERT INTO urun (urun_ID, urun_adi, urun_fiyati, kitap_ID)
    VALUES (@urunID, @urunAdi, @urunFiyati, @kitapID);
END;


-- --------------------VERi GiRME

EXEC UrunEkle 206, 'Yeni Kitap', 99.99, 106;
CREATE TABLE kitap (
    kitap_ID INT PRIMARY KEY NOT NULL,
    kitap_adi VARCHAR(100) NOT NULL,
    yayin_tarihi DATE,
    yazar_ID INT,
    FOREIGN KEY (yazar_ID) REFERENCES yazar(yazar_ID)
);


CREATE TABLE urun (
    urun_ID INT PRIMARY KEY NOT NULL,
    urun_adi VARCHAR(100) NOT NULL,
    urun_fiyati DECIMAL(10, 2) NOT NULL,
    kitap_ID INT,
    FOREIGN KEY (kitap_ID) REFERENCES kitap(kitap_ID)
);


CREATE TABLE kutuphane (
    kutuphane_adi VARCHAR(100),
    kutuphane_kitap_sayisi INT,
    kutuphane_konumu VARCHAR(100)
);


INSERT INTO yazar (yazar_ID, yazar_adi, dogum_tarihi) VALUES 
(1, 'Lev Tolstoy','1828-09-09'),
(2, 'Victor Hugo','1802-02-26'),
(3, 'Franz Kafka','1883-07-03'),
(4, 'Anthony Burgess','1917-02-25'),
(5, 'George Orwell','1903-06-25');


INSERT INTO kitap (kitap_ID, kitap_adi, yayin_tarihi, yazar_ID) VALUES 
(101, 'insan Ne ile Yasar','1885-01-01', 1),
(102, 'Sefiller','1862-01-01',2),
(103, 'Dönüsüm','1915-01-01', 3),
(104, 'Otomatik Portakal','1962-01-01', 4),
(105, '1984','1949-06-08',5);


INSERT INTO urun (urun_ID, urun_adi, urun_fiyati, kitap_ID) VALUES 
(201, 'Felsefe Kitaplari', 78.49, 101),
(202, 'Korku Romanlari', 69.49, 102),
(203, 'Polisiye Romanlar', 59.99, 103),
(204, 'Çizgi Romanlar', 45.99, 104),
(205, 'Masal Kitaplari', 12.99, 105);


INSERT INTO kutuphane (kutuphane_adi, kutuphane_kitap_sayisi, kutuphane_konumu) VALUES 
('Bilgi Üniversitesi Kütüphanesi', 15000, 'istanbul'),
('SiSli Devlet Kütüphanesi', 10000, 'istanbul'),
('istanbul Kütüphanesi', 5000, 'istanbul'),
('Atatürk Kütüphanesi', 20000, 'izmit'),
('Çocuk Kütüphanesi', 5000, 'Bursa');


INSERT INTO kutuphane (kutuphane_adi, kutuphane_kitap_sayisi, kutuphane_konumu) VALUES 
('Revaha Kütüphanesi', 99999, 'New Jersey'),
('SQL Kütüphanesi', 88888, 'New York');


INSERT INTO yazar (yazar_ID, yazar_adi, dogum_tarihi) VALUES 
(99, 'Revaha SQLSever', '2003-05-19'),
(98, 'Monkey D. Luffy', '1999-10-10');


UPDATE yazar SET yazar_adi = 'Gol D. Roger'WHERE yazar_adi = 'Monkey D. Luffy';
UPDATE kutuphane SET kutuphane_kitap_sayisi = 11111 WHERE kutuphane_adi = 'SQL Kütüphanesi';


DELETE FROM kutuphane WHERE kutuphane_adi= 'Revaha Kütüphanesi';

-- ----------------------------------------------- Tabloyu Kayıt Ettikten Sonra Bunlar Çalıştırılabilir

CREATE VIEW YazarKitapFiyat AS
SELECT y.yazar_adi, k.kitap_adi, u.urun_fiyati
FROM yazar y
JOIN kitap k ON y.yazar_ID = k.yazar_ID
JOIN urun u ON k.kitap_ID = u.kitap_ID;


SELECT * FROM YazarKitapFiyat;


CREATE PROCEDURE KitapVeriGirisi
    @kitapID INT,
    @kitapAdi VARCHAR(100),
    @yayinTarihi DATE,
    @yazarID INT
AS
BEGIN
    INSERT INTO kitap (kitap_ID, kitap_adi, yayin_tarihi, yazar_ID)
    VALUES (@kitapID, @kitapAdi, @yayinTarihi, @yazarID);
END;
;


EXEC KitapVeriGirisi 106, 'Yeni Kitap', '2023-01-01', 1;	


