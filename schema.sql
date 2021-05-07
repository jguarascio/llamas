create database llamas;

use llamas;

create table book (
	id int primary key,
    barcode varchar(50) NOT NULL,
    external_id varchar(50),
    title varchar(500), # used in case no external source
    author varchar(100), # used in case no external source
    checkout_days int NOT NULL DEFAULT 10,
    checked_out varchar(1) NOT NULL DEFAULT 'F'
);

create table patron (
	id int primary key,
    barcode varchar(50) NOT NULL,
    first_name varchar(50) NOT NULL,
    last_name varchar(50) NOT NULL,
    email_address varchar(100)
);

create table checkout (
	id int primary key,
    book_id int NOT NULL,
    patron_id int NOT NULL,
    checkout_date date NOT NULL,
    due_date date NOT NULL,
    return_date date,
    foreign key (book_id) references book(id),
    foreign key (patron_id) references patron(id)
);
    