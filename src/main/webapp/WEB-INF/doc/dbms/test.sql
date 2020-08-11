DROP TABLE test;

CREATE TABLE test(
    testno  NUMBER(5)   NOT NULL, -- -99999 ~ +99999
    mname   VARCHAR(20) NOT NULL, -- �ѱ� 10��.
    funct   VARCHAR(50) NOT NULL, -- �ֿ� ��� �о�
    PRIMARY KEY (testno) --�ߺ� �� ��, ������ ���� ����
);

INSERT INTO test(testno, mname, funct)
VALUES(1, '�մ���', 'JAVA/JSP/SPRING');

INSERT INTO test(testno, mname, funct)
VALUES(2, '�Ʒι�', 'JAVA/JSP/Spring/JQuery');

INSERT INTO test(testno, mname, funct)
VALUES(3, '����', 'JAVA/JSP/Spring/JQuery/HTML5');

SELECT testno, mname, funct
From test
ORDER BY testno ASC;

-- VARCHAR Ÿ���� ���� ���� ���ڼ� Ȯ��
INSERT INTO test(testno, mname, funct)
VALUES(4, '������ �ݿ���', 'JAVA/JSP/Spring/JQuery/HTML5');

-- �ѱ�: 3byte, �� ���� ���ڴ� 1 byte(MySQL: ��� ���� 2byte ó�� ��)
INSERT INTO test(testno, mname, funct)
VALUES(5, '������ �ݿ��� FRIDAY', 'JAVA/JSP/Spring/JQuery/HTML5');
--ORA-12899: value too large for column "AI1"."TEST"."MNAME" (actual: 26, maximum: 20)

INSERT INTO test(testno, mname, funct)
VALUES(6, '������ �ݿ��� FRIDAY 2020', 'JAVA/JSP/Spring/JQuery/HTML5');
-- ORA-12899: value too large for column "AI1"."TEST"."MNAME" (actual: 31, maximum: 20)

SELECT testno, mname, funct FROM test ORDER BY testno ASC;

DELETE FROM test
WHERE testno = 4;

-- Oracle: �ѱ� 1�ڴ� 3����Ʈ, ������/����/Ư�����ڴ� 1����Ʈ ���
-- MySQL: varchar(10)�̸� ��� ���ڸ� 10�� ���� ����

commit;