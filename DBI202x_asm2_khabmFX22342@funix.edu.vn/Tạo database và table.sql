create database mydb_asm2;

USE mydb_asm2;
CREATE TABLE MANAGERS (
	ID_MNG INT auto_increment NOT NULL PRIMARY KEY ,
	TEN VARCHAR(100),
	NAM_SINH YEAR 
);

CREATE TABLE REPOSTER (
	ID_REPOSTER INT auto_increment NOT NULL PRIMARY KEY,
	TEN VARCHAR(100) NOT NULL,
	NAM_SINH YEAR,
	TO_CHUC VARCHAR(100) 
	-- BẢNG PHÓNG VIÊN 
);

CREATE TABLE USER (
	ID_USER INT auto_increment NOT NULL  PRIMARY KEY ,
	ACCOUNT_NAME VARCHAR(100) NOT NULL,
	PASSWORD INT NOT NULL,
	FACEBOOK_USER VARCHAR(100) ,
	EMAIL_USER VARCHAR (100)
);

CREATE TABLE POST (
	ID_POST INT auto_increment NOT NULL PRIMARY KEY ,
	TIEU_DE VARCHAR(255) NOT NULL,
	NOI_DUNG TEXT(400) NOT NULL,
	IMAGE LONGBLOB ,
	TAC_GIA VARCHAR (100),
	LUOT_XEM INT ,
	XET_DUYET tinyint NOT NULL,
	THOI_GIAN_DANG DATE ,
    NGUOI_DUYET INT,
    NGUOI_DANG INT,
	FOREIGN KEY (NGUOI_DUYET) REFERENCES MANAGERS(ID_MNG),
	FOREIGN KEY (NGUOI_DANG) REFERENCES REPOSTER(ID_REPOSTER)
);

CREATE TABLE SHARE (
	ID_SHARE INT auto_increment NOT NULL PRIMARY KEY ,
	TIME_SHARE DATETIME(6),
    NGUOI_SHARE INT,
	FOREIGN KEY (NGUOI_SHARE) REFERENCES USER(ID_USER) 
);

CREATE TABLE COMMENT (
	ID_COMMENT INT auto_increment NOT NULL PRIMARY KEY,
	TIME_COMMENT DATETIME(6),
	NOI_DUNG TEXT(400),
    NGUOI_COMMENT INT,
	FOREIGN KEY (NGUOI_COMMENT) REFERENCES USER(ID_USER)
);

CREATE TABLE COMMENT_POST (
	ID_COMMENT INT NOT NULL, 
	ID_POST INT NOT NULL ,
	CONSTRAINT PK_COMMENT_POST PRIMARY KEY (ID_COMMENT,ID_POST),
    FOREIGN KEY (ID_COMMENT) REFERENCES COMMENT(ID_COMMENT),
	FOREIGN KEY (ID_POST) REFERENCES POST(ID_POST)
 );



CREATE TABLE SHARE_POST(
	ID_SHARE INT  NOT NULL,
	ID_POST INT  NOT NULL,
	CONSTRAINT PK_SHARE_POST PRIMARY KEY (ID_SHARE,ID_POST),
    FOREIGN KEY (ID_SHARE) REFERENCES SHARE(ID_SHARE),
    FOREIGN KEY (ID_POST) REFERENCES POST(ID_POST)
);
