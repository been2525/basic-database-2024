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
 SELECT DISTINCT m.[Names] AS '회원명'
     , m.Levels AS '회원등급'
     , m.Addr AS '회원주소'
     , r.rentalDate AS '대여일'
  FROM membertbl AS m LEFT OUTER JOIN rentaltbl AS r
    ON m.memberIdx = r.memberIdx
 WHERE r.rentalIdx IS NULL
   AND m.Levels LIKE 'A';

-- 4번
SELECT d.[Names] AS '책 장르'
     , FORMAT(SUM(b.Price), '#,#') + '원' AS '총합계금액'
  FROM divtbl AS d, bookstbl As b
 WHERE d.Division = b.Division
 GROUP BY d.Division, d.[Names]

-- 5번
SELECT ISNULL(d.[Names], '--합계--') AS '책 장르'
     , COUNT(b.Division) AS '권수'
     , FORMAT(SUM(b.Price), '#,#') + '원' AS '총합계금액'
  FROM divtbl AS d, bookstbl As b
 WHERE d.Division = b.Division  
 GROUP BY d.Division, d.[Names] WITH ROLLUP
 HAVING GROUPING_ID(d.Division, d.[Names]) IN (0,3)