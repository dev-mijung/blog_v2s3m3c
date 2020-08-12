/**********************************/
/* Table Name: 블로그컨텐츠 */
/**********************************/
CREATE TABLE blog_contents(
		contents_no                   		NUMBER(10)		 NOT NULL		 PRIMARY KEY,
		cate_no                       		NUMBER(10)		 NOT NULL,
		member_no                     		NUMBER(10)		 NOT NULL,
		contents_title                		VARCHAR2(300)		 NOT NULL,
		contents_content              		CLOB            	 NOT NULL,
		contents_recom                		NUMBER(7)		 NOT NULL,
		contents_cnt                  		NUMBER(7)		 NOT NULL,
		contents_reply                		NUMBER(7)		 NOT NULL,
		contents_web                  		VARCHAR2(500)		 NULL ,
		contents_map                  		VARCHAR2(1000)		 NULL ,
		youtube                       		VARCHAR2(1000)		 NULL ,
		mp3                           		VARCHAR2(1000)		 NULL ,
		mp4                           		VARCHAR2(1000)		 NULL ,
		contents_visible              		CHAR(1)		 DEFAULT 'Y'		 NOT NULL,
		ip                            		VARCHAR2(15)		 NOT NULL,
		contents_passwd               		VARCHAR2(15)		 NOT NULL,
		contents_grpno                		NUMBER(8)		 NOT NULL,
		contents_indent               		NUMBER(2)		 NOT NULL,
		contents_ansnum               		NUMBER(3)		 NOT NULL,
		contents_word                 		VARCHAR2(300)		 NULL ,
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


