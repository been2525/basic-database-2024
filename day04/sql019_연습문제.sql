-- 연습문제 4
-- 1. 새로운 도서('스포츠 세계', '대한미디어', '10000')가 마당서점에 입고되었다. 삽입이 안될때 필요한 데이터가 더 있는지 찾아보시오.
-- bookid가 빠짐
INSERT INTO Book(bookname, publisher, price, bookid)
     VALUES('스포츠 세계', '대한미디어', 10000, 14)
-- 2. '삼성당'에서 출판한 도서를 삭제하시오.
DELETE FROM Book
 WHERE publisher = '삼성당';

-- 3. '이상미디어'에서 출판한 도서를 삭제하시오. 삭제가 안되면 원인을 생각해보시오.
-- 참조제약조건에 걸리기 때문에 삭제가 불가
-- 삭제하려면 Orders테이블에서 bookid 7, 8을 삭제 후 삭제 가능
DELETE FROM Book
 WHERE publisher = '이상미디어';


-- 4. 출판사 '대한미디어'를 '대한출판사'로 이름을 바꾸시오.
UPDATE Book
   SET publisher = (SELECT publisher
                      FROM Book
                     WHERE publisher = '대한출판사')
 WHERE publisher = '대한미디어';

 /*
 UPDATE Book
   SET publisher = '대한출판사'
 WHERE bookid IN (SELECT bookid
                    FROM Book
                   WHERE publisher = '대한미디어');
 */

-- 3.1. 박지성이 구매한 도서의 출판사와 같은 출판사에서 도서를 구매한 고객 이름
SELECT DISTINCT custid
  FROM Orders
 WHERE bookid IN (
SELECT bookid
  FROM Book
 WHERE publisher IN (SELECT b.publisher
                      FROM Customer AS c, Orders AS o, Book AS b
                     WHERE c.custid = o.custid
                       AND o.bookid = b.bookid
                       AND c.[name] = '박지성'));

-- 3.3. 전체 고객에서 30%이상이 구매한 도서
SELECT b.custid
     , CONVERT(float, b.custCount) / b.totalCount AS '구매율'
  FROM(SELECT custid
     , COUNT(custid) AS custCount
     , (SELECT COUNT(custid) FROM Orders) AS totalCount
          FROM Orders
         GROUP BY custid) AS b
 WHERE CONVERT(float, b.custCount) /b.totalCount >=0.3;