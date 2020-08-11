/**********************************/
/* Table Name: ��α� ī�װ� */
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

COMMENT ON TABLE blog_cate is '��α� ī�װ�';
COMMENT ON COLUMN blog_cate.cate_no is '��α�ī�װ���ȣ';
COMMENT ON COLUMN blog_cate.blog_categrpno is '��α�ī�װ��׷��ȣ';
COMMENT ON COLUMN blog_cate.cate_name is '��α�ī�װ��̸�';
COMMENT ON COLUMN blog_cate.cate_seqno is '��α�ī�װ���¼���';
COMMENT ON COLUMN blog_cate.cate_visible is '��α�ī�װ���¸��';
COMMENT ON COLUMN blog_cate.cate_rdate is '��α�ī�װ������';
COMMENT ON COLUMN blog_cate.cate_cnt is '��α�ī�װ���ϵȱۼ�';

DROP SEQUENCE blog_cate_seq;
CREATE SEQUENCE blog_cate_seq 
    START WITH 1           -- ���� ��ȣ
    INCREMENT BY 1       -- ���� ��
    MAXVALUE 9999999    -- �ִ밪: 9999999 --> NUMBER(7) ����
    CACHE 2                   -- 2���� �޸𸮿����� ���, �޸𸮿� �������� �̸� �Ҵ�
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

-- blog_categrp FK ���� �̿��� ����
DELETE FROM blog_cate
WHERE blog_categrpno = 2;

-- ��¼��� ����, 10 �� 1
UPDATE blog_cate
SET cate_seqno = cate_seqno-1
WHERE cate_no = 1;
COMMIT;

-- ��¼��� ����, 1 �� 10
UPDATE blog_cate
SET cate_seqno = cate_seqno+1
WHERE cate_no=2;

-- ��¸�� ����
UPDATE blog_cate
SET cate_visible = 'N'
WHERE cate_no=4;

COMMIT;