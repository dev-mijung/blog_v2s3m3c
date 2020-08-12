/**********************************/
/* Table Name: ��α� ȸ�� */
/**********************************/
CREATE TABLE member(
		member_no                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE member is '��α� ȸ��';
COMMENT ON COLUMN member.member_no is '��α�ȸ����ȣ';

DROP SEQUENCE member_seq;
CREATE SEQUENCE member_seq
    START WITH 1   --����
    INCREMENT BY 1 -- ���� ��
    MAXVALUE 9999999999 --�ִ� ��: NUMBER(7) ����
    CACHE 2     -- 2���� �޸𸮿����� ���
    NOCYCLE;   -- �ٽ� 1���� ���� �Ǵ� ���� ����
    
-- CREATE
INSERT INTO member(member_no)
VALUES(member_seq.nextval);

SELECT * FROM member;

COMMIT;


