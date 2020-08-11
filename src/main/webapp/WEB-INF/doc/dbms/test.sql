DROP TABLE test;

CREATE TABLE test(
    testno  NUMBER(5)   NOT NULL, -- -99999 ~ +99999
    mname   VARCHAR(20) NOT NULL, -- 한글 10자.
    funct   VARCHAR(50) NOT NULL, -- 주요 기술 분야
    PRIMARY KEY (testno) --중복 안 됨, 고유한 값만 가능
);

INSERT INTO test(testno, mname, funct)
VALUES(1, '왕눈이', 'JAVA/JSP/SPRING');

INSERT INTO test(testno, mname, funct)
VALUES(2, '아로미', 'JAVA/JSP/Spring/JQuery');

INSERT INTO test(testno, mname, funct)
VALUES(3, '투투', 'JAVA/JSP/Spring/JQuery/HTML5');

SELECT testno, mname, funct
From test
ORDER BY testno ASC;

-- VARCHAR 타입의 저장 가능 글자수 확인
INSERT INTO test(testno, mname, funct)
VALUES(4, '오늘은 금요일', 'JAVA/JSP/Spring/JQuery/HTML5');

-- 한글: 3byte, 그 외의 문자는 1 byte(MySQL: 모든 문자 2byte 처리 함)
INSERT INTO test(testno, mname, funct)
VALUES(5, '오늘은 금요일 FRIDAY', 'JAVA/JSP/Spring/JQuery/HTML5');
--ORA-12899: value too large for column "AI1"."TEST"."MNAME" (actual: 26, maximum: 20)

INSERT INTO test(testno, mname, funct)
VALUES(6, '오늘은 금요일 FRIDAY 2020', 'JAVA/JSP/Spring/JQuery/HTML5');
-- ORA-12899: value too large for column "AI1"."TEST"."MNAME" (actual: 31, maximum: 20)

SELECT testno, mname, funct FROM test ORDER BY testno ASC;

DELETE FROM test
WHERE testno = 4;

-- Oracle: 한글 1자는 3바이트, 영문자/숫자/특수문자는 1바이트 사용
-- MySQL: varchar(10)이면 모든 문자를 10자 저장 가능

commit;