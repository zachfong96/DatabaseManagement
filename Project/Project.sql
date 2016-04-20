CREATE TABLE Movies (
	mid char(4) not null,
	cid char(4) not null references Condition(cid),  
	gid char(4) not null references Genre(gid),
	yearreleased timestamp,
	title text,
	rentprice decimal (12,2),
	saleprice decimal(12,2),
PRIMARY KEY (mid)
);

CREATE TABLE Condition (
	cid char(4) not null,
	description text,
PRIMARY KEY (cid)
);

CREATE TABLE Genre (
	gid char(4) not null,
	description text,
PRIMARY KEY (gid)
);

CREATE TABLE Actors (
	aid char(4) not null,
	gender text,
	fname text,
	lname text,
PRIMARY KEY (aid)
);

CREATE TABLE RentStatus (
	status_id char(4) not null,
	description text,
PRIMARY KEY(status_id)
);



CREATE TABLE Cust_rentals (
	rid char(4) not null,
	cust_id char(4) not null references Customers(cust_id),
	mid char(4) not null references Movies(mid),
	status_id char(4) not null references RentStatus(status_id),
	dayrented timestamp not null,
	dayreturned timestamp,
PRIMARY KEY(rid)
);



CREATE TABLE Customers (
	cust_id char(4) not null,
	cname text,
	address text,
	phone bigint not null,
	email text,
PRIMARY KEY (cust_id)
);



CREATE TABLE Accounts (
	account_id char(4) not null,
	cust_id char(4) not null references Customers(cust_id),
	method_id char(4) not null references PaymentMethod(method_id),
	account_name text,
PRIMARY KEY (account_id)
);



CREATE TABLE PaymentMethod (
	method_id char(4) not null,
	description text,
PRIMARY KEY (method_id)
);



CREATE TABLE Payment (
	pid char(4) not null,
	account_id char(4) not null references Accounts(account_id),
	rid char(4) not null references Cust_rentals(rid),
	paymentdate timestamp,
	paymentamount decimal (12,2),
PRIMARY KEY (pid)
);

--SQL Conditions Insert Statements--
Select *
From Condition;

INSERT INTO Condition(cid, description)
	Values ('c001', 'good');

INSERT INTO Condition(cid, description)
	Values ('c002', 'bad');

INSERT INTO Condition(cid, description)
	Values ('c003', 'ok');

INSERT INTO Condition(cid, description)
	Values ('c004', 'good');

INSERT INTO Condition(cid, description)
	Values ('c005', 'ok');
--SQL Genre Insert Statements--
Select *
From Genre;

INSERT INTO Genre(gid, description)
	Values ('g001','Action');

INSERT INTO Genre(gid, description)
	Values ('g002','Action');

INSERT INTO Genre(gid, description)
	Values ('g003','Action');

INSERT INTO Genre(gid, description)
	Values ('g004','Comedy');

INSERT INTO Genre(gid, description)
	Values ('g005','Comedy');
	
--SQL Movie Insert Statements--
INSERT INTO Movies(mid, cid, gid, yearreleased, title, rentprice, saleprice)
	VALUES ('m001', 'c001','g001','2008-05-02','Iron Man', '5.00', '12.00');

INSERT INTO Movies(mid, cid, gid, yearreleased, title, rentprice, saleprice)
	VALUES ('m002', 'c002','g001','2008-05-02','Avengers', '8.00', '15.00');

INSERT INTO Movies(mid, cid, gid, yearreleased, title, rentprice, saleprice)
	VALUES ('m003', 'c003','g001','2008-05-02','Guardians of the Galazy', '6.00', '13.00');

INSERT INTO Movies(mid, cid, gid, yearreleased, title, rentprice, saleprice)
	VALUES ('m004', 'c004','g001','2008-05-02','Deadpool', '9.00', '17.00');

INSERT INTO Movies(mid, cid, gid, yearreleased, title, rentprice, saleprice)
	VALUES ('m005', 'c005','g001','2008-05-02','Kung Fu Panda', '2.00', '6.00');

--SQL Actor Insert Statements--
Select *
From Actors;
INSERT INTO Actors(aid, gender, fname, lname)
	Values('a001', 'male', 'Robert', 'Downey Jr.');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a002', 'male', 'Terrence', 'Howard');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a003', 'male', 'Jeff', 'Bridges');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a004', 'male', 'Shaun', 'Toub');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a005', 'male', 'Faran', 'Tahir');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a006', 'male', 'Chris', 'Evans');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a007', 'male', 'Mark', 'Ruffalo');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a008', 'male', 'Chris', 'Hemsworth');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a009', 'female', 'Scarlett', 'Johansson');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a010', 'male', 'Jeremy', 'Renner');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a011', 'male', 'Tom', 'Hiddleston');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a012', 'male', 'Clark', 'Gregg');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a013', 'male', 'Samuel', 'Jackson');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a014', 'male', 'Chris', 'Pratt');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a015', 'female', 'Zoe', 'Saldana');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a016', 'male', 'Dave', 'Bautsta');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a017', 'male', 'Vin', 'Diesel');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a018', 'male', 'Bradley', 'Cooper');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a019', 'male', 'Lee', 'Pace');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a020', 'male', 'Michael', 'Rooker');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a021', 'female', 'Karen', 'Gillian');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a022', 'male', 'Ryan', 'Reynolds');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a023', 'female', 'Karan', 'Soni');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a024', 'male', 'Ed', 'Skrein');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a025', 'male', 'Michael', 'Benyaer');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a026', 'male', 'Stefan', 'Kapicic');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a027', 'female', 'Brianna', 'Hildebrand');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a028', 'male', 'Jack', 'Black');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a029', 'male', 'Bryan', 'Cranston');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a030', 'male', 'Dustin', 'Hoffman');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a031', 'female', 'Angelina', 'Jolie');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a032', 'male', 'J.K', 'Simmons');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a033', 'male', 'Jackie', 'Chan');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a034', 'male', 'Seth', 'Rogan');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a035', 'female', 'Lucy', 'Liu');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a036', 'male', 'David', 'Cross');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a037', 'female', 'Kate', 'Hudson');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a038', 'male', 'James', 'Hong');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a039', 'male', 'Randall', 'Duk Kim');

INSERT INTO Actors(aid, gender, fname, lname)
	Values('a040', 'male', 'Steele', 'Gagnon');

--SQL Insert for RentStatus
INSERT INTO RentStatus(status_id, description)
	Values('r001','paid');

INSERT INTO RentStatus(status_id, description)
	Values('r002','paid');

INSERT INTO RentStatus(status_id, description)
	Values('r003',' not paid');

INSERT INTO RentStatus(status_id, description)
	Values('r004','paid');

INSERT INTO RentStatus(status_id, description)
	Values('r005','paid');

Select *
From RentStatus;

--SQL Customer Insert Statments--
INSERT INTO Customers(cust_id, cname, address, phone, email)
	Values('u001', 'James', '3194 Ivy Lane North Attleboro, MA 02760', '5556768888', 'ilikepie@hotmail.com');

INSERT INTO Customers(cust_id, cname, address, phone, email)
	Values('u002', 'Vincent', '935 Church Street South Peachtree City, GA', '2346781423', 'ajerk@hotmail.com');

INSERT INTO Customers(cust_id, cname, address, phone, email)
	Values('u003', 'Zach', '219 Jackson Avenue PLattsburgh, NY', '9083451347', 'mice@yahoo.com');

INSERT INTO Customers(cust_id, cname, address, phone, email)
	Values('u004', 'Robert', '5807 Hartford Road Manassas, VA', '7652323145', 'bigfoot@gmail.com');

INSERT INTO Customers(cust_id, cname, address, phone, email)
	Values('u005', 'Tyler', '288 2nd Street West Hartford, CT', '7665238724', 'hairfeet@gmail.com');
Select *
From Customers;

--SQL PaymentMethod Insert Statements--


INSERT INTO PaymentMethod(method_id, description)
	Values('e001', 'cash' );

INSERT INTO PaymentMethod(method_id, description)
	Values('e002', 'credit card' );

INSERT INTO PaymentMethod(method_id, description)
	Values('e003', 'debit card' );

INSERT INTO PaymentMethod(method_id, description)
	Values('e004', 'cash' );

INSERT INTO PaymentMethod(method_id, description)
	Values('e005', 'debit card' );

Select *
From PaymentMethod;

--SQL Accounts Insert Statements--

INSERT INTO Accounts(account_id, cust_id, method_id, account_name)
	Values('s001', 'u001', 'e001', 'catzrcool');

INSERT INTO Accounts(account_id, cust_id, method_id, account_name)
	Values('s002', 'u002', 'e002', 'neah12314');

INSERT INTO Accounts(account_id, cust_id, method_id, account_name)
	Values('s003', 'u003', 'e003', 'booksforlyfe');

INSERT INTO Accounts(account_id, cust_id, method_id, account_name)
	Values('s004', 'u004', 'e004', 'legiontitan');

INSERT INTO Accounts(account_id, cust_id, method_id, account_name)
	Values('s005', 'u005', 'e005', 'girraffeatk');

Select *
From Accounts;

--SQL Cust_rentals Insert Statements--
INSERT INTO Cust_rentals(rid,cust_id,mid,status_id,dayrented,dayreturned)
	Values('y001', 'u001', 'm001', 'r001','2015-04-3', '2015-04-13');

INSERT INTO Cust_rentals(rid,cust_id,mid,status_id,dayrented,dayreturned)
	Values('y002', 'u002', 'm002', 'r002','2016-08-3', '2016-08-13');

INSERT INTO Cust_rentals(rid,cust_id,mid,status_id,dayrented,dayreturned)
	Values('y003', 'u003', 'm003', 'r003','2019-09-3', NULL);

INSERT INTO Cust_rentals(rid,cust_id,mid,status_id,dayrented,dayreturned)
	Values('y004', 'u004', 'm004', 'r004','2016-10-3', '2016-10-13');

INSERT INTO Cust_rentals(rid,cust_id,mid,status_id,dayrented,dayreturned)
	Values('y005', 'u005', 'm005', 'r005','2015-12-3', '2015-12-13');

Select *
From Cust_rentals;

--SQL Payment Insert Statements--

INSERT INTO Payment(pid, account_id,rid, paymentdate, paymentamount)
	Values('p001', 's001', 'y001', '2015-04-13', '5.00');

INSERT INTO Payment(pid, account_id,rid, paymentdate, paymentamount)
	Values('p002', 's002', 'y002', '2016-08-13', '8.00');

INSERT INTO Payment(pid, account_id,rid, paymentdate, paymentamount)
	Values('p003', 's003', 'y003', '2019-09-13', NULL);

INSERT INTO Payment(pid, account_id,rid, paymentdate, paymentamount)
	Values('p004', 's004', 'y004', '2016-10-13', '9.00');

INSERT INTO Payment(pid, account_id,rid, paymentdate, paymentamount)
	Values('p005', 's005', 'y005', '2015-12-13', '2.00');

Select *
From Payment;

--Views--
CREATE OR REPLACE VIEW PayStatus AS 
	Select paymentdate, paymentamount,account_id
	From Payment;

Select *
From PayStatus;


CREATE OR REPLACE VIEW CustomerRoster AS
	Select cust_id, cname, phone, email, address
	FROM Customers
	ORDER BY cname ASC;

Select *
From CustomerRoster;

CREATE OR REPLACE VIEW MissingMovies AS
	SELECT dayreturned, mid
	FROM cust_rentals
	WHERE dayreturned is NULL;

Select*
From MissingMovies;

--Reports--
Select SUM(paymentamount) AS SUMIncome
From Payment
Where paymentamount is not null;

Select AVG(paymentamount) AS AVGIncome
From Payment
Where paymentamount is not null;