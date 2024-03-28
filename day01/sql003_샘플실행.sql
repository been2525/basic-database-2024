-- 책중에서 '축구의 역사' 라는 도서의 출판사와 도서의 가격을 알고싶어.
-- dbo는 DataBase Owner(지금은 패스)
-- DML(4가지)중 SELECT(조회)
SELECT publisher, price
  FROM Book
  WHERE bookname = '축구의 역사';

/*
- SQL에서는 equal연산자에 == 사용안함. 무조건 =
- SQL에서는 문자열에 " 사용안함. 무조건 '
- SQL에서는 대소문자 구분없음. 하지만, 키워드는 대문자로 사용할 것
- SQL에서는 ;이 필수가 아님. 하지만, 중요한 사항에서는 사용할 것
- 드래그하고 실행하면 그 문장만 실행
*/

--김연아 고객의 전화번호를 찾으시오.
-- 1 step
SELECT *						/*All 이라고 호칭*/
 FROM Customer;

 -- 2 step(1 step에서 수정)
 SELECT *
  FROM Customer
 WHERE [name] = '김연아';

 -- 3 step(2 step에서 수정)
 SELECT phone
   FROM Customer
  WHERE [name] = '김연아';