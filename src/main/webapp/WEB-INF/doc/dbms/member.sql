/**********************************/
/* Table Name: 블로그 회원 */
/**********************************/
CREATE TABLE member(
		member_no                     		NUMBER(10)		 NOT NULL		 PRIMARY KEY
);

COMMENT ON TABLE member is '블로그 회원';
COMMENT ON COLUMN member.member_no is '블로그회원번호';

DROP SEQUENCE member_seq;
CREATE SEQUENCE member_seq
    START WITH 1   --시작
    INCREMENT BY 1 -- 증가 값
    MAXVALUE 9999999999 --최대 값: NUMBER(7) 대응
    CACHE 2     -- 2번은 메모리에서만 계산
    NOCYCLE;   -- 다시 1부터 새성 되는 것을 방지
    
-- CREATE
INSERT INTO member(member_no)
VALUES(member_seq.nextval);

SELECT * FROM member;

COMMIT;


