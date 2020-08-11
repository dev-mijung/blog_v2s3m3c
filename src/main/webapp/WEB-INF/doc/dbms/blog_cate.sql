/**********************************/
/* Table Name: 블로그 카테고리 */
/**********************************/

CREATE TABLE blog_cate(
		cate_no                       		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		blog_categrpno                		NUMBER(10)		 NOT NULL,
		cate_name                     		VARCHAR2(100)		 NOT NULL,
		cate_seqno                    		NUMBER(10)		 DEFAULT 1		 NOT NULL,
		cate_visible                  		    CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		cate_rdate                    		DATE		 NOT NULL,
		cate_cnt                      		NUMBER(10)		 DEFAULT 0		 NOT NULL,
  FOREIGN KEY (blog_categrpno) REFERENCES blog_categrp (blog_categrpno)
);

COMMENT ON TABLE blog_cate is '블로그 카테고리';
COMMENT ON COLUMN blog_cate.cate_no is '블로그카테고리번호';
COMMENT ON COLUMN blog_cate.blog_categrpno is '블로그카테고리그룹번호';
COMMENT ON COLUMN blog_cate.cate_name is '블로그카테고리이름';
COMMENT ON COLUMN blog_cate.cate_seqno is '블로그카테고리출력순서';
COMMENT ON COLUMN blog_cate.cate_visible is '블로그카테고리출력모드';
COMMENT ON COLUMN blog_cate.cate_rdate is '블로그카테고리등록일';
COMMENT ON COLUMN blog_cate.cate_cnt is '블로그카테고리등록된글수';

DROP SEQUENCE blog_cate_seq;
CREATE SEQUENCE blog_cate_seq 
    START WITH 1           -- 시작 번호
    INCREMENT BY 1       -- 증가 값
    MAXVALUE 9999999    -- 최대값: 9999999 --> NUMBER(7) 대응
    CACHE 2                   -- 2번은 메모리에서만 계산, 메모리에 시퀀스값 미리 할당
    NOCYCLE;     

-- CREATE
INSERT INTO blog_cate(cate_no, blog_categrpno, cate_name, cate_seqno, cate_visible, cate_rdate, cate_cnt)
VALUES(blog_cate_seq.nextval, 1, 'JAVA', 1, 'Y', sysdate, 0);

INSERT INTO blog_cate(cate_no, blog_categrpno, cate_name, cate_seqno, cate_visible, cate_rdate, cate_cnt)
VALUES(blog_cate_seq.nextval, 1, 'Spring', 2, 'Y', sysdate, 0);

INSERT INTO blog_cate(cate_no, blog_categrpno, cate_name, cate_seqno, cate_visible, cate_rdate, cate_cnt)
VALUES(blog_cate_seq.nextval, 1, 'Oracle', 3, 'Y', sysdate, 0);

-- LIST
SELECT cate_no, blog_categrpno, cate_name, cate_seqno, cate_visible, cate_rdate, cate_cnt
FROM blog_cate
ORDER BY blog_categrpno ASC, cate_seqno ASC;

-- READ
SELECT cate_no, blog_categrpno, cate_name, cate_seqno, cate_visible, cate_rdate, cate_cnt
FROM blog_cate
WHERE cate_no = 1;

-- UPDATE
UPDATE blog_cate
SET cate_name='JAVA', cate_seqno=1, cate_visible='N'
WHERE cate_no = 1;

-- DELETE
DELETE FROM blog_cate
WHERE cate_no = 4;

-- blog_categrp FK 값을 이용한 삭제
DELETE FROM blog_cate
WHERE blog_categrpno = 2;

-- 출력순서 상향, 10 ▷ 1
UPDATE blog_cate
SET cate_seqno = cate_seqno-1
WHERE cate_no = 1;
COMMIT;

-- 출력순서 하향, 1 ▷ 10
UPDATE blog_cate
SET cate_seqno = cate_seqno+1
WHERE cate_no=2;

-- 출력모드 변경
UPDATE blog_cate
SET cate_visible = 'N'
WHERE cate_no=4;

COMMIT;