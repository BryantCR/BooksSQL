CREATE DATABASE books_shema;

USE books_shema;

CREATE TABLE authors(
	authors_id INT PRIMARY KEY NOT NULL,
    authors_name VARCHAR(45) NOT NULL,
    created_at DATETIME,
    updated_at DATETIME
);
SELECT *
FROM authors;
CREATE TABLE books(
	books_id INT PRIMARY KEY NOT NULL,
    title VARCHAR(45) NOT NULL,
    num_of_pages INT NOT NULL,
    created_at DATETIME,
    updated_at DATETIME
);
SELECT *
FROM books;
CREATE TABLE favorites(
	authors_id INT NOT NULL,
    FOREIGN KEY (authors_id) 
		REFERENCES authors(authors_id)
        ON DELETE CASCADE,
	books_id INT NOT NULL,
    FOREIGN KEY (books_id) 
		REFERENCES books(books_id)
        ON DELETE CASCADE
);
SELECT *
FROM favorites;
/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
INSERT INTO books( books_id, title, num_of_pages, created_at, updated_at)
VALUES  ( 6, 'C Sharp', 357, SYSDATE(), SYSDATE() ),
		( 7, 'Java', 856, SYSDATE(), SYSDATE() ),
        ( 8, 'Python', 786, SYSDATE(), SYSDATE() ),
        ( 9, 'PHP', 504, SYSDATE(), SYSDATE() ),
        ( 10, 'Ruby', 472, SYSDATE(), SYSDATE() );
        
INSERT INTO authors( authors_id, authors_name, created_at, updated_at)
VALUES  ( 1, 'Jane Austen', SYSDATE(), SYSDATE() ),
		( 2, 'Emily Dickinson', SYSDATE(), SYSDATE() ),
        ( 3, 'Fyodor Dostoevsky', SYSDATE(), SYSDATE() ),
        ( 4, 'William Shakespeare', SYSDATE(), SYSDATE() ),
        ( 5, 'Lau Tzu', SYSDATE(), SYSDATE() );
        
INSERT INTO favorites( authors_id, books_id)
VALUES  ( 1, 6 ),
		( 1, 7 ),
		( 2, 6 ),
        ( 2, 7 ),
        ( 2, 8 ),
        ( 3, 6 ),
        ( 3, 7 ),
        ( 3, 8 ),
        ( 3, 9 ),
        ( 4, 6 ),
        ( 4, 7 ),
        ( 4, 8 ),
        ( 4, 9 ),
        ( 4, 10 ),
        ( 5, 7 );
        
/*DROP TABLE favorites;*/

/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
SELECT *
FROM books
WHERE books_id = 6;

UPDATE books
SET title = 'C#'
WHERE  books_id = 6;
/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/
UPDATE authors
SET authors_name = 'Bill Shakespeare'
WHERE  authors_id = 4;
/*////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////////*/

SELECT *
FROM favorites
WHERE books_id = 8;

SELECT *
FROM authors LEFT JOIN favorites ON favorites.authors_id = authors.authors_id
WHERE books_id = 8;

DELETE 
FROM favorites /*LEFT JOIN favorites ON favorites.authors_id = authors.authors_id*/
WHERE books_id = 8 AND authors_id = 2;

SELECT *
FROM books LEFT JOIN favorites ON favorites.books_id = books.books_id
WHERE authors_id = 3;

SELECT *
FROM authors LEFT JOIN favorites ON favorites.authors_id = authors.authors_id
WHERE books_id = 10;
