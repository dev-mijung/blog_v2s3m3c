/**********************************/
/* Table Name: 블로그 카테고리그룹 */
/**********************************/
DROP TABLE blog_categrp;
DROP TABLE blog_cate;

CREATE TABLE blog_categrp(
		blog_categrpno                		NUMBER(10)		 NOT NULL PRIMARY KEY,
		blog_name                     		VARCHAR2(50)		 NOT NULL,
		blog_seqno                    		NUMBER(7)		 DEFAULT 0		 NOT NULL,
		blog_visible                  		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		blog_rdate                    		DATE		 NOT NULL
);

COMMENT ON TABLE blog_categrp is '블로그 카테고리그룹';
COMMENT ON COLUMN blog_categrp.blog_categrpno is '블로그카테고리그룹번호';
COMMENT ON COLUMN blog_categrp.blog_name is '블로그카테고리이름';
COMMENT ON COLUMN blog_categrp.blog_seqno is '블로그출력순서';
COMMENT ON COLUMN blog_categrp.blog_visible is '블로그출력모드';
COMMENT ON COLUMN blog_categrp.blog_rdate is '블로그카테고리그룹생성일';

DROP SEQUENCE blog_categrp_seq;
CREATE SEQUENCE blog_categrp_seq
    START WITH 1           -- 시작 번호
    INCREMENT BY 1       -- 증가 값
    MAXVALUE 9999999    -- 최대값: 9999999 --> NUMBER(7) 대응
    CACHE 2                   -- 2번은 메모리에서만 계산, 메모리에 시퀀스값 미리 할당
    NOCYCLE;                  -- 다시 1부터 생성되는 것을 방지

-- INSERT
INSERT INTO blog_categrp(blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate)
VALUES(blog_categrp_seq.nextval, 'JAVA', 1, 'Y', sysdate);

INSERT INTO blog_categrp(blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate)
VALUES(blog_categrp_seq.nextval, 'Spring', 2, 'Y', sysdate);

INSERT INTO blog_categrp(blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate)
VALUES(blog_categrp_seq.nextval, 'Oracle', 3, 'Y', sysdate);

-- LIST
SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate
FROM blog_categrp
ORDER BY blog_categrpno ASC;

-- READ
SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate
FROM blog_categrp
WHERE blog_categrpno = 1;

-- UPDATE
UPDATE blog_categrp
SET blog_name='MyBATIS', blog_seqno=2, blog_visible='N'
WHERE blog_categrpno=2;


-- DELETE
DELETE blog_categrp
WHERE blog_categrpno=29;

-- 출력순서 상향, 10 ▷ 1
UPDATE blog_categrp
SET blog_seqno = blog_seqno - 1
WHERE blog_categrpno = 2;

-- 출력순서 하향, 1 ▷ 10
UPDATE blog_categrp
SET blog_seqno = blog_seqno + 1
WHERE blog_categrpno =3;

-- 출력 모드의 변경
UPDATE blog_categrp
SET blog_visible='Y'
WHERE blog_categrpno=4;

-- 페이징.
-- step 1
SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate
FROM blog_categrp
ORDER BY blog_seqno DESC;

-- step 2
SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate, rownum as r
FROM (
            SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate
            FROM blog_categrp
            ORDER BY blog_seqno DESC
);

-- step 3 (1페이지)
SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate, r
FROM (
            SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate, rownum as r
            FROM (
                        SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate
                        FROM blog_categrp
                        ORDER BY blog_seqno DESC
         )
)
WHERE r >= 1 AND r <= 10;

-- step3 (2페이지)
SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate, r
FROM (
            SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate, rownum as r
            FROM (
                        SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate
                        FROM blog_categrp
                        ORDER BY blog_seqno DESC
         )
)
WHERE r >= 11 AND r <= 20;

-- 검색갯수
SELECT COUNT(*) as cnt FROM blog_categrp;

commit;


-- Oralce 연습
SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate
FROM blog_categrp
WHERE blog_name = 'JAVA' AND blog_seqno >= 1;

SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate
FROM blog_categrp
WHERE blog_name = 'JAVA' AND blog_seqno >= 1 AND blog_visible = 'Y';

SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate
FROM blog_categrp
WHERE blog_name = 'JAVA' OR blog_seqno >= 1;

SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate
FROM blog_categrp
WHERE blog_name = 'JAVA'
OR blog_seqno >=1
AND blog_categrpno IS NULL;

-- IN 연산자의 사용
-- 여러 값을 OR 관계로 묶어 나열하는 조건을 WHERE 절에 사용할때 쓸 수 있는 키워드.
-- IN 연산자는 조건의 범위를 지정하는데 사용. 값은 콤마(,)로 구분하여 괄호 내에 묶으며,
-- 이 값 중에서 하나 이상과 일치하면 조건에 맞는 것 으로 평가 됨.

SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate
FROM blog_categrp
WHERE blog_name IN ('JAVA','Spring')
ORDER BY blog_categrpno DESC;

-- IN 연산자의 장점
-- 목록에 넣을 값이 여러개 일때, IN 연산자가 보다 쓰기도 쉽고, 이해하기도 쉬움
-- IN을 사용하면 평가 순서를 보다 쉽게 관리할 수 있고, 연산자 수도 줄어듬.
-- IN 연산자가 OR 연산자보다 실행 속도가 빠름
-- IN의 가장 큰 장점은 IN 연산자에 다른 SELECT문을 넣을 수 있음
-- 동적인 WHERE 절을 만들 때 더 크게 활용 됨


-- NOT 연산자의 사용
-- 조건을 부정할 때 사용되는 WHERE 절의 키워드.
-- NOT 연산자는 말그대로 바로 뒤에 오는 조건을 부정하는 역할을 함. 
-- 때문에 혼자서는 되지 않음
-- 다른 연산자와는 달리 필터링 할 열의 뒤가 아닌 앞에 사용 됨
-- WHERE절의 JAVA와 Spring을 제외 한 모든 정보 출력
SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate
FROM blog_categrp
WHERE NOT blog_name IN ('JAVA','Spring')
ORDER BY blog_categrpno DESC;

-- 출력 결과 확인 시 NOT 연산자 하나를 추가한 결과로 정 반대의 결과를 가져올 수 있음
-- 해당 조건문이 IN 연산자로 묶이지 않은 하나의 열이라면 굳이 NOT 연산자를 사용하지 않고
-- != 또는 <> 등의 조건연산자를 사용해도 결과는 동일 함

-- NOT 이나 IN 연산자를 사용하지 않은 경우
SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate
FROM blog_categrp
WHERE blog_name != 'JAVA' AND blog_name <> 'Spring'
ORDER BY blog_categrpno DESC;

-- 값이 없을경우를 비교
SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate
FROM blog_categrp
WHERE blog_name IS NOT NULL;

