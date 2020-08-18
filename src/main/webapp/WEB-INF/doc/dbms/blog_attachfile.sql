/**********************************/
/* Table Name: ÷������ */
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

COMMENT ON TABLE blog_attachfile is '÷������';
COMMENT ON COLUMN blog_attachfile.attachfile_no is '÷�����Ϲ�ȣ';
COMMENT ON COLUMN blog_attachfile.fname is '�������ϸ�';
COMMENT ON COLUMN blog_attachfile.fupname is '���ε����ϸ�';
COMMENT ON COLUMN blog_attachfile.thumb is 'Thumb ����';
COMMENT ON COLUMN blog_attachfile.fsize is '���ϻ�����';
COMMENT ON COLUMN blog_attachfile.attachfile_rdate is '���ϵ����';
COMMENT ON COLUMN blog_attachfile.contents_no is '��α���������ȣ';

DROP SEQUENCE blog_attachfile_seq;
CREATE SEQUENCE blog_attachfile_seq
    START WITH 1
    INCREMENT BY 1
    MAXVALUE 9999999999
    CACHE 2
    NOCYCLE;

-- 1) ���
INSERT INTO blog_attachfile(attachfile_no, contents_no, fname, fupname, thumb, fsize, attachfile_rdate)
VALUES(blog_attachfile_seq.nextval, 4, 'spring.png', 'spring_1.png', 'spring_t.png', 1000, sysdate);

INSERT INTO blog_attachfile(attachfile_no, contents_no, fname, fupname, thumb, fsize, attachfile_rdate)
VALUES(blog_attachfile_seq.nextval, 4, 'spring.png', 'spring_1.png', 'spring_t.png', 1000, sysdate);

INSERT INTO blog_attachfile(attachfile_no, contents_no, fname, fupname, thumb, fsize, attachfile_rdate)
VALUES(blog_attachfile_seq.nextval, 4, 'oracle.png', 'oracle_1.png', 'oracle_t.png', 1000, sysdate);

INSERT INTO blog_attachfile(attachfile_no, contents_no, fname, fupname, thumb, fsize, attachfile_rdate)
VALUES(blog_attachfile_seq.nextval, 4, 'java.jpg', 'java_1.jpg', 'java_t.jpg', 1000, sysdate);

-- 2) ��� (contents_no ���� ��������, attachfile_no ���� ��������)
SELECT attachfile_no, contents_no, fname, fupname, thumb, fsize, attachfile_rdate
FROM blog_attachfile
ORDER BY contents_no DESC, attachfile_no ASC;

-- 3) �ۺ� ���� ���(contents_no ���� ��������, attachfile_no ���� ��������)
SELECT attachfile_no, contents_no, fname, fupname, thumb, fsize, attachfile_rdate
FROM blog_attachfile
WHERE contents_no = 4
ORDER BY contents_no DESC, attachfile_no ASC;

-- 4) �ϳ��� ���� ����
DELETE FROM blog_attachfile
WHERE attachfile_no = 5;

--5) FK contentsno �θ�Ű �� ��ȸ
SELECT attachfile_no, contents_no, fname, fupname, thumb, fsize, attachfile_rdate
FROM blog_attachfile
WHERE contents_no = 4;

-- 6) �θ�Ű�� ���� ����
SELECT COUNT(*) as cnt
FROM blog_attachfile
WHERE contents_no = 4;

-- 7) FK �θ� ���̺� ���ڵ� ����
DELETE FROM blog_attachfile
WHERE contents_no = 5;

-- 8) Contents, Attachfile join
SELECT c.contents_title,
          a.attachfile_no, a.contents_no, a.fname, a.fupname, a.thumb, a.fsize, a.attachfile_rdate
FROM blog_contents c, blog_attachfile a
WHERE c.contents_no = a.contents_no
ORDER BY c.contents_no DESC, a.attachfile_no ASC;

--9) ��ȸ
SELECT attachfile_no, contents_no, fname, fupname, thumb, fsize, attachfile_rdate
FROM blog_attachfile
WHERE attachfile_no=2;
COMMIT;