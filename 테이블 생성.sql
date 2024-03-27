-----------------해당 계정 내에 존재하는 DB 객체들 삭제하는 PLSQL문------------------
-- 해당 계정의 모든 트리거 삭제
BEGIN
FOR C IN (SELECT * FROM USER_TRIGGERS) LOOP
  EXECUTE IMMEDIATE 'DROP TRIGGER '||C.TRIGGER_NAME;
END LOOP;
END;
/
--해당 계정의 모든테이블 및 제약조건 삭제
BEGIN
    FOR C IN (SELECT * FROM USER_TABLES) LOOP
    EXECUTE IMMEDIATE ('DROP TABLE "'||C.TABLE_NAME||'" CASCADE CONSTRAINTS');
    END LOOP;
END;
/
--해당 계정의 모든 시퀀스 삭제
BEGIN
FOR C IN (SELECT * FROM USER_SEQUENCES) LOOP
  EXECUTE IMMEDIATE 'DROP SEQUENCE '||C.SEQUENCE_NAME;
END LOOP;
END;
/
--해당 계정의 모든 뷰 삭제
BEGIN
FOR C IN (SELECT * FROM USER_VIEWS) LOOP
  EXECUTE IMMEDIATE 'DROP VIEW '||C.VIEW_NAME;
END LOOP;
END;
/
------------------------------------------------------------------
CREATE TABLE "REPORTED_MEM" (
	"MEM_NO"	NUMBER		NOT NULL,
	"ADMIN_NO"	NUMBER		NOT NULL,
	"LIMIT_REASON"	VARCHAR2(50)		NULL,
	"START_DATE"	VARCHAR2(30)		NOT NULL,
	"END_DATE"	VARCHAR2(30)		NOT NULL
);

COMMENT ON COLUMN "REPORTED_MEM"."MEM_NO" IS '회원번호';

COMMENT ON COLUMN "REPORTED_MEM"."ADMIN_NO" IS '관리자번호';

COMMENT ON COLUMN "REPORTED_MEM"."LIMIT_REASON" IS '활동제한사유';

COMMENT ON COLUMN "REPORTED_MEM"."START_DATE" IS '활동 제한 시작일';

COMMENT ON COLUMN "REPORTED_MEM"."END_DATE" IS '활동 제한 종료일';

CREATE TABLE "MEMBER" (
	"MEM_NO"	NUMBER		NOT NULL,
	"MEM_ID"	VARCHAR2(25)		NOT NULL,
	"MEM_PWD"	VARCHAR2(40)		NOT NULL,
	"MEM_NAME"	VARCHAR2(15)		NOT NULL,
	"MEM_BD"	VARCHAR2(15)		NOT NULL,
	"MEM_GENDER"	CHAR(1)		NOT NULL,
	"MEM_EMAIL"	VARCHAR2(100)		NOT NULL,
	"MEM_PHONE"	VARCHAR2(13)		NOT NULL,
	"PREF_GENRE"	VARCHAR2(30)		NULL,
	"NICKNAME"	VARCHAR2(100)		NOT NULL,
	"MEM_STATUS"	CHAR(1)	DEFAULT 'Y'	NULL,
	"SIGNIN_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MEM_LEVEL"	NUMBER	DEFAULT 1	NULL,
	"MEM_COLOR"	VARCHAR2(40)	DEFAULT '#FFFFFF'	NULL,
	"MEM_IMGPATH"	VARCHAR2(300)		NULL,
	"MEM_FILE"	NUMBER		NULL,
	"TA_NO"	NUMBER		NULL
);

COMMENT ON COLUMN "MEMBER"."MEM_NO" IS '회원번호';

COMMENT ON COLUMN "MEMBER"."MEM_ID" IS '아이디';

COMMENT ON COLUMN "MEMBER"."MEM_PWD" IS '비밀번호';

COMMENT ON COLUMN "MEMBER"."MEM_NAME" IS '이름';

COMMENT ON COLUMN "MEMBER"."MEM_BD" IS '생년월일';

COMMENT ON COLUMN "MEMBER"."MEM_GENDER" IS 'M|F';

COMMENT ON COLUMN "MEMBER"."MEM_EMAIL" IS '이메일';

COMMENT ON COLUMN "MEMBER"."MEM_PHONE" IS '전화번호';

COMMENT ON COLUMN "MEMBER"."PREF_GENRE" IS '선호장르';

COMMENT ON COLUMN "MEMBER"."NICKNAME" IS '닉네임';

COMMENT ON COLUMN "MEMBER"."MEM_STATUS" IS '회원상태(Y|N)';

COMMENT ON COLUMN "MEMBER"."SIGNIN_DATE" IS '회원정보수정일';

COMMENT ON COLUMN "MEMBER"."MEM_LEVEL" IS '회원등급';

COMMENT ON COLUMN "MEMBER"."MEM_COLOR" IS '회원정보색깔';

COMMENT ON COLUMN "MEMBER"."MEM_IMGPATH" IS 'resources/xxxx/xxxxx.jpg';

COMMENT ON COLUMN "MEMBER"."MEM_FILE" IS '회원정보 등록파일';

CREATE TABLE "MOVIE_LIKE" (
	"LIKE_MOVIE_NO"	NUMBER		NOT NULL,
	"LIKE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"MV_NO"	NUMBER		NOT NULL,
	"MEM_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "MOVIE_LIKE"."LIKE_MOVIE_NO" IS '찜한영화번호';

COMMENT ON COLUMN "MOVIE_LIKE"."LIKE_DATE" IS '찜한날짜';

COMMENT ON COLUMN "MOVIE_LIKE"."MV_NO" IS '영화번호';

COMMENT ON COLUMN "MOVIE_LIKE"."MEM_NO" IS '회원번호';

CREATE TABLE "MOVIE" (
	"MV_NO"	NUMBER		NOT NULL,
	"MV_NAME"	VARCHAR2(500)		NOT NULL,
	"MV_OPENDATE"	VARCHAR2(50)		NOT NULL,
	"MV_NATION"	CHAR(1)	DEFAULT '1'	NULL,
	"MV_RTIME"	VARCHAR2(50)		NOT NULL,
	"MV_STORY"	VARCHAR2(4000)		NOT NULL,
	"FPAGE_EXPOSED"	CHAR(1)	DEFAULT 'N'	NULL,
	"VIEW_RATING"	VARCHAR2(50)		NOT NULL,
	"CURRENT_SCREENING"	CHAR(1)	DEFAULT 'N'	NULL,
	"MPAGE_EXPOSED"	CHAR(1)	DEFAULT 'N'	NULL,
	"MV_POSTER"	VARCHAR2(300)		NOT NULL,
	"MV_PREVIEW"	VARCHAR2(300)		NOT NULL,
	"MV_STATUS"	CHAR(1)	DEFAULT 'Y'	NULL,
	"MV_DATE"	DATE	DEFAULT SYSDATE	NULL
);

COMMENT ON COLUMN "MOVIE"."MV_NO" IS '영화번호';

COMMENT ON COLUMN "MOVIE"."MV_NAME" IS '영화제목';

COMMENT ON COLUMN "MOVIE"."MV_OPENDATE" IS '개봉일';

COMMENT ON COLUMN "MOVIE"."MV_NATION" IS '국가(국내1|해외2)';

COMMENT ON COLUMN "MOVIE"."MV_RTIME" IS '러닝타임';

COMMENT ON COLUMN "MOVIE"."MV_STORY" IS '줄거리';

COMMENT ON COLUMN "MOVIE"."FPAGE_EXPOSED" IS '1페이지노출여부';

COMMENT ON COLUMN "MOVIE"."VIEW_RATING" IS '관람등급';

COMMENT ON COLUMN "MOVIE"."CURRENT_SCREENING" IS '현재상영여부(Y(현재)|N(지난)|A(예정))';

COMMENT ON COLUMN "MOVIE"."MPAGE_EXPOSED" IS '메인페이지노출여부';

COMMENT ON COLUMN "MOVIE"."MV_POSTER" IS '영화메인포스터 파일경로';

COMMENT ON COLUMN "MOVIE"."MV_PREVIEW" IS '영화메인예고편 파일경로';

COMMENT ON COLUMN "MOVIE"."MV_STATUS" IS '영화상태 (Y|N)';

COMMENT ON COLUMN "MOVIE"."MV_DATE" IS '등록일';

CREATE TABLE "PERSON" (
	"P_NO"	NUMBER		NOT NULL,
	"P_NAME"	VARCHAR2(30)		NOT NULL,
	"P_JOB"	VARCHAR2(30)		NOT NULL,
	"P_BD"	VARCHAR2(30)		NOT NULL,
	"P_NATION"	VARCHAR2(30)		NOT NULL,
	"P_FILE"	VARCHAR2(300)		NULL
);

COMMENT ON COLUMN "PERSON"."P_NO" IS '인물번호';

COMMENT ON COLUMN "PERSON"."P_NAME" IS '이름';

COMMENT ON COLUMN "PERSON"."P_JOB" IS '직업';

COMMENT ON COLUMN "PERSON"."P_BD" IS '생년월일';

COMMENT ON COLUMN "PERSON"."P_NATION" IS '국가';

COMMENT ON COLUMN "PERSON"."P_FILE" IS '첨부파일경로';

CREATE TABLE "REVIEW" (
	"MV_REVIEW_NO"	NUMBER		NOT NULL,
	"REVIEW_CONTENT"	VARCHAR2(4000)		NULL,
	"REVIEW_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"LIKE_POINT"	NUMBER		NOT NULL,
	"MEM_NO"	NUMBER		NOT NULL,
	"MV_NO"	NUMBER		NOT NULL,
	"REVIEW_B_STATUS"	CHAR(1)	DEFAULT 'N'	NULL
);

COMMENT ON COLUMN "REVIEW"."MV_REVIEW_NO" IS '영화리뷰번호';

COMMENT ON COLUMN "REVIEW"."REVIEW_CONTENT" IS '리뷰내용';

COMMENT ON COLUMN "REVIEW"."REVIEW_DATE" IS '리뷰작성날짜';

COMMENT ON COLUMN "REVIEW"."LIKE_POINT" IS '별점';

COMMENT ON COLUMN "REVIEW"."MEM_NO" IS '회원번호';

COMMENT ON COLUMN "REVIEW"."MV_NO" IS '영화번호';

COMMENT ON COLUMN "REVIEW"."REVIEW_B_STATUS" IS 'Y|N';

CREATE TABLE "CASTING" (
	"CASTING_NO"	NUMBER		NOT NULL,
	"CASTING"	VARCHAR2(30)		NULL,
	"MOVIE_NO"	NUMBER		NOT NULL,
	"PERSON_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "CASTING"."CASTING_NO" IS '출연정보 번호';

COMMENT ON COLUMN "CASTING"."CASTING" IS '배역';

COMMENT ON COLUMN "CASTING"."MOVIE_NO" IS '영화번호';

COMMENT ON COLUMN "CASTING"."PERSON_NO" IS '인물번호';

CREATE TABLE "INQUIRY" (
	"INQRY_NO"	NUMBER		NOT NULL,
	"INQRY_TITLE"	VARCHAR2(400)		NOT NULL,
	"INQRY_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"INQRY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"INQRY_STATUS"	CHAR(1)	DEFAULT 'N'	NULL,
	"MEM_NO"	NUMBER		NOT NULL,
	"ADMIN_NO"	NUMBER		NULL,
	"INQRY_A_CONTENT"	VARCHAR2(4000)		NULL,
	"INQRY_A_DATE"	DATE		NULL
);

COMMENT ON COLUMN "INQUIRY"."INQRY_NO" IS '문의사항 번호';

COMMENT ON COLUMN "INQUIRY"."INQRY_TITLE" IS '제목';

COMMENT ON COLUMN "INQUIRY"."INQRY_CONTENT" IS '문의내용';

COMMENT ON COLUMN "INQUIRY"."INQRY_DATE" IS '작성일';

COMMENT ON COLUMN "INQUIRY"."INQRY_STATUS" IS '답변여부(Y|N)';

COMMENT ON COLUMN "INQUIRY"."MEM_NO" IS '회원번호';

COMMENT ON COLUMN "INQUIRY"."ADMIN_NO" IS '관리자번호';

COMMENT ON COLUMN "INQUIRY"."INQRY_A_CONTENT" IS '문의에 대한 답변';

COMMENT ON COLUMN "INQUIRY"."INQRY_A_DATE" IS '문의 답변 작성일';

CREATE TABLE "NO_MOVIE_ENROLL" (
	"NM_ENROLL_NO"	NUMBER		NOT NULL,
	"NM_TITLE"	VARCHAR2(500)		NOT NULL,
	"NM_STORY"	VARCHAR2(4000)		NOT NULL,
	"NM_RELEASE_DATE"	VARCHAR2(30)		NOT NULL,
	"NM_RUN_TIME"	VARCHAR2(50)		NOT NULL,
	"NM_USER_REQUEST"	VARCHAR2(1000)		NULL,
	"NM_NICKNAME_STATUS"	CHAR(1)	DEFAULT 'Y'	NULL,
	"NM_APPROVAL"	CHAR(1)	DEFAULT 'D'	NULL,
	"NM_NATION"	CHAR(1)	DEFAULT '1'	NULL,
	"NM_VIEW_GRADE"	CHAR(1)		NOT NULL,
	"NM_ENROLL_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"NM_REFUSE_REASON"	VARCHAR2(1000)		NULL,
	"MEM_NO"	NUMBER		NOT NULL,
	"ADMIN_NO"	NUMBER		NULL,
	"NM_POSTER"	VARCHAR2(300)		NOT NULL,
	"NM_PREVIEW"	VARCHAR2(300)		NOT NULL
);

COMMENT ON COLUMN "NO_MOVIE_ENROLL"."NM_ENROLL_NO" IS '없는 영화 신청 번호';

COMMENT ON COLUMN "NO_MOVIE_ENROLL"."NM_TITLE" IS '영화 제목';

COMMENT ON COLUMN "NO_MOVIE_ENROLL"."NM_STORY" IS '영화 줄거리';

COMMENT ON COLUMN "NO_MOVIE_ENROLL"."NM_RELEASE_DATE" IS '개봉일';

COMMENT ON COLUMN "NO_MOVIE_ENROLL"."NM_RUN_TIME" IS '런닝타임';

COMMENT ON COLUMN "NO_MOVIE_ENROLL"."NM_USER_REQUEST" IS '사용자 요청사항';

COMMENT ON COLUMN "NO_MOVIE_ENROLL"."NM_NICKNAME_STATUS" IS 'Y|N';

COMMENT ON COLUMN "NO_MOVIE_ENROLL"."NM_APPROVAL" IS 'Y|N|D(승인|거절|보류)';

COMMENT ON COLUMN "NO_MOVIE_ENROLL"."NM_NATION" IS '1|2(국내|해외)';

COMMENT ON COLUMN "NO_MOVIE_ENROLL"."NM_VIEW_GRADE" IS '1|2|3|4(전체|12세|15세|청불)';

COMMENT ON COLUMN "NO_MOVIE_ENROLL"."NM_ENROLL_DATE" IS '작성일';

COMMENT ON COLUMN "NO_MOVIE_ENROLL"."NM_REFUSE_REASON" IS '거절 및 반려 사유';

COMMENT ON COLUMN "NO_MOVIE_ENROLL"."MEM_NO" IS '회원번호';

COMMENT ON COLUMN "NO_MOVIE_ENROLL"."ADMIN_NO" IS '관리자번호';

COMMENT ON COLUMN "NO_MOVIE_ENROLL"."NM_POSTER" IS '영화 메인포스터';

COMMENT ON COLUMN "NO_MOVIE_ENROLL"."NM_PREVIEW" IS '영화 메인예고편';

CREATE TABLE "CATEGORY" (
	"CATEGORY_NO"	NUMBER		NOT NULL,
	"CATEGORY_NAME"	VARCHAR2(30)		NOT NULL,
	"CATEGORY_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"CATEGORY_STATUS"	CHAR(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "CATEGORY"."CATEGORY_NO" IS '장르번호';

COMMENT ON COLUMN "CATEGORY"."CATEGORY_NAME" IS '장르명';

COMMENT ON COLUMN "CATEGORY"."CATEGORY_DATE" IS '등록일';

COMMENT ON COLUMN "CATEGORY"."CATEGORY_STATUS" IS '장르 상태';

CREATE TABLE "MOVIE_CATEGORY" (
	"MV_CATEGORY_NO"	NUMBER		NOT NULL,
	"MV_NO"	NUMBER		NOT NULL,
	"CATEGORY_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "MOVIE_CATEGORY"."MV_CATEGORY_NO" IS '영화장르번호';

COMMENT ON COLUMN "MOVIE_CATEGORY"."MV_NO" IS '영화번호';

COMMENT ON COLUMN "MOVIE_CATEGORY"."CATEGORY_NO" IS '장르번호';

CREATE TABLE "NO_MOVIE_GENRE" (
	"NM_GENRE_NO"	NUMBER		NOT NULL,
	"CATEGORY_NO"	NUMBER		NOT NULL,
	"NM_ENROLL_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "NO_MOVIE_GENRE"."NM_GENRE_NO" IS '없는 영화 장르 번호';

COMMENT ON COLUMN "NO_MOVIE_GENRE"."CATEGORY_NO" IS '장르번호';

COMMENT ON COLUMN "NO_MOVIE_GENRE"."NM_ENROLL_NO" IS '없는 영화 신청 번호';

CREATE TABLE "ATTACHMENT" (
	"FILE_NO"	NUMBER		NOT NULL,
	"ORIGIN_NAME"	VARCHAR2(200)		NOT NULL,
	"CHANGE_NAME"	VARCHAR2(300)		NOT NULL,
	"UPLOAD_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"FILE_TYPE"	NUMBER		NOT NULL,
	"FILE_PATH"	VARCHAR2(500)		NOT NULL,
	"FILE_LEVEL"	NUMBER		NULL,
	"FILE_STATUS"	CHAR(1)	DEFAULT 'Y'	NULL,
	"REF_TYPE"	CHAR(1)		NOT NULL,
	"REF_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "ATTACHMENT"."FILE_NO" IS '첨부파일번호';

COMMENT ON COLUMN "ATTACHMENT"."ORIGIN_NAME" IS '첨부파일원본명';

COMMENT ON COLUMN "ATTACHMENT"."CHANGE_NAME" IS '첨부파일수정명';

COMMENT ON COLUMN "ATTACHMENT"."UPLOAD_DATE" IS '파일업로드날짜';

COMMENT ON COLUMN "ATTACHMENT"."FILE_TYPE" IS '사진|동영상(1|2)';

COMMENT ON COLUMN "ATTACHMENT"."FILE_PATH" IS '저장경로';

COMMENT ON COLUMN "ATTACHMENT"."FILE_LEVEL" IS '파일레벨 1|2 (메인|추가)';

COMMENT ON COLUMN "ATTACHMENT"."FILE_STATUS" IS '파일상태(Y|N)';

COMMENT ON COLUMN "ATTACHMENT"."REF_TYPE" IS '영화상세이미지/영화예고편/게시글...../없는영화';

COMMENT ON COLUMN "ATTACHMENT"."REF_NO" IS '영화번호/게시글번호';

CREATE TABLE "BOARD" (
	"B_NO"	NUMBER		NOT NULL,
	"B_TITLE"	VARCHAR2(200)		NOT NULL,
	"B_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"B_REGIST_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"B_READ_COUNT"	NUMBER	DEFAULT 0	NULL,
	"B_RECOMMEND_COUNT"	NUMBER	DEFAULT 0	NULL,
	"B_CATEGORY"	CHAR(1)		NOT NULL,
	"B_B_STATUS"	CHAR(1)	DEFAULT 'N'	NULL,
	"B_D_STATUS"	CHAR(1)	DEFAULT 'N'	NULL,
	"MEM_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "BOARD"."B_NO" IS '게시글 번호';

COMMENT ON COLUMN "BOARD"."B_TITLE" IS '게시글 제목';

COMMENT ON COLUMN "BOARD"."B_CONTENT" IS '게시글 내용';

COMMENT ON COLUMN "BOARD"."B_REGIST_DATE" IS '게시글 작성일';

COMMENT ON COLUMN "BOARD"."B_READ_COUNT" IS '게시글 조회수';

COMMENT ON COLUMN "BOARD"."B_RECOMMEND_COUNT" IS '게시글 추천수';

COMMENT ON COLUMN "BOARD"."B_CATEGORY" IS '1|2(영화|잡담)';

COMMENT ON COLUMN "BOARD"."B_B_STATUS" IS 'Y|N';

COMMENT ON COLUMN "BOARD"."B_D_STATUS" IS 'Y|N';

COMMENT ON COLUMN "BOARD"."MEM_NO" IS '회원번호';

CREATE TABLE "REPLY" (
	"REPLY_NO"	NUMBER		NOT NULL,
	"REPLY_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"ENROLL_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"REPLY_B_STATUS"	CHAR(1)	DEFAULT 'N'	NULL,
	"REPLY_D_STATUS"	CHAR(1)	DEFAULT 'N'	NULL,
	"BOARD_NO"	NUMBER		NOT NULL,
	"MEM_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "REPLY"."REPLY_NO" IS '댓글 번호';

COMMENT ON COLUMN "REPLY"."REPLY_CONTENT" IS '내용';

COMMENT ON COLUMN "REPLY"."ENROLL_DATE" IS '작성일';

COMMENT ON COLUMN "REPLY"."REPLY_B_STATUS" IS '신고여부(Y|N)';

COMMENT ON COLUMN "REPLY"."REPLY_D_STATUS" IS '삭제여부(Y|N)';

COMMENT ON COLUMN "REPLY"."BOARD_NO" IS '게시글 번호';

COMMENT ON COLUMN "REPLY"."MEM_NO" IS '회원번호';

CREATE TABLE "REPORT" (
	"REPORT_NO"	NUMBER		NOT NULL,
	"REPORT_TYPE"	CHAR(1)		NOT NULL,
	"REPORT_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"REPORT_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"REPORT_MEM_NO"	NUMBER		NOT NULL,
	"REPORTED_MEM_NO"	NUMBER		NOT NULL,
	"BOARD_NO_TYPE"	CHAR(1)		NULL,
	"REPORT_REF_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "REPORT"."REPORT_NO" IS '신고번호';

COMMENT ON COLUMN "REPORT"."REPORT_TYPE" IS '신고분류(1욕설|2도배|3선정|4기타)';

COMMENT ON COLUMN "REPORT"."REPORT_CONTENT" IS '신고 내용';

COMMENT ON COLUMN "REPORT"."REPORT_DATE" IS '신고 날짜';

COMMENT ON COLUMN "REPORT"."REPORT_MEM_NO" IS '신고한회원번호';

COMMENT ON COLUMN "REPORT"."REPORTED_MEM_NO" IS '신고받은회원번호';

COMMENT ON COLUMN "REPORT"."BOARD_NO_TYPE" IS '신고타입(1게시글|2댓글)';

COMMENT ON COLUMN "REPORT"."REPORT_REF_NO" IS '참조하는 게시글|댓글 번호';

CREATE TABLE "ADMIN" (
	"ADMIN_NO"	NUMBER		NOT NULL,
	"ADMIN_ID"	VARCHAR2(15)		NOT NULL,
	"ADMIN_PWD"	VARCHAR2(40)		NOT NULL,
	"ADMIN_NAME"	VARCHAR2(15)		NOT NULL,
	"ADMIN_PHONE"	VARCHAR2(13)		NOT NULL,
	"ADMIN_STATUS"	CHAR(1)	DEFAULT 'Y'	NULL
);

COMMENT ON COLUMN "ADMIN"."ADMIN_NO" IS '관리자번호';

COMMENT ON COLUMN "ADMIN"."ADMIN_ID" IS '관리자아이디';

COMMENT ON COLUMN "ADMIN"."ADMIN_PWD" IS '관리자비밀번호';

COMMENT ON COLUMN "ADMIN"."ADMIN_NAME" IS '관리자이름';

COMMENT ON COLUMN "ADMIN"."ADMIN_PHONE" IS '전화번호';

COMMENT ON COLUMN "ADMIN"."ADMIN_STATUS" IS '활성화상태(Y|N)';

CREATE TABLE "NO_MOVIE_CAST" (
	"NM_CAST_NO"	NUMBER		NOT NULL,
	"PERSON_NO"	NUMBER		NOT NULL,
	"NM_ENROLL_NO"	NUMBER		NOT NULL,
	"NM_CASTING"	VARCHAR2(30)		NULL
);

COMMENT ON COLUMN "NO_MOVIE_CAST"."NM_CAST_NO" IS '없는 영화 인물 번호';

COMMENT ON COLUMN "NO_MOVIE_CAST"."PERSON_NO" IS '인물번호';

COMMENT ON COLUMN "NO_MOVIE_CAST"."NM_ENROLL_NO" IS '없는 영화 신청 번호';

COMMENT ON COLUMN "NO_MOVIE_CAST"."NM_CASTING" IS '배역';

CREATE TABLE "NOTICE" (
	"NOTICE_NO"	NUMBER		NOT NULL,
	"NOTICE_CATEGORY"	CHAR(1)	DEFAULT '1'	NOT NULL,
	"NOTICE_TITLE"	VARCHAR2(400)		NOT NULL,
	"NOTICE_CONTENT"	VARCHAR2(4000)		NOT NULL,
	"NOTICE_DATE"	DATE	DEFAULT SYSDATE	NULL,
	"NOTICE_READ_COUNT"	NUMBER	DEFAULT 0	NULL,
	"ADMIN_NO"	NUMBER		NOT NULL,
	"NOTICE_STATUS"	CHAR(1)	DEFAULT 'Y'	NULL,
	"NOTICE_FIX"	CHAR(1)	DEFAULT 'N'	NOT NULL
);

COMMENT ON COLUMN "NOTICE"."NOTICE_NO" IS '공지사항번호';

COMMENT ON COLUMN "NOTICE"."NOTICE_CATEGORY" IS '일반|이벤트(1|2)';

COMMENT ON COLUMN "NOTICE"."NOTICE_TITLE" IS '제목';

COMMENT ON COLUMN "NOTICE"."NOTICE_CONTENT" IS '내용';

COMMENT ON COLUMN "NOTICE"."NOTICE_DATE" IS '작성일';

COMMENT ON COLUMN "NOTICE"."NOTICE_READ_COUNT" IS '조회수';

COMMENT ON COLUMN "NOTICE"."ADMIN_NO" IS '관리자번호';

COMMENT ON COLUMN "NOTICE"."NOTICE_STATUS" IS '공지사항상태(Y|N)';

COMMENT ON COLUMN "NOTICE"."NOTICE_FIX" IS '상단고정상태(Y|N)';

CREATE TABLE "APPROVAL" (
	"APPROVAL_NO"	NUMBER		NOT NULL,
	"APPROVAL_TYPE"	NUMBER		NOT NULL,
	"MEM_NO"	NUMBER		NOT NULL,
	"MV_REVIEW_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "APPROVAL"."APPROVAL_NO" IS '공감비공감번호';

COMMENT ON COLUMN "APPROVAL"."APPROVAL_TYPE" IS '(1|2)(공감|비공감)';

COMMENT ON COLUMN "APPROVAL"."MEM_NO" IS '회원번호';

COMMENT ON COLUMN "APPROVAL"."MV_REVIEW_NO" IS '영화리뷰번호';

CREATE TABLE "TASTE_ANALYSIS" (
	"TA_NO"	NUMBER		NOT NULL,
	"TA_CONTENT"	VARCHAR2(500)		NOT NULL
);

COMMENT ON COLUMN "TASTE_ANALYSIS"."TA_CONTENT" IS '취향분석멘트';

CREATE TABLE "RECOMMEND" (
	"RCM_NO"	NUMBER		NOT NULL,
	"B_NO"	NUMBER		NOT NULL,
	"MEM_NO"	NUMBER		NOT NULL
);

COMMENT ON COLUMN "RECOMMEND"."B_NO" IS '게시글 번호';

COMMENT ON COLUMN "RECOMMEND"."MEM_NO" IS '회원번호';

ALTER TABLE "REPORTED_MEM" ADD CONSTRAINT "PK_REPORTED_MEM" PRIMARY KEY (
	"MEM_NO"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "PK_MEMBER" PRIMARY KEY (
	"MEM_NO"
);

ALTER TABLE "MOVIE_LIKE" ADD CONSTRAINT "PK_MOVIE_LIKE" PRIMARY KEY (
	"LIKE_MOVIE_NO"
);

ALTER TABLE "MOVIE" ADD CONSTRAINT "PK_MOVIE" PRIMARY KEY (
	"MV_NO"
);

ALTER TABLE "PERSON" ADD CONSTRAINT "PK_PERSON" PRIMARY KEY (
	"P_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "PK_REVIEW" PRIMARY KEY (
	"MV_REVIEW_NO"
);

ALTER TABLE "CASTING" ADD CONSTRAINT "PK_CASTING" PRIMARY KEY (
	"CASTING_NO"
);

ALTER TABLE "INQUIRY" ADD CONSTRAINT "PK_INQUIRY" PRIMARY KEY (
	"INQRY_NO"
);

ALTER TABLE "NO_MOVIE_ENROLL" ADD CONSTRAINT "PK_NM_ENROLL" PRIMARY KEY (
	"NM_ENROLL_NO"
);

ALTER TABLE "CATEGORY" ADD CONSTRAINT "PK_CATEGORY" PRIMARY KEY (
	"CATEGORY_NO"
);

ALTER TABLE "MOVIE_CATEGORY" ADD CONSTRAINT "PK_MOVIE_CATEGORY" PRIMARY KEY (
	"MV_CATEGORY_NO"
);

ALTER TABLE "NO_MOVIE_GENRE" ADD CONSTRAINT "PK_NM_GENRE" PRIMARY KEY (
	"NM_GENRE_NO"
);

ALTER TABLE "ATTACHMENT" ADD CONSTRAINT "PK_ATTACHMENT" PRIMARY KEY (
	"FILE_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "PK_BOARD" PRIMARY KEY (
	"B_NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "PK_REPLY" PRIMARY KEY (
	"REPLY_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "PK_REPORT" PRIMARY KEY (
	"REPORT_NO"
);

ALTER TABLE "ADMIN" ADD CONSTRAINT "PK_ADMIN" PRIMARY KEY (
	"ADMIN_NO"
);

ALTER TABLE "NO_MOVIE_CAST" ADD CONSTRAINT "PK_NM_CAST" PRIMARY KEY (
	"NM_CAST_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "PK_NOTICE" PRIMARY KEY (
	"NOTICE_NO"
);

ALTER TABLE "APPROVAL" ADD CONSTRAINT "PK_APPROVAL" PRIMARY KEY (
	"APPROVAL_NO"
);

ALTER TABLE "TASTE_ANALYSIS" ADD CONSTRAINT "PK_TASTE_ANALY" PRIMARY KEY (
	"TA_NO"
);

ALTER TABLE "RECOMMEND" ADD CONSTRAINT "PK_RECOMMEND" PRIMARY KEY (
	"RCM_NO"
);

ALTER TABLE "REPORTED_MEM" ADD CONSTRAINT "FK_MEM_TO_REP_MEM_1" FOREIGN KEY (
	"MEM_NO"
)
REFERENCES "MEMBER" (
	"MEM_NO"
);

ALTER TABLE "REPORTED_MEM" ADD CONSTRAINT "FK_AD_TO_REP_MEM_1" FOREIGN KEY (
	"ADMIN_NO"
)
REFERENCES "ADMIN" (
	"ADMIN_NO"
);

ALTER TABLE "MEMBER" ADD CONSTRAINT "FK_TA_ANALY_TO_MEMBER_1" FOREIGN KEY (
	"TA_NO"
)
REFERENCES "TASTE_ANALYSIS" (
	"TA_NO"
);

ALTER TABLE "MOVIE_LIKE" ADD CONSTRAINT "FK_MOVIE_TO_MOVIE_LIKE_1" FOREIGN KEY (
	"MV_NO"
)
REFERENCES "MOVIE" (
	"MV_NO"
);

ALTER TABLE "MOVIE_LIKE" ADD CONSTRAINT "FK_MEMBER_TO_MOVIE_LIKE_1" FOREIGN KEY (
	"MEM_NO"
)
REFERENCES "MEMBER" (
	"MEM_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_MEMBER_TO_REVIEW_1" FOREIGN KEY (
	"MEM_NO"
)
REFERENCES "MEMBER" (
	"MEM_NO"
);

ALTER TABLE "REVIEW" ADD CONSTRAINT "FK_MOVIE_TO_REVIEW_1" FOREIGN KEY (
	"MV_NO"
)
REFERENCES "MOVIE" (
	"MV_NO"
);

ALTER TABLE "CASTING" ADD CONSTRAINT "FK_MOVIE_TO_CASTING_1" FOREIGN KEY (
	"MOVIE_NO"
)
REFERENCES "MOVIE" (
	"MV_NO"
);

ALTER TABLE "CASTING" ADD CONSTRAINT "FK_PERSON_TO_CASTING_1" FOREIGN KEY (
	"PERSON_NO"
)
REFERENCES "PERSON" (
	"P_NO"
);

ALTER TABLE "INQUIRY" ADD CONSTRAINT "FK_MEMBER_TO_INQUIRY_1" FOREIGN KEY (
	"MEM_NO"
)
REFERENCES "MEMBER" (
	"MEM_NO"
);

ALTER TABLE "INQUIRY" ADD CONSTRAINT "FK_ADMIN_TO_INQUIRY_1" FOREIGN KEY (
	"ADMIN_NO"
)
REFERENCES "ADMIN" (
	"ADMIN_NO"
);

ALTER TABLE "NO_MOVIE_ENROLL" ADD CONSTRAINT "FK_MEMBER_TO_NM_EN_1" FOREIGN KEY (
	"MEM_NO"
)
REFERENCES "MEMBER" (
	"MEM_NO"
);

ALTER TABLE "NO_MOVIE_ENROLL" ADD CONSTRAINT "FK_ADMIN_TO_NO_M_EN_1" FOREIGN KEY (
	"ADMIN_NO"
)
REFERENCES "ADMIN" (
	"ADMIN_NO"
);

ALTER TABLE "MOVIE_CATEGORY" ADD CONSTRAINT "FK_MOVIE_TO_M_CG_1" FOREIGN KEY (
	"MV_NO"
)
REFERENCES "MOVIE" (
	"MV_NO"
);

ALTER TABLE "MOVIE_CATEGORY" ADD CONSTRAINT "FK_CG_TO_M_CG_1" FOREIGN KEY (
	"CATEGORY_NO"
)
REFERENCES "CATEGORY" (
	"CATEGORY_NO"
);

ALTER TABLE "NO_MOVIE_GENRE" ADD CONSTRAINT "FK_CG_TO_NM_GENRE_1" FOREIGN KEY (
	"CATEGORY_NO"
)
REFERENCES "CATEGORY" (
	"CATEGORY_NO"
);

ALTER TABLE "NO_MOVIE_GENRE" ADD CONSTRAINT "FK_NM_EN_TO_NM_GENRE_1" FOREIGN KEY (
	"NM_ENROLL_NO"
)
REFERENCES "NO_MOVIE_ENROLL" (
	"NM_ENROLL_NO"
);

ALTER TABLE "BOARD" ADD CONSTRAINT "FK_MEMBER_TO_BOARD_1" FOREIGN KEY (
	"MEM_NO"
)
REFERENCES "MEMBER" (
	"MEM_NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "FK_BOARD_TO_REPLY_1" FOREIGN KEY (
	"BOARD_NO"
)
REFERENCES "BOARD" (
	"B_NO"
);

ALTER TABLE "REPLY" ADD CONSTRAINT "FK_MEMBER_TO_REPLY_1" FOREIGN KEY (
	"MEM_NO"
)
REFERENCES "MEMBER" (
	"MEM_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "FK_MEMBER_TO_REPORT_1" FOREIGN KEY (
	"REPORT_MEM_NO"
)
REFERENCES "MEMBER" (
	"MEM_NO"
);

ALTER TABLE "REPORT" ADD CONSTRAINT "FK_MEMBER_TO_REPORT_2" FOREIGN KEY (
	"REPORTED_MEM_NO"
)
REFERENCES "MEMBER" (
	"MEM_NO"
);

ALTER TABLE "NO_MOVIE_CAST" ADD CONSTRAINT "FK_PN_TO_NM_CAST_1" FOREIGN KEY (
	"PERSON_NO"
)
REFERENCES "PERSON" (
	"P_NO"
);

ALTER TABLE "NO_MOVIE_CAST" ADD CONSTRAINT "FK_NM_EN_TO_NM_CAST_1" FOREIGN KEY (
	"NM_ENROLL_NO"
)
REFERENCES "NO_MOVIE_ENROLL" (
	"NM_ENROLL_NO"
);

ALTER TABLE "NOTICE" ADD CONSTRAINT "FK_ADMIN_TO_NOTICE_1" FOREIGN KEY (
	"ADMIN_NO"
)
REFERENCES "ADMIN" (
	"ADMIN_NO"
);

ALTER TABLE "APPROVAL" ADD CONSTRAINT "FK_MEMBER_TO_APPROVAL_1" FOREIGN KEY (
	"MEM_NO"
)
REFERENCES "MEMBER" (
	"MEM_NO"
);

ALTER TABLE "APPROVAL" ADD CONSTRAINT "FK_REVIEW_TO_APPROVAL_1" FOREIGN KEY (
	"MV_REVIEW_NO"
)
REFERENCES "REVIEW" (
	"MV_REVIEW_NO"
);

ALTER TABLE "RECOMMEND" ADD CONSTRAINT "FK_BOARD_TO_RECOMMEND_1" FOREIGN KEY (
	"B_NO"
)
REFERENCES "BOARD" (
	"B_NO"
);

ALTER TABLE "RECOMMEND" ADD CONSTRAINT "FK_MEMBER_TO_RECOMMEND_1" FOREIGN KEY (
	"MEM_NO"
)
REFERENCES "MEMBER" (
	"MEM_NO"
);

CREATE SEQUENCE SEQ_ADMIN_NO
NOCACHE;

CREATE SEQUENCE SEQ_APPROVAL_NO
NOCACHE;

CREATE SEQUENCE SEQ_ATTACHMENT_NO
NOCACHE;

CREATE SEQUENCE SEQ_BOARD_NO
NOCACHE;

CREATE SEQUENCE SEQ_CASTING_NO
NOCACHE;

CREATE SEQUENCE SEQ_CATEGORY_NO
NOCACHE;

CREATE SEQUENCE SEQ_INQUIRY_NO
NOCACHE;

CREATE SEQUENCE SEQ_MEMBER_NO
NOCACHE;

CREATE SEQUENCE SEQ_MOVIE_NO
NOCACHE;

CREATE SEQUENCE SEQ_MOVIE_CATEGORY_NO
NOCACHE;

CREATE SEQUENCE SEQ_MOVIE_LIKE_NO
NOCACHE;

CREATE SEQUENCE SEQ_NO_MOVIE_CAST_NO
NOCACHE;

CREATE SEQUENCE SEQ_NO_MOVIE_ENROLL_NO
NOCACHE;

CREATE SEQUENCE SEQ_NO_MOVIE_GENRE_NO
NOCACHE;

CREATE SEQUENCE SEQ_NOTICE_NO
NOCACHE;

CREATE SEQUENCE SEQ_PERSON_NO
NOCACHE;

CREATE SEQUENCE SEQ_REPLY_NO
NOCACHE;

CREATE SEQUENCE SEQ_REPORT_NO
NOCACHE;

CREATE SEQUENCE SEQ_REPORTED_MEM_NO
NOCACHE;

CREATE SEQUENCE SEQ_REVIEW_NO
NOCACHE;

CREATE SEQUENCE SEQ_TASTE_ANALYSIS_NO
NOCACHE;

CREATE SEQUENCE SEQ_RECOMMEND_NO
NOCACHE;

-- 배역이 긴 경우가 있어서 크기 늘림
ALTER TABLE CASTING MODIFY (CASTING VARCHAR2(100));

ALTER TABLE MEMBER
ADD DORMANT_STATUS CHAR(1) DEFAULT 'N' NULL;

COMMENT ON COLUMN "MEMBER"."DORMANT_STATUS" IS '휴면 상태(Y|N)';

-- 탈퇴회원 테이블 생성
CREATE TABLE "CANCELED_MEM" (
	"MEM_NO"	NUMBER		NOT NULL,
	"ADMIN_NO"	NUMBER		NULL,
	"CANCEL_DATE"	VARCHAR2(30) NOT NULL
);

COMMENT ON COLUMN "CANCELED_MEM"."MEM_NO" IS '회원번호';
COMMENT ON COLUMN "CANCELED_MEM"."ADMIN_NO" IS '관리자번호';
COMMENT ON COLUMN "CANCELED_MEM"."CANCEL_DATE" IS '탈퇴일';

ALTER TABLE "CANCELED_MEM" ADD CONSTRAINT "PK_CANCELED_MEM" PRIMARY KEY (
	"MEM_NO"
);

ALTER TABLE "CANCELED_MEM" ADD CONSTRAINT "FK_AD_TO_CANCELED_MEM" FOREIGN KEY (
	"ADMIN_NO"
)
REFERENCES "ADMIN" (
	"ADMIN_NO"
);

ALTER TABLE "CANCELED_MEM" ADD CONSTRAINT "FK_MEM_TO_CANCELED_MEM" FOREIGN KEY (
	"MEM_NO"
)
REFERENCES "MEMBER" (
	"MEM_NO"
);


ALTER TABLE NO_MOVIE_ENROLL MODIFY (NM_VIEW_GRADE VARCHAR2(50 BYTE));

COMMENT ON COLUMN NO_MOVIE_ENROLL.NM_VIEW_GRADE IS '관람등급(전체|12세|15세|청불)';

COMMIT;