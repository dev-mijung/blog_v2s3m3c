/**********************************/
/* Table Name: ��α������� */
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
        size1     NUMBER(10)            DEFAULT 0 NULL, --��ǥ�̹����� ������ ��
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
COMMENT ON COLUMN blog_contents.contents_rdate is '�����';
COMMENT ON COLUMN blog_contents.file1 is '�����̹���';
COMMENT ON COLUMN blog_contents.thumb1 is '�����̹��� Preview';
COMMENT ON COLUMN blog_contents.size1 is '�����̹��� ũ��';

DROP SEQUENCE blog_contents_seq;
CREATE SEQUENCE blog_contents_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999999999
    CACHE 2
    NOCYCLE;
    
-- ���� sequence�� Ȯ��
-- sequence ��ü�� currentval �Լ��� �̿��ϸ� 
-- ������ �� PK �� Ȯ���� �� �ִµ�. ������ ���� ������ ��° �����̶��? ��������� �ִٴ� ��
-- <SelectKey> �±״� PK���� �̸�(before) SQL�� ���ؼ� ó���� �ΰ� Ư���� �̸����� ����� �����ϴ� ���

SELECT blog_contents_seq.nextval FROM dual;
SELECT blog_contents_seq.currval FROM dual;

-- CREATE
INSERT INTO blog_contents(contents_no, cate_no, member_no, contents_title, contents_content, 
                                     contents_web, ip, contents_passwd, contents_word, contents_rdate, file1, thumb1, size1)
VALUES(blog_contents_seq.nextval, 1, 1, '������', '��������', 'http://https://spring.io/','127.0.0.1','1234','������',sysdate,'spring.jsp','spring_t.jsp',23657);

INSERT INTO blog_contents(contents_no, cate_no, member_no, contents_title, contents_content, 
                                     contents_web, ip, contents_passwd, contents_word, contents_rdate, file1, thumb1, size1)
VALUES(blog_contents_seq.nextval, 1, 1, '������', '��������', 'http://https://spring.io/','127.0.0.1','1234','������',sysdate,'spring.jsp','spring_t.jsp',23657);

INSERT INTO blog_contents(contents_no, cate_no, member_no, contents_title, contents_content, 
                                     contents_web, ip, contents_passwd, contents_word, contents_rdate, file1, thumb1, size1)
VALUES(blog_contents_seq.nextval, 1, 1, '������', '��������', 'http://https://spring.io/','127.0.0.1','1234','������',sysdate,'spring.jsp','spring_t.jsp',23657);

-- LIST
SELECT contents_no, cate_no, member_no, contents_title, contents_content, 
                                     contents_web, ip, contents_passwd, contents_word, contents_rdate
FROM blog_contents;   

-- 1�� ��ȸ
SELECT contents_no, cate_no, member_no, contents_title, contents_content, 
                                     contents_web, ip, contents_passwd, contents_word, contents_rdate
FROM blog_contents
WHERE contents_no = 2;

-- ����
UPDATE blog_contents
SET contents_title = '������ �����?', contents_content='���������?', contents_web='http://google.com', contents_word='����'
WHERE contents_no=3;

-- �н����� �˻�
SELECT COUNT(*) as passwd_cnt
FROM blog_contents
WHERE contents_no=4 AND contents_passwd=1234;

-- ����
DELETE FROM blog_contents
WHERE contents_no=5;

-- cateno�� ���
SELECT contents_no, member_no, cate_no, contents_title, contents_content, contents_web, ip, contents_passwd, contents_word, contents_rdate
FROM blog_contents
WHERE cate_no = 1
ORDER BY contents_no DESC;

COMMIT;
