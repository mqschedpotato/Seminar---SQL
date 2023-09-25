CREATE DATABASE Seminar
USE Seminar

CREATE TABLE MsCustomer (
 CustomerID CHAR(5) CHECK (CustomerID LIKE 'CS[0-9][0-9][0-9]') NOT NULL,
 CustomerName VARCHAR(255) NOT NULL,
 CustomerDOB DATE,
 CustomerGender VARCHAR(50) CHECK (CustomerGender LIKE 'Male' OR CustomerGender LIKE 'Female'),
 CustomerPhone VARCHAR(50) NOT NULL,

 PRIMARY KEY (CustomerID)
)
CREATE TABLE MsPayment (
 PaymentID CHAR(5) PRIMARY KEY CHECK(PaymentID LIKE 'PM[0-9][0-9][0-9]')  NOT NULL,
 PaymentTypeName Varchar(20) NOT NULL

)
CREATE TABLE MsInstitution(
 InstitutionID CHAR(5) PRIMARY KEY CHECK (InstitutionID LIKE 'IS[0-9][0-9][0-9]') NOT NULL,
 InstitutionName VARCHAR(125) NOT NULL,
 InstitutionEmail VARCHAR(125) CHECK (InstitutionEmail LIKE '%@%') NOT NULL,
 InstitutionAddress VARCHAR(125) NOT NULL,
 InstituionPhone VARCHAR(50) NOT NULL
)
CREATE TABLE trTransactionHeader (
 TransactionID CHAR(5) PRIMARY KEY CHECK(TransactionID LIKE 'TR[0-9][0-9][0-9]'),
 CustomerID CHAR(5) FOREIGN KEY REFERENCES MsCustomer(CustomerID),
 PaymentID CHAR(5) FOREIGN KEY REFERENCES MsPayment(PaymentID),
 TransactionDate DATE NOT NULL
);CREATE TABLE MsSeminar (
 SeminarID CHAR(5) PRIMARY KEY CHECK (SeminarID LIKE 'SM[0-9][0-9][0-9]') NOT NULL,
 SeminarName VARCHAR(255) NOT NULL,
 SeminarDate DATE NOT NULL,
 SeminarCategory VARCHAR(125) NOT NULL,
 Quota INT NOT NULL,
 Price INT NOT NULL,
 InstitutionID CHAR(5) FOREIGN KEY REFERENCES MsInstitution(InstitutionID)
)
CREATE TABLE trTransactionDetail (
 TransactionID CHAR(5) FOREIGN KEY REFERENCES trTransactionHeader(TransactionID),
 SeminarID CHAR(5) FOREIGN KEY REFERENCES MsSeminar(SeminarID),
 Quantity int NOT NULL,
 PRIMARY KEY (TransactionID, SeminarID)
)

INSERT INTO MsPayment VALUES
('PM001','Bank Central Asia'),
('PM002','Bnk RAkyat Indonesia'),
('PM003','DANA'),
('PM004','OVO'),
('PM005','CIMB Niaga'),
('PM006','Bukopin'),
('PM007','OCBC NISP '),
('PM008','Bank Mega'),
('PM009','Bank Sinarmas'),
('PM0010','Bank Permata')

INSERT INTO MsCustomer VALUES
('CS001','Antonio Rovargo','2002-02-02','Male','082109988237'),
('CS002','Olivia Rodrigo','2001-12-11','Female','082109981092'),
('CS003','Anton Selamet','2000-11-14','Male','082109619283'),
('CS004','Ria Sukma Wijaya','2000-08-08','Female','082196000000'),
('CS005','Catherine Benedeicta','2001-01-01','Female','082189017263'),
('CS006','Rafi Muhammad','2001-03-03','Male','081298273618'),
('CS007','Umar Sidiq','2002-12-28','Male','081189201762'),
('CS008','Aditya Chandi','2002-02-19','Male','082198811642'),
('CS009','Sekar Asalea','2002-05-27','Female','08211199007722'),
('CS010','Annisa Haycal','2001-07-12','Female','082208937162'),
('CS011','Willow Chan','2002-08-18','Male','085796002200'),
('CS012','Momong Ohayo','2002-09-25','Female','082391028361'),
('CS013','Chow Khou','2002-10-19','Male','081289263718'),
('CS014','Aradi Amansyah','2002-11-01','Male','081289201781'),
('CS015','Amanda Gouw','2002-05-18','Female','081178102967'),
('CS016','Devin Augustin','2002-09-11','Male','081189200900'),
('CS017','Vika Valencia','2002-05-13','Female','082389102671'),
('CS018','Nicholaus','2002-11-12','Male','085701829374'),
('CS019','Kania Agatha','2002-08-17','Female','081199007722'),
('CS020','Patrick Jonathan','2001-09-13','Male','081100227788')

INSERT INTO MsInstitution VALUES
('IS001', 'Markplus Institute', 'contact@markplusinstitute.com', 'Jl. Casablanca Raya, Jakarta Selatan', '098761234589'),
('IS002', 'Pemimpin.id', 'contact@pemimpin.id', 'Jl. Melawai No. 9, Jakarta Selatan', '098761123459'),
('IS003', 'Youth of ID', 'youthofid@gmail.com', 'Jl. Malioboro No.15A, Jogja', '091541234339'),
('IS004', 'Sertifikasiku', 'sertifikasi@gmail.com', 'Jl. merdeka No. 22C, Bogor', '014284003453'),
('IS005', 'RevoU', 'revou@gmail.com', 'Jl. Sudirman no.245, Jakarta Pusat', '0567766781189')

INSERT INTO MsSeminar VALUES
('SM001', 'Introduction to Data Science', '2022-09-20', 'Science & Tech', '1000', '20000', 'IS001'),
('SM002', 'Introduction to Artificial Intelligence', '2022-05-30', 'Science & Tech', '900', '35000', 'IS001'),
('SM003', 'Why Data Analytics?', '2022-08-03', 'Science & Tech', '500', '20000', 'IS001'),
('SM004', 'We Are The Futures : Why We Protect Our Culture?', '2022-01-31', 'Community', '2000', '15000', 'IS005'),
('SM005', 'TikTok V Reels - The Battle For Fashion', '2022-03-30', 'Fashion', '1000', '20000', 'IS002'),
('SM006', 'Bake And Feel The Love', '2023-01-20', 'Food & Drink', '600', '30000', 'IS003'),
('SM007', 'Find Your Style', '2022-06-24', 'Fashion', '500', '0', 'IS002'),
('SM008', 'Pop History', '2022-05-03', 'Music', '1000', '0', 'IS004'),
('SM009', 'Can we Arbitrate Space Collision Cases?', '2023-05-05', 'Science & Tech', '2000', '10000', 'IS001'),
('SM010', 'We The Medicine - Healing Our Inner Child 2022', '2022-12-01', 'Health', '1900', '25000', 'IS005')

INSERT INTO trTransactionHeader VALUES
('TR001', 'CS001', 'PM001', '2022-01-01'),
('TR002', 'CS002', 'PM001', '2022-02-05'),
('TR003', 'CS003', 'PM001', '2022-02-06'),
('TR004', 'CS004', 'PM001', '2022-02-06'),
('TR005', 'CS005', 'PM002', '2022-02-10'),
('TR006', 'CS006', 'PM005', '2022-02-12'),
('TR007', 'CS007', 'PM003', '2022-02-15'),
('TR008', 'CS008', 'PM007', '2022-02-20'),
('TR009', 'CS009', 'PM010', '2022-03-01'),
('TR010', 'CS010', 'PM003', '2022-03-05'),
('TR011', 'CS011', 'PM002', '2022-03-06'),
('TR012', 'CS012', 'PM008', '2022-03-07'),
('TR013', 'CS013', 'PM004', '2022-03-10'),
('TR014', 'CS014', 'PM006', '2022-03-15'),
('TR015', 'CS015', 'PM009', '2022-03-16'),
('TR016', 'CS016', 'PM001', '2022-03-20'),
('TR017', 'CS017', 'PM009', '2022-03-22'),
('TR018', 'CS018', 'PM002', '2022-03-25'),
('TR019', 'CS019', 'PM001', '2022-03-30'),
('TR020', 'CS020', 'PM001', '2022-03-31'),
('TR021', 'CS005', 'PM001', '2022-04-01'),
('TR022', 'CS010', 'PM005', '2022-04-02'),
('TR023', 'CS015', 'PM001', '2022-04-10'),
('TR024', 'CS007', 'PM001', '2022-04-15'),
('TR025', 'CS012', 'PM006', '2022-04-17'),
('TR026', 'CS019', 'PM001', '2022-05-10'),
('TR027', 'CS020', 'PM002', '2022-05-15'),
('TR028', 'CS001', 'PM001', '2022-06-01'),
('TR029', 'CS004', 'PM009', '2022-06-08'),
('TR030', 'CS018', 'PM001', '2022-06-20')

INSERT INTO trTransactionDetail VALUES
('TR001', 'SM001', 1),
('TR001', 'SM005', 1),
('TR002', 'SM001', 5),
('TR003', 'SM007', 2),
('TR004', 'SM003', 3),
('TR004', 'SM002', 4),
('TR005', 'SM010', 8),
('TR006', 'SM002', 7),
('TR007', 'SM005', 1),
('TR008', 'SM001', 4),
('TR008', 'SM006', 7),
('TR009', 'SM009', 6),
('TR010', 'SM003', 2),
('TR011', 'SM005', 10),
('TR012', 'SM008', 3),
('TR013', 'SM007', 9),
('TR013', 'SM004', 4),
('TR014', 'SM001', 1),
('TR015', 'SM009', 8),
('TR016', 'SM010', 2),
('TR017', 'SM010', 3),
('TR018', 'SM006', 5),
('TR019', 'SM008', 5),
('TR020', 'SM006', 5),
('TR021', 'SM003', 1),
('TR022', 'SM001', 9),
('TR023', 'SM010', 1),
('TR024', 'SM006', 3),
('TR025', 'SM004', 5),
('TR026', 'SM005', 6),
('TR027', 'SM003', 2),
('TR028', 'SM010', 8),
('TR029', 'SM002', 7),
('TR029', 'SM007', 7),
('TR030', 'SM005', 3),
('TR031', 'SM002', 2),
('TR032', 'SM005', 4),
('TR033', 'SM006', 1),
('TR034', 'SM009', 1),
('TR035', 'SM010', 2)

--Membuat view untuk melihat semua seminar (nama, tanggal, harga dan lembaganya) dengan kategori Science dan Technology

CREATE VIEW ScienceTechSeminar AS
	SELECT 
		[Name] = SeminarName,
		[Date] = SeminarDate,
		[Price] = Price,
		[Institution] = InstitutionName
	FROM MsSeminar ms
	JOIN MsInstitution mi ON mi.InstitutionID = ms.InstitutionID
	WHERE SeminarCategory LIKE 'Science & Tech'

SELECT * FROM ScienceTechSeminar