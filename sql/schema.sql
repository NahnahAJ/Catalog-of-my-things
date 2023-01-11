-- CREATE TABLE LABEL
DROP TABLE IF EXISTS LABEL;
CREATE TABLE LABEL (
 ID INT NOT NULL GENERATED ALWAYS AS IDENTITY,
 TITLE VARCHAR(80),
 COLOR VARCHAR(80),
 PRIMARY KEY (ID)
);

-- CREATE TABLE BOOKS
DROP TABLE IF EXISTS BOOK;
CREATE TABLE BOOK (
 ID INT NOT NULL GENERATED ALWAYS AS IDENTITY,
 PUBLISHER VARCHAR(80),
 COVER_STATE VARCHAR(80),
 ARCHIVED BOOLEAN,
 PUBLISH_DATE DATE,
 LABEL_ID INT,
 CONSTRAINT fk_label FOREIGN KEY (LABEL_ID) REFERENCES label (ID),
 PRIMARY KEY (ID)
);