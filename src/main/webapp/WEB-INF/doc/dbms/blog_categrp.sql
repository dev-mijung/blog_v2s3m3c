/**********************************/
/* Table Name: ��α� ī�װ��׷� */
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

COMMENT ON TABLE blog_categrp is '��α� ī�װ��׷�';
COMMENT ON COLUMN blog_categrp.blog_categrpno is '��α�ī�װ��׷��ȣ';
COMMENT ON COLUMN blog_categrp.blog_name is '��α�ī�װ��̸�';
COMMENT ON COLUMN blog_categrp.blog_seqno is '��α���¼���';
COMMENT ON COLUMN blog_categrp.blog_visible is '��α���¸��';
COMMENT ON COLUMN blog_categrp.blog_rdate is '��α�ī�װ��׷������';

DROP SEQUENCE blog_categrp_seq;
CREATE SEQUENCE blog_categrp_seq
    START WITH 1           -- ���� ��ȣ
    INCREMENT BY 1       -- ���� ��
    MAXVALUE 9999999    -- �ִ밪: 9999999 --> NUMBER(7) ����
    CACHE 2                   -- 2���� �޸𸮿����� ���, �޸𸮿� �������� �̸� �Ҵ�
    NOCYCLE;                  -- �ٽ� 1���� �����Ǵ� ���� ����

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

-- ��¼��� ����, 10 �� 1
UPDATE blog_categrp
SET blog_seqno = blog_seqno - 1
WHERE blog_categrpno = 2;

-- ��¼��� ����, 1 �� 10
UPDATE blog_categrp
SET blog_seqno = blog_seqno + 1
WHERE blog_categrpno =3;

-- ��� ����� ����
UPDATE blog_categrp
SET blog_visible='Y'
WHERE blog_categrpno=4;

-- ����¡.
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

-- step 3 (1������)
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

-- step3 (2������)
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

-- �˻�����
SELECT COUNT(*) as cnt FROM blog_categrp;

commit;


-- Oralce ����
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

-- IN �������� ���
-- ���� ���� OR ����� ���� �����ϴ� ������ WHERE ���� ����Ҷ� �� �� �ִ� Ű����.
-- IN �����ڴ� ������ ������ �����ϴµ� ���. ���� �޸�(,)�� �����Ͽ� ��ȣ ���� ������,
-- �� �� �߿��� �ϳ� �̻�� ��ġ�ϸ� ���ǿ� �´� �� ���� �� ��.

SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate
FROM blog_categrp
WHERE blog_name IN ('JAVA','Spring')
ORDER BY blog_categrpno DESC;

-- IN �������� ����
-- ��Ͽ� ���� ���� ������ �϶�, IN �����ڰ� ���� ���⵵ ����, �����ϱ⵵ ����
-- IN�� ����ϸ� �� ������ ���� ���� ������ �� �ְ�, ������ ���� �پ��.
-- IN �����ڰ� OR �����ں��� ���� �ӵ��� ����
-- IN�� ���� ū ������ IN �����ڿ� �ٸ� SELECT���� ���� �� ����
-- ������ WHERE ���� ���� �� �� ũ�� Ȱ�� ��


-- NOT �������� ���
-- ������ ������ �� ���Ǵ� WHERE ���� Ű����.
-- NOT �����ڴ� ���״�� �ٷ� �ڿ� ���� ������ �����ϴ� ������ ��. 
-- ������ ȥ�ڼ��� ���� ����
-- �ٸ� �����ڿʹ� �޸� ���͸� �� ���� �ڰ� �ƴ� �տ� ��� ��
-- WHERE���� JAVA�� Spring�� ���� �� ��� ���� ���
SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate
FROM blog_categrp
WHERE NOT blog_name IN ('JAVA','Spring')
ORDER BY blog_categrpno DESC;

-- ��� ��� Ȯ�� �� NOT ������ �ϳ��� �߰��� ����� �� �ݴ��� ����� ������ �� ����
-- �ش� ���ǹ��� IN �����ڷ� ������ ���� �ϳ��� ���̶�� ���� NOT �����ڸ� ������� �ʰ�
-- != �Ǵ� <> ���� ���ǿ����ڸ� ����ص� ����� ���� ��

-- NOT �̳� IN �����ڸ� ������� ���� ���
SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate
FROM blog_categrp
WHERE blog_name != 'JAVA' AND blog_name <> 'Spring'
ORDER BY blog_categrpno DESC;

-- ���� ������츦 ��
SELECT blog_categrpno, blog_name, blog_seqno, blog_visible, blog_rdate
FROM blog_categrp
WHERE blog_name IS NOT NULL;

