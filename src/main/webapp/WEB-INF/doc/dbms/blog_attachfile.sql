/**********************************/
/* Table Name: 첨부파일 */
/**********************************/
CREATE TABLE blog_attachfile(
		attachfile_no                 		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		fname                         		VARCHAR2(100)		 NOT NULL,
		fupname                       		VARCHAR2(100)		 NOT NULL,
		thumb                         		VARCHAR2(100)		 NOT NULL,
		fsize                         		NUMBER(10)		 DEFAULT 0		 NOT NULL,
		attachfile_rdate              		DATE		 NOT NULL,
		contents_no                   		NUMBER(10)		 NULL ,
  FOREIGN KEY (contents_no) REFERENCES blog_contents (contents_no)
);

COMMENT ON TABLE blog_attachfile is '첨부파일';
COMMENT ON COLUMN blog_attachfile.attachfile_no is '첨부파일번호';
COMMENT ON COLUMN blog_attachfile.fname is '원본파일명';
COMMENT ON COLUMN blog_attachfile.fupname is '업로드파일명';
COMMENT ON COLUMN blog_attachfile.thumb is 'Thumb 파일';
COMMENT ON COLUMN blog_attachfile.fsize is '파일사이즈';
COMMENT ON COLUMN blog_attachfile.attachfile_rdate is '파일등록일';
COMMENT ON COLUMN blog_attachfile.contents_no is '블로그컨텐츠번호';

DROP SEQUENCE blog_attachfile_seq;
CREATE SEQUENCE blog_attachfile_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999999999
    CACHE 2
    NOCYCLE;

-- 1) 등록
INSERT INTO blog_attachfile(attachfile_no, contents_no, fname, fupname, thumb, fsize, attachfile_rdate)
VALUES(blog_attachfile_seq.nextval, 4, 'spring.png', 'spring_1.png', 'spring_t.png', 1000, sysdate);

INSERT INTO blog_attachfile(attachfile_no, contents_no, fname, fupname, thumb, fsize, attachfile_rdate)
VALUES(blog_attachfile_seq.nextval, 4, 'spring.png', 'spring_1.png', 'spring_t.png', 1000, sysdate);

INSERT INTO blog_attachfile(attachfile_no, contents_no, fname, fupname, thumb, fsize, attachfile_rdate)
VALUES(blog_attachfile_seq.nextval, 4, 'oracle.png', 'oracle_1.png', 'oracle_t.png', 1000, sysdate);

INSERT INTO blog_attachfile(attachfile_no, contents_no, fname, fupname, thumb, fsize, attachfile_rdate)
VALUES(blog_attachfile_seq.nextval, 4, 'java.jpg', 'java_1.jpg', 'java_t.jpg', 1000, sysdate);

-- 2) 목록 (contents_no 기준 내림차순, attachfile_no 기준 오름차순)
SELECT attachfile_no, contents_no, fname, fupname, thumb, fsize, attachfile_rdate
FROM blog_attachfile
ORDER BY contents_no DESC, attachfile_no ASC;

-- 3) 글별 파일 목록(contents_no 기준 내림차순, attachfile_no 기준 오름차순)
SELECT attachfile_no, contents_no, fname, fupname, thumb, fsize, attachfile_rdate
FROM blog_attachfile
WHERE contents_no = 4
ORDER BY contents_no DESC, attachfile_no ASC;

-- 4) 하나의 파일 삭제
DELETE FROM blog_attachfile
WHERE attachfile_no = 5;

--5) FK contentsno 부모키 별 조회
SELECT attachfile_no, contents_no, fname, fupname, thumb, fsize, attachfile_rdate
FROM blog_attachfile
WHERE contents_no = 4;

-- 6) 부모키별 갯수 산출
SELECT COUNT(*) as cnt
FROM blog_attachfile
WHERE contents_no = 4;

-- 7) FK 부모 테이블별 레코드 삭제
DELETE FROM blog_attachfile
WHERE contents_no = 5;

-- 8) Contents, Attachfile join
SELECT c.contents_title,
          a.attachfile_no, a.contents_no, a.fname, a.fupname, a.thumb, a.fsize, a.attachfile_rdate
FROM blog_contents c, blog_attachfile a
WHERE c.contents_no = a.contents_no
ORDER BY c.contents_no DESC, a.attachfile_no ASC;

--9) 조회
SELECT attachfile_no, contents_no, fname, fupname, thumb, fsize, attachfile_rdate
FROM blog_attachfile
WHERE attachfile_no=2;
COMMIT;