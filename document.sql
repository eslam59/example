use Library_system;
create table Publisher (
Publisher_id int identity (1,1) not null primary key,
Publisher_Name varchar(60) not null,
Publisher_Address varchar(60) not null
);
create table Books (
Book_id int identity (1,1) not null primary key,
Book_Name varchar(60) not null,
Book_Author varchar(60) not null,
Price float not null,
Publisher_id int not null,
CONSTRAINT FK_Publisher FOREIGN KEY (Publisher_id) 
REFERENCES Publisher (Publisher_id),
);
create table Member (
Member_id int identity (1,1) not null primary key,
Member_Name varchar(60) not null,
Member_Address varchar(60) not null,
PhoneNO int not null,
);
Create table Buy(
id int identity (1,1) not null primary key ,
Buy_Date date not null,
Member_id int not null,
Book_id int not null,
CONSTRAINT FK_Books FOREIGN KEY (Book_id) 
REFERENCES Books (Book_id),
CONSTRAINT FK_Member FOREIGN KEY (Member_id) 
REFERENCES Member (Member_id),
);
INSERT INTO Publisher (Publisher_Name, Publisher_Address) 
VALUES('AhmedALi','elagmy');
INSERT INTO Publisher (Publisher_Name, Publisher_Address) 
VALUES('OmarMohamed','smoha');
INSERT INTO Publisher (Publisher_Name, Publisher_Address) 
VALUES('ALiOmar','sedi gaber');
INSERT INTO Publisher (Publisher_Name, Publisher_Address) 
VALUES('saad','Giza');
INSERT INTO Publisher (Publisher_Name, Publisher_Address) 
VALUES('Eslam','cairo');
INSERT INTO Books (Book_Name, Book_Author, Price, Publisher_id)
VALUES ('The science', 'Samy', 150, 1);
INSERT INTO Books (Book_Name, Book_Author, Price, Publisher_id)
VALUES ('The history', 'peter', 200, 2);
INSERT INTO Books (Book_Name, Book_Author, Price, Publisher_id)
VALUES ('The physics', 'hany', 600, 3);
INSERT INTO Books (Book_Name, Book_Author, Price, Publisher_id)
VALUES ('The Maths', 'Samir', 400, 4);
INSERT INTO Books (Book_Name, Book_Author, Price, Publisher_id)
VALUES ('The English', 'Serag', 500, 5);
INSERT INTO Member(Member_Name, Member_Address, PhoneNO)
VALUES ('talal', 'Sohag', 5577221);
INSERT INTO Member(Member_Name, Member_Address, PhoneNO)
VALUES ('elsayed', 'alexandria', 5454546);
INSERT INTO Member(Member_Name, Member_Address, PhoneNO)
VALUES ('samer', 'Sinai', 5678910);
INSERT INTO Member(Member_Name, Member_Address, PhoneNO)
VALUES ('gaber', 'Elharam',5478691 );
INSERT INTO Member(Member_Name, Member_Address, PhoneNO)
VALUES ('salma', 'cairo', 5123468);
INSERT INTO Buy (Buy_Date, Member_id, Book_id)
VALUES ('1-1-2020',1,1);
 INSERT INTO Buy (Buy_Date, Member_id, Book_id)
VALUES ('1-1-2020',1,2);
INSERT INTO Buy (Buy_Date, Member_id, Book_id)
VALUES ('1-2-2020',2,1);
INSERT INTO Buy (Buy_Date, Member_id, Book_id)
VALUES ('1-2-2020',2,2);
INSERT INTO Buy (Buy_Date, Member_id, Book_id)
VALUES ('1-3-2020',3,3);
INSERT INTO Buy (Buy_Date, Member_id, Book_id)
VALUES ('1-3-2020',3,4);
INSERT INTO Buy (Buy_Date, Member_id, Book_id)
VALUES ('1-4-2020',4,5);
INSERT INTO Buy (Buy_Date, Member_id, Book_id)
VALUES ('1-4-2020',4,1);
INSERT INTO Buy (Buy_Date, Member_id, Book_id)
VALUES ('1-5-2020',5,3);
INSERT INTO Buy (Buy_Date, Member_id, Book_id)
VALUES ('1-5-2020',5,1);
UPDATE publisher
SET Publisher_Name='Hamdy', Publisher_Address='cairo'
WHERE Publisher_id=1;
UPDATE publisher
SET Publisher_Name='samy', Publisher_Address='fayoum'
WHERE Publisher_id=2;
UPDATE Books
SET Book_Name='chemistry', Book_Author='Serag'
WHERE Book_id=1;
UPDATE Books
SET Book_Name='Math', Book_Author='diaa', Price=600
WHERE Book_id=5;
UPDATE Member
SET Member_Name='fathy', Member_Address='Serag'
WHERE Member_id=4;
UPDATE Member
SET Member_Name='hany', Member_Address='Serag' , PhoneNO=5865459
WHERE Member_id=5;
DELETE FROM publisher WHERE Publisher_Name='AhmedALi';
DELETE FROM Books WHERE Book_Name='The science';
DELETE FROM Member WHERE Member_Name='Salma';
DELETE FROM Buy WHERE Buy_Date='1-1-2020';
DELETE FROM Buy WHERE Buy_Date='1-2-2020';
Select count ( * )
From Publisher
Group by Publisher_id ;
Select count(Book_id)
from Books
Group by Book_Author
Having count(Book_id) >= 3 ;
SELECT * 
FROM Books 
WHERE 'Books_id' IN (SELECT 'Books_id'
FROM Books
WHERE Price > 500) ;
SELECT * 
FROM Buy 
WHERE id IN (SELECT id
FROM Buy
WHERE Member_id > 3) ;
SELECT * 
FROM Publisher
WHERE Publisher_id IN (SELECT Publisher_id
FROM Publisher
WHERE Publisher_Name > 'hamdy') ;
SELECT Books.Book_id, Publisher.Publisher_Name
FROM Books
INNER JOIN Publisher ON Books.Publisher_id = Publisher.Publisher_id;
SELECT Publisher.Publisher_Name, Books.Book_id
FROM Publisher
LEFT JOIN Books
ON Publisher.Publisher_id=Books.Publisher_id
ORDER BY Publisher.Publisher_Name;
SELECT Publisher.Publisher_id, Member.Member_Name, Member.Member_Address
FROM Publisher
RIGHT JOIN Member
ON Publisher.Publisher_id = Member.Member_id
ORDER BY Publisher.Publisher_id;
SELECT Books.Book_Name, Publisher.Publisher_id
FROM Books
FULL OUTER JOIN Publisher
ON Books.Book_id=Publisher.Publisher_id
ORDER BY Books.Book_Name;
SELECT Books.Book_id, Member.Member_Name
FROM Books, Member;  
SELECT * FROM Books;
SELECT * FROM Publisher;
SELECT * FROM Member;
SELECT * FROM Buy;     
SELECT *
FROM Publisher
Where Publisher_Name like 'E%';
SELECT Member_Address
FROM Member;
SELECT count(*)
FROM Books;
SELECT count(*)
FROM Buy;
SELECT MIN(price) As SmallestPrice 
FROM Books;
SELECT MAX(price) As LargestPrice 
FROM Books;
SELECT Publisher_Name, Publisher_id, Publisher_Address
FROM Publisher
WHERE Publisher_Address IS NULL;
SELECT AVG(Price)
FROM Books;
SELECT SUM(Book_id)
FROM Buy;
SELECT * 
FROM Buy
WHERE Buy_Date='1-5-2020';
SELECT *
FROM Member
WHERE Member_Address='alexandria' AND PhoneNO=5454546 ;
SELECT *
FROM Member
WHERE Member_Address='sohag' OR Member_Address='cairo' ;
SELECT * 
FROM Publisher
WHERE Publisher_Address IN ('somha', 'elagmy', 'cairo');
SELECT * 
FROM Books
WHERE Price BETWEEN 150 AND 600;
SELECT * 
FROM Books
WHERE Price NOT BETWEEN 200 AND 400;
SELECT TOP 3 * FROM Buy;
