-- 1번
SELECT Email
     , Mobile
     , [Names]
     , Addr
  FROM membertbl
 ORDER BY Addr DESC, Email ASC;

-- 2번
SELECT [Names] AS '도서명'
     , Author AS '저자'
     , ISBN
     , price AS '정가'
  FROM bookstbl
 ORDER BY price DESC;

-- 3번
SELECT m.[Names] AS '회원명'
     , m.Levels AS '회원등급'
     , m.Addr AS '회원주소'
     , r.rentalDate
  FROM rentaltbl AS r
     , membertbl AS m 
 WHERE m.memberIdx NOT IN (SELECT m.[Names] AS '회원명'
                                                , m.Levels AS '회원등급'
                                                , m.Addr AS '회원주소'
                                                , r.rentalDate
                                            FROM rentaltbl AS r
                                                , membertbl AS m 
                                            WHERE m.memberIdx = r.memberIdx)
 --ORDER BY 

-- 4번
SELECT d.[Names] AS '책 장르'
     , FORMAT(SUM(b.Price), '#,#') AS '총합계금액'
  FROM divtbl AS d, bookstbl As b
 WHERE d.Division = b.Division
 GROUP BY d.Division, d.[Names]
-- ORDER BY d.Division;

-- 5번
SELECT ISNULL(d.[Names], '--합계--') AS '책 장르'
     , FORMAT(SUM(b.Price), '#,#') AS '총합계금액'
     , COUNT(b.Division) AS '권수'
  FROM divtbl AS d, bookstbl As b
 WHERE d.Division = b.Division  
 GROUP BY d.Division, d.[Names] WITH ROLLUP
 HAVING GROUPING_ID(d.Division, d.[Names]) IN (0,3)