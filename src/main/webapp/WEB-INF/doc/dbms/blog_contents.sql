/**********************************/
/* Table Name: 블로그컨텐츠 */
/**********************************/
DROP TABLE blog_contents;
CREATE TABLE blog_contents(
		contents_no                   		NUMBER(10)		     NOT NULL		 PRIMARY KEY,
		cate_no                       		NUMBER(10)		     NOT NULL,
		member_no                     		NUMBER(10)		     NOT NULL,
		contents_title                		VARCHAR2(300)		 NOT NULL,
		contents_content              		CLOB            	         NOT NULL,
		contents_recom                		NUMBER(7)		         DEFAULT 0 NOT NULL,
		contents_cnt                  		NUMBER(7)		         DEFAULT 0 NOT NULL,
		contents_reply                		NUMBER(7)		         DEFAULT 0 NOT NULL,
		contents_web                  		VARCHAR2(500)		 NULL ,
		contents_map                  		VARCHAR2(1000)		 NULL ,
		youtube                       		VARCHAR2(1000)		 NULL ,
		mp3                           		VARCHAR2(1000)		 NULL ,
		mp4                           		VARCHAR2(1000)		 NULL ,
		contents_visible              		CHAR(1)		             DEFAULT 'Y'		 NOT NULL,
		ip                            		    VARCHAR2(15)		     NOT NULL,
		contents_passwd               	VARCHAR2(15)		     NOT NULL,
		contents_grpno                		NUMBER(8)	             DEFAULT 0   NOT NULL,
		contents_indent               		NUMBER(2)		         DEFAULT 0   NOT NULL,
		contents_ansnum               	NUMBER(3)		         DEFAULT 0 NOT NULL,
		contents_word                 		VARCHAR2(300)		 NULL ,
        contents_rdate                      DATE                     NOT NULL,
        file1      VARCHAR(100)          NULL,
        thumb1 VARCHAR(100)          NULL,
        size1     NUMBER(10)            DEFAULT 0 NULL, --대표이미지가 나오게 함
  FOREIGN KEY (cate_no) REFERENCES blog_cate (cate_no),
  FOREIGN KEY (member_no) REFERENCES member (member_no)
);

COMMENT ON TABLE blog_contents is '블로그컨텐츠';
COMMENT ON COLUMN blog_contents.contents_no is '블로그컨텐츠번호';
COMMENT ON COLUMN blog_contents.cate_no is '블로그카테고리번호';
COMMENT ON COLUMN blog_contents.member_no is '블로그회원번호';
COMMENT ON COLUMN blog_contents.contents_title is '컨텐츠제목';
COMMENT ON COLUMN blog_contents.contents_content is '컨텐츠내용';
COMMENT ON COLUMN blog_contents.contents_recom is '컨텐츠추천수';
COMMENT ON COLUMN blog_contents.contents_cnt is '컨텐츠조회수';
COMMENT ON COLUMN blog_contents.contents_reply is '컨텐츠댓글수';
COMMENT ON COLUMN blog_contents.contents_web is '컨텐츠인터넷주소';
COMMENT ON COLUMN blog_contents.contents_map is '컨텐츠지도';
COMMENT ON COLUMN blog_contents.youtube is 'Youtube';
COMMENT ON COLUMN blog_contents.mp3 is 'MP3';
COMMENT ON COLUMN blog_contents.mp4 is 'MP4';
COMMENT ON COLUMN blog_contents.contents_visible is '컨텐츠출력모드';
COMMENT ON COLUMN blog_contents.ip is 'IP';
COMMENT ON COLUMN blog_contents.contents_passwd is '패스워드';
COMMENT ON COLUMN blog_contents.contents_grpno is '그룹번호';
COMMENT ON COLUMN blog_contents.contents_indent is '들여쓰기/답변차수';
COMMENT ON COLUMN blog_contents.contents_ansnum is '답변순서';
COMMENT ON COLUMN blog_contents.contents_word is '검색어';
COMMENT ON COLUMN blog_contents.contents_rdate is '등록일';
COMMENT ON COLUMN blog_contents.file1 is '메인이미지';
COMMENT ON COLUMN blog_contents.thumb1 is '메인이미지 Preview';
COMMENT ON COLUMN blog_contents.size1 is '메인이미지 크기';

DROP SEQUENCE blog_contents_seq;
CREATE SEQUENCE blog_contents_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999999999
    CACHE 2
    NOCYCLE;
    
-- 현재 sequence의 확인
-- sequence 객체의 currentval 함수를 이용하면 
-- 앞으로 들어갈 PK 를 확인할 수 있는데. 임의의 갯수 임의의 번째 실행이라면? 제약사항이 있다는 것
-- <SelectKey> 태그는 PK값을 미리(before) SQL을 통해서 처리해 두고 특정한 이름으로 결과를 보관하는 방식

SELECT blog_contents_seq.nextval FROM dual;
SELECT blog_contents_seq.currval FROM dual;

-- CREATE
INSERT INTO blog_contents(contents_no, cate_no, member_no, contents_title, contents_content, 
                                     contents_web, ip, contents_passwd, contents_word, contents_rdate, file1, thumb1, size1)
VALUES(blog_contents_seq.nextval, 1, 1, '스프링', '열공열공', 'http://https://spring.io/','127.0.0.1','1234','스프링',sysdate,'spring.jsp','spring_t.jsp',23657);

INSERT INTO blog_contents(contents_no, cate_no, member_no, contents_title, contents_content, 
                                     contents_web, ip, contents_passwd, contents_word, contents_rdate, file1, thumb1, size1)
VALUES(blog_contents_seq.nextval, 1, 1, '스프링', '열공열공', 'http://https://spring.io/','127.0.0.1','1234','스프링',sysdate,'spring.jsp','spring_t.jsp',23657);

INSERT INTO blog_contents(contents_no, cate_no, member_no, contents_title, contents_content, 
                                     contents_web, ip, contents_passwd, contents_word, contents_rdate, file1, thumb1, size1)
VALUES(blog_contents_seq.nextval, 1, 1, '스프링', '열공열공', 'http://https://spring.io/','127.0.0.1','1234','스프링',sysdate,'spring.jsp','spring_t.jsp',23657);

-- LIST
SELECT contents_no, cate_no, member_no, contents_title, contents_content, 
                                     contents_web, ip, contents_passwd, contents_word, contents_rdate
FROM blog_contents;   

-- 1건 조회
SELECT contents_no, cate_no, member_no, contents_title, contents_content, 
                                     contents_web, ip, contents_passwd, contents_word, contents_rdate
FROM blog_contents
WHERE contents_no = 2;

-- 수정
UPDATE blog_contents
SET contents_title = '오늘은 어떤공부?', contents_content='어떤공부하지?', contents_web='http://google.com', contents_word='공부'
WHERE contents_no=3;

-- 패스워드 검사
SELECT COUNT(*) as passwd_cnt
FROM blog_contents
WHERE contents_no=4 AND contents_passwd=1234;

-- 삭제
DELETE FROM blog_contents
WHERE contents_no=5;

-- cateno별 목록
SELECT contents_no, member_no, cate_no, contents_title, contents_content, contents_web, ip, contents_passwd, contents_word, contents_rdate
FROM blog_contents
WHERE cate_no = 1
ORDER BY contents_no DESC;

COMMIT;
