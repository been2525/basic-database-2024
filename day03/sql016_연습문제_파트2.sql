-- 1. 주문하지 않은 고객의 이름(서브쿼리 사용)
SELECT [name]
  FROM Customer
EXCEPT
SELECT[name]
  FROM Customer
 WHERE custid IN (SELECT DISTINCT custid FROM Orders)

 /*
SELECT [name]
  FROM Customer
 WHERE custid NOT IN (SELECT DiSTINCT custid
                    FROM Orders);
 */
-- 2. 주문 금액의 총액과 주문의 평균 금액
SELECT MAX(b.price)
  FROM Book AS b, Orders AS o, Customer AS c
 WHERE b.bookid = o.bookid
   AND o.custid = c.custid

/*
SELECT SUM(saleprice) AS '주문 총액'
     , AVG(saleprice) AS '주문 평균금액'
  FROM Orders
*/
-- 3. 고객의 이름과 고객별 구매액
SELECT c.[name], SUM(b.price)
  FROM Orders AS o, Customer AS c, Book AS b
 WHERE c.custid = o.custid
/*
SELECT (SELECT [name] FROM Customer c WHERE c.custid = o.custid) AS '구매고객'
     , SUM(saleprice) AS '고객별 구매액'
  FROM Orders AS o
 GROUP BY o.custid;
*/
-- 4. 고객의 이름과 고객이 구매한 도서 목록(못품)

SELECT c.[name], b.bookname
  FROM Customer c, Orders o, Book b
 WHERE c.custid = o.custid
   AND o.bookid = b.bookid
 ORDER BY c.[name] ASC;

-- 5. 도서의 가격(Book테이블)과 판매가격(Orders테이블)의 차이가 가장 많은 주문(못품)
SELECT o.saleprice --1
     , b.price -- 2
     , (b.price - o.saleprice) AS '금액차' -- 3
  FROM Orders AS o, Book AS b
 WHERE o.bookid = b.bookid
-- ORDER BY (b.price - o.saleprice) DESC;
 ORDER BY 3 DESC;

 SELECT TOP 1 o.orderid -- 1
     , o.saleprice --2
     , b.price -- 3
     , (b.price - o.saleprice) AS '금액차' -- 4
  FROM Orders AS o, Book AS b
 WHERE o.bookid = b.bookid
-- ORDER BY (b.price - o.saleprice) DESC;
 ORDER BY 4 DESC;

-- 6. 도서 판매액 평균보다 자산의 구매액 평균이 더 높은 고객의 이름(못품)
-- 전체 도서의 판매 평균금액 = 11800
SELECT b.AVG AS '구매액 평균'
     , c.[name]
  FROM (SELECT AVG(o1.saleprice) AS avg
             , o1.custid
          FROM Orders AS o1
         GROUP BY o1.custid) AS b, Customer AS c
 WHERE b.custid = c.custid
   AND b.[avg] >= (SELECT AVG(saleprice)
                     FROM Orders);

-- 두가지 방법
SELECT (SELECT [name] FROM Customer WHERE custid = base.custid) AS '고객명'
     , base.Average
  FROM(SELECT o.custid
            , AVG(o.saleprice) AS Average
         FROM Orders AS o
        GROUP BY o.custid) AS base
 WHERE base.Average >= (SELECT (AVG(saleprice))
                          FROM Orders)