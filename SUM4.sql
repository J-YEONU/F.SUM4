-- 4SUM 계정 생성
-- CREATE USER SUM IDENTIFIED BY SUM;
-- GRANT RESOURCE, CONNECT TO SUM;

-- 테이블 삭제
DROP TABLE ANSWER;
DROP TABLE MEMBER;
DROP TABLE MOVIE_INFO;
DROP TABLE NOTICE;
DROP TABLE QNA;
DROP TABLE BANNER;
DROP TABLE SHOW_TIME;
DROP TABLE CINEMA;
DROP TABLE TICKETING;

-- 시퀀스 삭제
DROP SEQUENCE SEQ_ANSWER_NO;
DROP SEQUENCE SEQ_MEMBER_NO;
DROP SEQUENCE SEQ_MOVIE_INFO_NO;
DROP SEQUENCE SEQ_NOTICE_NO;
DROP SEQUENCE SEQ_QNA_NO;
DROP SEQUENCE SEQ_BANNER_NO;
DROP SEQUENCE SEQ_SHOW_TIME_NO;
DROP SEQUENCE SEQ_CINEMA_NO;
DROP SEQUENCE SEQ_TICKETING_NO;


---- 컬럼명, 데이터 크기, 제약조건 등 확인해주시고 자유롭게 수정 및 사용해주시면 됩니다. ----
-- CREATE_DATE, STATUS 컬럼명 통일
-- 20220930_정수연. 모든 테이블 VARCHAR2 최대길이 5000 -> 2000 수정 


--------------------------------------------------
----------------- MEMBER 테이블 ------------------
-- 20220906. ROLL 컬럼 추가, 몇몇 컬럼 NOT NULL 삭제 // MEMBER_DATE 컬럼(생년월일?) 필요한지 확인 부탁드려요.

CREATE TABLE MEMBER (
	MEMBER_NO NUMBER NOT NULL,
	MEMBER_ID VARCHAR2(20) NOT NULL UNIQUE,
	MEMBER_PWD VARCHAR2(24) NOT NULL,
    ROLE VARCHAR2(10) DEFAULT 'ROLE_USER',
	MEMBER_NAME VARCHAR2(20) NOT NULL,
	MEMBER_DATE NUMBER,
	MEMBER_EMAIL VARCHAR2(50) UNIQUE,
	MEMBER_PHONE VARCHAR2(13) UNIQUE,
	MEMBER_GENRE VARCHAR2(50),
	MEMBER_POINT NUMBER,
	ENROLL_DATE DATE DEFAULT SYSDATE,
	STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N'))
);

COMMENT ON COLUMN MEMBER.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN MEMBER.MEMBER_ID IS '회원아이디';
COMMENT ON COLUMN MEMBER.MEMBER_PWD IS '회원비밀번호';
COMMENT ON COLUMN MEMBER.ROLE IS '회원타입';
COMMENT ON COLUMN MEMBER.MEMBER_NAME IS '회원이름';
COMMENT ON COLUMN MEMBER.MEMBER_DATE IS '회원생년월일';
COMMENT ON COLUMN MEMBER.MEMBER_EMAIL IS '이메일';
COMMENT ON COLUMN MEMBER.MEMBER_PHONE IS '전화번호';
COMMENT ON COLUMN MEMBER.MEMBER_GENRE IS '선호장르(추천)';
COMMENT ON COLUMN MEMBER.MEMBER_POINT IS '회원포인트';
COMMENT ON COLUMN MEMBER.ENROLL_DATE IS '가입날짜';
COMMENT ON COLUMN MEMBER.STATUS IS '상태값(Y/N)';

CREATE SEQUENCE SEQ_MEMBER_NO;


-- 관리자 계정 생성
INSERT INTO MEMBER (
    MEMBER_NO, 
    MEMBER_ID, 
    MEMBER_PWD, 
    ROLE,
    MEMBER_NAME,
    MEMBER_DATE,
    MEMBER_EMAIL,
    MEMBER_PHONE, 
    MEMBER_GENRE, 
    MEMBER_POINT,
    ENROLL_DATE,
    STATUS
) VALUES(
    SEQ_MEMBER_NO.NEXTVAL, 
    'admin', 
    '123', 
    'ROLE_ADMIN', 
    '관리자', 
    NULL,
    'admin@4sum.or.kr', 
    '010-1234-5678', 
    NULL,
    NULL,
    DEFAULT,
    DEFAULT
);

COMMIT;

--CREATE TABLE ADMIN (
--	ADMIN_NO NUMBER PRIMARY KEY COMMENT '관리자번호',
--	ADMIN_ID VARCHAR2(20) NOT NULL COMMENT '관리자아이디',
--	ADMIN_PWD VARCHAR2(30) NOT NULL COMMENT '관리자비밀번호',
--	ADMIN_NAME VARCHAR2(30) NOT NULL COMMENT '관리자이름',
--	ADMIN_EMAIL VARCHAR2(100) NOT NULL COMMENT '관리자이메일',
--	ADMIN_PHONE VARCHAR2(50) NOT NULL COMMENT '관리자연락처'
--);

--------------------------------------------------
----------------- MOVIE_INFO 테이블 --------------
-- 20220906. 무비로드 컬럼 삭제 / 영화제목, 개봉일 컬럼명 변경.
-- 20220930_정수연. 코멘트 컬럼명 수정(첨부사진, 첨부사진수정, 상영여부), MOVIE_STATUS CHECK 조건 컬럼명 수정


CREATE TABLE MOVIE_INFO (
	MOVIE_NO NUMBER NOT NULL,
    MEMBER_NO NUMBER NOT NULL,
	MOVIE_TITLE	VARCHAR2(100) NOT NULL,
	MOVIE_GENRE	VARCHAR2(300) NOT NULL,
	MOVIE_RELEASE DATE NOT NULL,
	MOVIE_DIRECTOR VARCHAR2(100) NOT NULL,
	MOVIE_CAST VARCHAR2(500) NOT NULL,
	MOVIE_RATING VARCHAR2(15) NOT NULL,
	MOVIE_TRAILER VARCHAR2(2000),
	MOVIE_POSTER VARCHAR2(2000),
    RENAMED_POSTER VARCHAR2(2000),
	MOVIE_STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(MOVIE_STATUS IN('Y', 'N')),
	IMG VARCHAR2(2000),
    RENAMED_IMG VARCHAR2(2000),
	MOVIE_SUMMARY VARCHAR2(3000),
	PRICE NUMBER NOT NULL,
	READCOUNT NUMBER DEFAULT 0,
	MOVIE_COMMENT VARCHAR2(500),
	MOVIE_GRADE	VARCHAR2(10),
    CREATE_DATE DATE DEFAULT SYSDATE

);

COMMENT ON COLUMN MOVIE_INFO.MOVIE_NO IS '영화번호';
COMMENT ON COLUMN MOVIE_INFO.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN MOVIE_INFO.MOVIE_TITLE IS '영화제목';
COMMENT ON COLUMN MOVIE_INFO.MOVIE_GENRE IS '장르';
COMMENT ON COLUMN MOVIE_INFO.MOVIE_RELEASE IS '개봉일';
COMMENT ON COLUMN MOVIE_INFO.MOVIE_DIRECTOR IS '감독';
COMMENT ON COLUMN MOVIE_INFO.MOVIE_CAST IS '출연진';
COMMENT ON COLUMN MOVIE_INFO.MOVIE_RATING IS '관람등급';
COMMENT ON COLUMN MOVIE_INFO.MOVIE_TRAILER IS '예고편링크';
COMMENT ON COLUMN MOVIE_INFO.MOVIE_POSTER IS '영화포스터';
COMMENT ON COLUMN MOVIE_INFO.RENAMED_POSTER IS '포스터수정이미지';
COMMENT ON COLUMN MOVIE_INFO.MOVIE_STATUS IS '상영여부(Y/N)';
COMMENT ON COLUMN MOVIE_INFO.IMG IS '첨부사진';
COMMENT ON COLUMN MOVIE_INFO.RENAMED_IMG IS '첨부사진수정';
COMMENT ON COLUMN MOVIE_INFO.MOVIE_SUMMARY IS '영화줄거리';
COMMENT ON COLUMN MOVIE_INFO.PRICE IS '관람료';
COMMENT ON COLUMN MOVIE_INFO.READCOUNT IS '조회수';
COMMENT ON COLUMN MOVIE_INFO.MOVIE_COMMENT IS '한줄평';
COMMENT ON COLUMN MOVIE_INFO.MOVIE_GRADE IS '평점';
COMMENT ON COLUMN MOVIE_INFO.CREATE_DATE IS '작성일';


CREATE SEQUENCE SEQ_MOVIE_INFO_NO;


--------------------------------------------------
----------------- TICKETING 테이블 ---------------
-- 20220906. SEAT_NO 크기 변경

CREATE TABLE TICKETING (
	TICKET_NO NUMBER NOT NULL,
	SEAT_NO	VARCHAR2(100) NOT NULL,
	TICKET_DATE	DATE DEFAULT SYSDATE,
	MEMBER_NO NUMBER NOT NULL,
	SHOW_NO	NUMBER NOT NULL
);

COMMENT ON COLUMN TICKETING.TICKET_NO IS '예매번호';
COMMENT ON COLUMN TICKETING.SEAT_NO IS '예약좌석번호';
COMMENT ON COLUMN TICKETING.TICKET_DATE IS '예매일';
COMMENT ON COLUMN TICKETING.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN TICKETING.SHOW_NO IS '상영시간번호';

CREATE SEQUENCE SEQ_TICKETING_NO;

--------------------------------------------------
------------------ CINEMA 테이블 -----------------

CREATE TABLE CINEMA (
	CINEMA_NO NUMBER NOT NULL,
	CINEMA_NAME VARCHAR2(20) NOT NULL,
	CINEMA_PHONE VARCHAR2(100) NULL,
	CINEMA_IMG VARCHAR2(2000),
	CINEMA_LOCAL VARCHAR2(100) NOT NULL,
	CINEMA_ADDRESS VARCHAR2(300) NOT NULL,
	CINEMA_CONTENT VARCHAR2(3000) NOT NULL,
	CINEMA_SEAT_COUNT NUMBER,
	STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
	MOVIE_NO NUMBER	NOT NULL,
	MEMBER_NO NUMBER NOT NULL
);

COMMENT ON COLUMN CINEMA.CINEMA_NO IS '영화관번호';
COMMENT ON COLUMN CINEMA.CINEMA_NAME IS '영화관이름';
COMMENT ON COLUMN CINEMA.CINEMA_PHONE IS '전화번호';
COMMENT ON COLUMN CINEMA.CINEMA_IMG IS '영화관사진';
COMMENT ON COLUMN CINEMA.CINEMA_LOCAL IS '지역';
COMMENT ON COLUMN CINEMA.CINEMA_ADDRESS IS '영화관주소';
COMMENT ON COLUMN CINEMA.CINEMA_CONTENT IS '영화관안내';
COMMENT ON COLUMN CINEMA.CINEMA_SEAT_COUNT IS '좌석수';
COMMENT ON COLUMN CINEMA.STATUS IS '상태값(Y/N)';
COMMENT ON COLUMN CINEMA.MOVIE_NO IS '영화번호';
COMMENT ON COLUMN CINEMA.MEMBER_NO IS '회원번호';

CREATE SEQUENCE SEQ_CINEMA_NO;

--------------------------------------------------
------------------ NOTICE 테이블 -----------------

CREATE TABLE NOTICE (
	NOTICE_NO NUMBER NOT NULL,
	NOTICE_TITLE VARCHAR2(500) NOT NULL,
	NOTICE_CONTENT VARCHAR2(3000) NOT NULL,
	CREATE_DATE DATE DEFAULT SYSDATE,
	NOTICE_IMG VARCHAR2(2000),
    RENAMED_IMG VARCHAR2(2000),
	STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
	MEMBER_NO NUMBER NOT NULL
);

COMMENT ON COLUMN NOTICE.NOTICE_NO IS '공지번호';
COMMENT ON COLUMN NOTICE.NOTICE_TITLE IS '공지제목';
COMMENT ON COLUMN NOTICE.NOTICE_CONTENT IS '공지내용';
COMMENT ON COLUMN NOTICE.CREATE_DATE IS '작성일';
COMMENT ON COLUMN NOTICE.NOTICE_IMG IS '공지이미지';
COMMENT ON COLUMN NOTICE.RENAMED_IMG IS '수정이미지';
COMMENT ON COLUMN NOTICE.STATUS IS '상태값(Y/N)';
COMMENT ON COLUMN NOTICE.MEMBER_NO IS '회원번호';

CREATE SEQUENCE SEQ_NOTICE_NO;

--------------------------------------------------
------------------- QNA 테이블 -------------------
-- 20220930_정수연. ANSWER_STATUS CHECK 조건 컬럼명 수정

CREATE TABLE QNA (
	QNA_NO NUMBER NOT NULL,
	QNA_TITLE VARCHAR2(100) NOT NULL,
	QNA_CONTENT VARCHAR2(300) NOT NULL,
	STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
	MEMBER_NO NUMBER NOT NULL,
	ANSWER_STATUS VARCHAR2(1) DEFAULT 'N' CHECK(ANSWER_STATUS IN('Y', 'N')),
   	CREATE_DATE DATE DEFAULT SYSDATE
);

COMMENT ON COLUMN QNA.QNA_NO IS '문의글번호';
COMMENT ON COLUMN QNA.QNA_TITLE IS '문의제목';
COMMENT ON COLUMN QNA.QNA_CONTENT IS '문의내용';
COMMENT ON COLUMN QNA.STATUS IS '상태값(Y/N)';
COMMENT ON COLUMN QNA.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN QNA.ANSWER_STATUS IS '답변상태(Y/N)';
COMMENT ON COLUMN QNA.CREATE_DATE IS '작성일';

CREATE SEQUENCE SEQ_QNA_NO;

--------------------------------------------------
------------------ ANSWER 테이블 -----------------
CREATE TABLE ANSWER (
	QNA_NO NUMBER NOT NULL,
	ANSWER_TITLE VARCHAR2(500) NOT NULL,
	ANSWER_CONTENT VARCHAR2(3000) NOT NULL,
	CREATE_DATE DATE DEFAULT SYSDATE,
	STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
	MEMBER_NO NUMBER NOT NULL
);

COMMENT ON COLUMN ANSWER.QNA_NO IS '문의글번호';
COMMENT ON COLUMN ANSWER.ANSWER_TITLE IS '답변제목';
COMMENT ON COLUMN ANSWER.ANSWER_CONTENT IS '답변내용';
COMMENT ON COLUMN ANSWER.CREATE_DATE IS '작성일';
COMMENT ON COLUMN ANSWER.STATUS IS '상태값(Y/N)';
COMMENT ON COLUMN ANSWER.MEMBER_NO IS '회원번호';

CREATE SEQUENCE SEQ_ANSWER_NO;

--------------------------------------------------
------------------ BANNER 테이블 -----------------
CREATE TABLE BANNER (
	BANNER_NO NUMBER NOT NULL,
	BANNER_IMG VARCHAR2(2000) NOT NULL,
    RENAMED_IMG VARCHAR2(2000),
    STATUS VARCHAR2(1) DEFAULT 'Y' CHECK(STATUS IN('Y', 'N')),
	MEMBER_NO NUMBER NOT NULL
);

COMMENT ON COLUMN BANNER.BANNER_NO IS '배너번호';
COMMENT ON COLUMN BANNER.BANNER_IMG IS '배너이미지';
COMMENT ON COLUMN BANNER.RENAMED_IMG IS '수정이미지';
COMMENT ON COLUMN BANNER.STATUS IS '상태값(Y/N)';
COMMENT ON COLUMN BANNER.MEMBER_NO IS '회원번호';

CREATE SEQUENCE SEQ_BANNER_NO;

--------------------------------------------------
----------------- SHOW_TIME 테이블 ---------------
-- 20220930_정수연. 회원번호 코멘트 컬럼명 수정

CREATE TABLE SHOW_TIME (
	SHOW_NO NUMBER NOT NULL,
	CINEMA_NO NUMBER NOT NULL,
	SHOW_TIME VARCHAR2(200) NOT NULL,
	SHOW_START DATE	NOT NULL,
	SHOW_END DATE NOT NULL,
	MEMBER_NO NUMBER NOT NULL,
	MOVIE_NO NUMBER NOT NULL
);

COMMENT ON COLUMN SHOW_TIME.SHOW_NO IS '상영시간번호';
COMMENT ON COLUMN SHOW_TIME.CINEMA_NO IS '영화관번호';
COMMENT ON COLUMN SHOW_TIME.SHOW_TIME IS '상영시간';
COMMENT ON COLUMN SHOW_TIME.SHOW_START IS '상영날짜';
COMMENT ON COLUMN SHOW_TIME.SHOW_END IS '종영날짜';
COMMENT ON COLUMN SHOW_TIME.MEMBER_NO IS '회원번호';
COMMENT ON COLUMN SHOW_TIME.MOVIE_NO IS '영화번호';

CREATE SEQUENCE SEQ_SHOW_TIME_NO;


-- 제약조건 변경

ALTER TABLE MEMBER ADD CONSTRAINT PK_MEMBER PRIMARY KEY (MEMBER_NO);

ALTER TABLE MOVIE_INFO ADD CONSTRAINT PK_MOVIE_INFO PRIMARY KEY (MOVIE_NO);

ALTER TABLE TICKETING ADD CONSTRAINT PK_TICKETING PRIMARY KEY (TICKET_NO);

ALTER TABLE CINEMA ADD CONSTRAINT PK_CINEMA PRIMARY KEY (CINEMA_NO);

ALTER TABLE NOTICE ADD CONSTRAINT PK_NOTICE PRIMARY KEY (NOTICE_NO);

ALTER TABLE QNA ADD CONSTRAINT PK_QNA PRIMARY KEY (QNA_NO);

ALTER TABLE ANSWER ADD CONSTRAINT PK_ANSWER PRIMARY KEY (QNA_NO);

ALTER TABLE BANNER ADD CONSTRAINT PK_BANNER PRIMARY KEY (BANNER_NO);

ALTER TABLE SHOW_TIME ADD CONSTRAINT PK_SHOW_TIME PRIMARY KEY (SHOW_NO, CINEMA_NO);

ALTER TABLE ANSWER ADD CONSTRAINT FK_QNA_TO_ANSWER FOREIGN KEY (QNA_NO)
REFERENCES QNA (QNA_NO);

ALTER TABLE SHOW_TIME ADD CONSTRAINT FK_CINEMA_TO_SHOW_TIME FOREIGN KEY (CINEMA_NO)
REFERENCES CINEMA (CINEMA_NO);
