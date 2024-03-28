# basic-database-2024
IoT 개발자과정 SQLServer 학습 리포지토리

## 1일차
- MS SQL Server 설치 : https://www.microsoft.com/ko-kr/sql-server/sql-server-downloads 최신버전
    - DBMS 엔진 - 개발자버전
        - iso 다운로드 후 설치 추천
        - SQL Server에 대한 Azure 확장 비활성화 후 진행
        - 데이터베이스 엔진구성부터 중요
            - Windows인증모드로 하면 외부에서 접근불가
            - 혼합모드(sa)에 대한 암호를 지정 / mssql_p@ss (8자이상 [대소문자구분] 특수문자1자이상 포함)
            - 데이터루트 디렉토리는 변경
    - 개발툴 설치
        - SSMS(Sql Server Management Studio) DB에 접근, 여러개발 작업할 툴


- 데이터베이스 개념
    - 데이터를 보관, 관리, 서비스하는 시스템
    - Data, Information, Knowlege 개념
    - DBMS > Database > Data(Model)

- DB언어
    - SQL(Structured Query Language) : 구조화된 질의 언어
        - DDL(Data Definition Lang) - 데이터베이스, 테이블, 인덱스 생성
        - DML(Data Manipulation Lang) - 검색(SELECT), 삽입(INSERT), 수정(UPDATE), 삭제(DELETE) 등 기능 제공(중요!)
        - DCL(Data Control Lang) - 권한, 트랜스액션 부여/제거 기능

- 개념스키마

- SQL 기본학습
    - SSMS 실행
    - SQL에서는 equal연산자에 == 사용안함. 무조건 =
    - SQL에서는 문자열에 " 사용안함. 무조건 '
    - SQL에서는 대소문자 구분없음. 하지만, 키워드는 대문자로 사용할 것
    - SQL에서는 ;이 필수가 아님. 하지만, 중요한 사항에서는 사용할 것
    - 드래그하고 실행하면 그 문장만 실행

- DML 학습
    - SQL 명령어 키워드 : SELECT, INSERT, UPDATE, DELETE
    - IT개발 표현언어 : Request, Create, Update, Delete (CRUD로 부름. CRU개발 뜻은 INSERT, UPDATE, SELECT를 할 수 있는 기능을 개발하라.)
    - SELECT
        ```sql
        SELECT [ALL | DISTINCT] 속성이름(들)
          FROM 테이블이름(들)
          [WHERE 검색조건(들)]
          [GROUP BY 속성이름(들)]
        [HAVING 검색조건(들)]
          [ORDER BY 속성이름(들) [ASC|DESC]]
        ```

## 2일차