/**********************************/
/* Table Name: ��α������� */
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

COMMENT ON TABLE blog_contents is '��α�������';
COMMENT ON COLUMN blog_contents.contents_no is '��α���������ȣ';
COMMENT ON COLUMN blog_contents.cate_no is '��α�ī�װ���ȣ';
COMMENT ON COLUMN blog_contents.member_no is '��α�ȸ����ȣ';
COMMENT ON COLUMN blog_contents.contents_title is '����������';
COMMENT ON COLUMN blog_contents.contents_content is '����������';
COMMENT ON COLUMN blog_contents.contents_recom is '��������õ��';
COMMENT ON COLUMN blog_contents.contents_cnt is '��������ȸ��';
COMMENT ON COLUMN blog_contents.contents_reply is '��������ۼ�';
COMMENT ON COLUMN blog_contents.contents_web is '���������ͳ��ּ�';
COMMENT ON COLUMN blog_contents.contents_map is '����������';
COMMENT ON COLUMN blog_contents.youtube is 'Youtube';
COMMENT ON COLUMN blog_contents.mp3 is 'MP3';
COMMENT ON COLUMN blog_contents.mp4 is 'MP4';
COMMENT ON COLUMN blog_contents.contents_visible is '��������¸��';
COMMENT ON COLUMN blog_contents.ip is 'IP';
COMMENT ON COLUMN blog_contents.contents_passwd is '�н�����';
COMMENT ON COLUMN blog_contents.contents_grpno is '�׷��ȣ';
COMMENT ON COLUMN blog_contents.contents_indent is '�鿩����/�亯����';
COMMENT ON COLUMN blog_contents.contents_ansnum is '�亯����';
COMMENT ON COLUMN blog_contents.contents_word is '�˻���';


