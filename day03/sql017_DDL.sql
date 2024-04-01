-- DDL - 데이터 정의 언어
-- 객체 생성, 수정, 삭제

-- 1. NewBook이라는 테이블 생성하라
/*
    bookid(도서번호 : 기본키) - int
    bookname(도서이름) - varchar(20)
    publisher(출판사) - varchar(20)
    price(가격) - int

    -- 타입종류
    INT[정수], BIGINT[큰정수], BINARY(50)[이진데이터], BIT[0|1], CHAR(n)[고정문자], VARCHAR(n)[가변문자열], NVARCHAR(n)[유니코드], N- [유니코드],
    ex(username : CHAR(10)/VARCHAR(10) ) 'hugo'
    CHAR(10) = 'hugo        ' 이름ㅇ르 넣고 10개의 자리중 빈곳은 전부 스페이스 입력 ' '
    VARCHAR(10) = 'hugo' 이름을 넣고 10개의 자리중 빈곳은 전부 없앰
    DATE[날짜], DATETIME[날짜시간], DECIMAL(18, 0)[소수점표현실수], FLOAT[실수],
    IMAGE[이미지바이너리], SMALLINT[255가지의 정수], TEXT[2GB까지의 텍스트], NTEXT[유니코드 2G]

    -- 가장 많이 쓰는 타입
    INT, CHAR, VARCHAR, DECIMAL, FLOAT, TEXT 외에는 잘 안씀
*/
DROP TABLE NewBook; -- 테이블 삭제

CREATE TABLE NewBook(
    bookid INT,
    bookname VARCHAR(20),
    publisher VARCHAR(20),
    price INT
    PRIMARY KEY (bookid) -- 기본키로 bookid 지정
);

-- 기본키를 통합
CREATE TABLE NewBook(
    bookid INT PRIMARY KEY,
    bookname VARCHAR(20),
    publisher VARCHAR(20),
    price INT
    PRIMARY KEY (bookid) -- 기본키로 bookid 지정
);

-- 기본키가 두개이상이면
CREATE TABLE NewBook(
    bookid INT,
    bookname VARCHAR(20),
    publisher VARCHAR(20),
    price INT
    PRIMARY KEY(bookid, bookname) -- 기본키를 두개이상
);

-- 각 컬럼에 제약조건을 걸면
CREATE TABLE Newbook(
    bookname VARCHAR(20) NOT NULL,
    publisher VARCHAR(20) UNIQUE, -- 유니크 제약조건
    price INT DEFAULT 10000 CHECK(price > 1000)  -- 기본값 제약조건, 체크 제약조건
    PRIMARY KEY (bookname, publisher) -- 개체 무결성 제약조건
);

-- 새 고객테이블(기본키)
CREATE TABLE NewCustomer(
    custid INT PRIMARY KEY,
    custname VARCHAR(40),
    custaddress VARCHAR(255),
    phone VARCHAR(30)
);

-- 새 주문테이블(기본키 + 외래키)
CREATE TABLE NewOrder(
    orderid INT,
    custid INT NOT NULL,
    bookid INT NOT NULL,
    saleprice INT,
    orderdate DATE,
    PRIMARY KEY (orderid),
    FOREIGN KEY (custid) REFERENCES NewCustomer(custid)ON DELETE CASCADE
);

-- 2. 테이블 변경/수정 ALTER
CREATE TABLE myBook(
    bookid INT,
    bookname VARCHAR(20),
    publisher VARCHAR(20),
    price INT
);

-- MyBook에 isbn이란느 컬럼을 추가
ALTER TABLE myBook ADD isbn VARCHAR(13);

-- isbn을 INT형으로 변경
ALTER TABLE myBook ALTER COLUMN isbn INT;

-- isbn을 컬럼 삭제
ALTER TABLE myBook DROP COLUMN isbn;

-- bookname을 NOT NULL로 제약조건 적용
ALTER TABLE myBook ALTER COLUMN bookname INT NOT NULL;

-- bookid에 기본키 설정
ALTER TABLE myBook ALTER COLUMN bookid INT NOT NULL;
ALTER TABLE myBook ADD PRIMARY KEY(bookid);

-- 3. 테이블 삭제
DROP TABLE myBook;

-- 자식테이블을 삭제하기 전에는 절대 안지워짐
DROP TABLE NewOrder; -- 이거 지워야 밑에꺼도 지워짐
DROP TABLE NewCustomer; -- 안지워짐 -> NewOrder에서 사용중이기 때문

DROP TABLE NewBook;