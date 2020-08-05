CREATE SEQUENCE MYMVCBOARDSEQ NOCACHE;

CREATE TABLE MYMVCBOARD( 
	SEQ NUMBER PRIMARY KEY,
	WRITER VARCHAR2(200) NOT NULL,
	TITLE VARCHAR2(2000) NOT NULL,
	CONTENT VARCHAR2(4000) NOT NULL,
	REGDATE DATE NOT NULL
);

INSERT INTO MYMVCBOARD VALUES
(MYMVCBOARDSEQ.NEXTVAL , '관리자' , '테스트' , '테스트중입니다.1235' ,SYSDATE );

SELECT * FROM MYMVCBOARD;