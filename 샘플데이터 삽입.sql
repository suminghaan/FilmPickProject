INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, MEM_BD, MEM_GENDER, MEM_EMAIL, MEM_PHONE, PREF_GENRE, NICKNAME, MEM_STATUS, SIGNIN_DATE, MEM_LEVEL, MEM_COLOR, MEM_IMGPATH, MEM_FILE)
SELECT 
  SEQ_MEMBER_NO.NEXTVAL,
  'user' || LPAD(ROWNUM, 3, '0'), -- 아이디를 'user001', 'user002', ... 형식으로 생성
  'password' || LPAD(ROWNUM, 3, '0'), -- 패스워드를 'password001', 'password002', ... 형식으로 생성
  'Name' || LPAD(ROWNUM, 3, '0'), -- 이름을 'Name001', 'Name002', ... 형식으로 생성
  TO_CHAR(TO_DATE('1980-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE(1, 15000), 'YYYY-MM-DD'), -- 랜덤한 생년월일 생성
  CASE WHEN MOD(ROWNUM, 2) = 0 THEN 'M' ELSE 'F' END, -- 랜덤한 성별 생성
  'user' || LPAD(ROWNUM, 3, '0') || '@example.com', -- 이메일 생성
  '1234567890', -- 랜덤한 전화번호 생성
  CASE WHEN MOD(ROWNUM, 3) = 0 THEN 'Action' WHEN MOD(ROWNUM, 3) = 1 THEN 'Comedy' ELSE 'Drama' END, -- 랜덤한 선호장르 생성
  'Nickname' || LPAD(ROWNUM, 3, '0'), -- 닉네임을 'Nickname001', 'Nickname002', ... 형식으로 생성
  CASE WHEN MOD(ROWNUM, 2) = 0 THEN 'Y' ELSE 'N' END, -- 랜덤한 회원상태 생성
  SYSDATE - DBMS_RANDOM.VALUE(1, 365), -- 랜덤한 회원정보수정일 생성
  CASE WHEN ROWNUM <= 5 THEN 1 WHEN ROWNUM <= 15 THEN 2 ELSE 3 END, -- 회원등급을 1, 2, 3 중에서 랜덤하게 생성
  '#FFFFFF', -- 기본 회원정보색깔
  'resources/xxxx/xxxxx.jpg', -- 기본 회원정보 이미지 경로
  NULL -- NULL 값으로 MEM_FILE 생성
FROM 
  DUAL
CONNECT BY 
  LEVEL <= 30;
  
-- MEMBER 샘플데이터 삽입 끝

INSERT INTO ADMIN (ADMIN_NO, ADMIN_ID, ADMIN_PWD, ADMIN_NAME, ADMIN_PHONE, ADMIN_STATUS)
SELECT 
  SEQ_ADMIN_NO.NEXTVAL,
  'admin' || LPAD(ROWNUM, 2, '0'), -- 관리자 아이디를 'admin01', 'admin02', ... 형식으로 생성
  'password' || LPAD(ROWNUM, 2, '0'), -- 관리자 패스워드를 'password01', 'password02', ... 형식으로 생성
  'AdminName' || LPAD(ROWNUM, 2, '0'), -- 관리자 이름을 'AdminName01', 'AdminName02', ... 형식으로 생성
  '1234567890', -- 랜덤한 전화번호 생성
  CASE WHEN MOD(ROWNUM, 2) = 0 THEN 'Y' ELSE 'N' END -- 랜덤한 활성화 상태 생성
FROM 
  DUAL
CONNECT BY 
  LEVEL <= 5;
  
  -- ADMIN 샘플 데이터 삽입 끝
  
INSERT INTO BOARD (B_NO, B_TITLE, B_CONTENT, B_REGIST_DATE, B_READ_COUNT, B_RECOMMEND_COUNT, B_CATEGORY, B_B_STATUS, B_D_STATUS, MEM_NO)
SELECT 
  SEQ_BOARD_NO.NEXTVAL,
  'Title' || LPAD(ROWNUM, 2, '0'), -- 게시글 제목을 'Title01', 'Title02', ... 형식으로 생성
  'Content' || LPAD(ROWNUM, 2, '0'), -- 게시글 내용을 'Content01', 'Content02', ... 형식으로 생성
  SYSDATE - DBMS_RANDOM.VALUE(1, 365), -- 랜덤한 작성일 생성
  0, -- 초기 조회수를 0으로 설정
  0, -- 초기 추천수를 0으로 설정
  CASE WHEN MOD(ROWNUM, 2) = 0 THEN '1' ELSE '2' END, -- 영화(1) 또는 잡담(2) 카테고리를 랜덤하게 생성
  'N', -- B_B_STATUS의 기본값 'N' 사용
  'N', -- B_D_STATUS의 기본값 'N' 사용
  MOD(ROWNUM, 30) + 1 -- 1부터 30까지의 숫자를 순환하여 MEM_NO 생성
FROM 
  DUAL
CONNECT BY 
  LEVEL <= 30;
  
  -- BOARD 샘플 데이터 삽입 끝
  
  -- 15개의 샘플 데이터 삽입
INSERT INTO CATEGORY (CATEGORY_NO, CATEGORY_NAME, CATEGORY_DATE, CATEGORY_STATUS)
SELECT 
  SEQ_CATEGORY_NO.NEXTVAL,
  CASE 
    WHEN ROWNUM = 1 THEN '액션'
    WHEN ROWNUM = 2 THEN '코미디'
    WHEN ROWNUM = 3 THEN '로맨스'
    WHEN ROWNUM = 4 THEN '스릴러'
    WHEN ROWNUM = 5 THEN '공포'
    WHEN ROWNUM = 6 THEN '판타지'
    WHEN ROWNUM = 7 THEN '어드벤처'
    WHEN ROWNUM = 8 THEN '드라마'
    WHEN ROWNUM = 9 THEN '애니메이션'
    WHEN ROWNUM = 10 THEN 'SF'
    WHEN ROWNUM = 11 THEN '범죄'
    WHEN ROWNUM = 12 THEN '모험'
    WHEN ROWNUM = 13 THEN '다큐멘터리'
    WHEN ROWNUM = 14 THEN '가족'
    WHEN ROWNUM = 15 THEN '뮤지컬'
  END,
  SYSDATE - DBMS_RANDOM.VALUE(1, 365), -- 랜덤한 등록일 생성
  'Y' -- 장르 상태를 기본값 'Y'로 설정
FROM 
  DUAL
CONNECT BY 
  LEVEL <= 15;
-- CATEGORY 샘플 데이터 삽입 끝

-- 30개의 샘플 데이터 삽입
INSERT INTO NOTICE (NOTICE_NO, NOTICE_CATEGORY, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_READ_COUNT, ADMIN_NO, NOTICE_STATUS)
SELECT 
  SEQ_NOTICE_NO.NEXTVAL,
  CASE WHEN ROWNUM <= 15 THEN '1' ELSE '2' END, -- 일반(1) 또는 이벤트(2) 카테고리를 랜덤하게 생성
  'Title' || LPAD(ROWNUM, 2, '0'), -- 공지사항 제목을 'Title01', 'Title02', ... 형식으로 생성
  'Content' || LPAD(ROWNUM, 2, '0'), -- 공지사항 내용을 'Content01', 'Content02', ... 형식으로 생성
  SYSDATE - DBMS_RANDOM.VALUE(1, 365), -- 랜덤한 작성일 생성
  0, -- 초기 조회수를 0으로 설정
  MOD(ROWNUM, 5) + 1, -- 1부터 5까지의 숫자를 순환하여 ADMIN_NO 생성
  'Y' -- 공지사항 상태를 기본값 'Y'로 설정
FROM 
  DUAL
CONNECT BY 
  LEVEL <= 30;
  -- NOTICE 샘플 데이터 삽입 끝
  
  INSERT INTO REPLY (REPLY_NO, REPLY_CONTENT, ENROLL_DATE, REPLY_B_STATUS, REPLY_D_STATUS, BOARD_NO, MEM_NO)
SELECT 
  SEQ_REPLY_NO.NEXTVAL,
  'Content' || LPAD(ROWNUM, 2, '0'), -- 댓글 내용을 'Content01', 'Content02', ... 형식으로 생성
  SYSDATE - DBMS_RANDOM.VALUE(1, 365), -- 랜덤한 작성일 생성
  CASE WHEN ROWNUM <= 10 THEN 'Y' ELSE 'N' END, -- 처음 10개의 데이터는 'Y', 나머지는 'N'으로 REPLY_B_STATUS 설정
  CASE WHEN ROWNUM <= 10 THEN 'Y' ELSE 'N' END, -- 처음 10개의 데이터는 'Y', 나머지는 'N'으로 REPLY_D_STATUS 설정
  MOD(ROWNUM, 30) + 1, -- 1부터 30까지의 숫자를 순환하여 BOARD_NO 생성
  MOD(ROWNUM, 30) + 1 -- 1부터 30까지의 숫자를 순환하여 MEM_NO 생성
FROM 
  DUAL
CONNECT BY 
  LEVEL <= 120;
  -- REPLY 샘플 데이터 삽입 끝
  
  
  
-- MOVIE
------------------------ 김지우 ------------------------ 
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '파묘', '2024/02/22', 1, '134분', '미국 LA, 거액의 의뢰를 받은 무당 ‘화림’(김고은)과 ‘봉길’(이도현)은 기이한 병이 대물림되는 집안의 장손을 만난다. 조상의 묫자리가 화근임을 알아챈 ‘화림’은 이장을 권하고, 돈 냄새를 맡은 최고의 풍수사 ‘상덕’(최민식)과 장의사 ‘영근’(유해진)이 합류한다. “전부 잘 알 거야… 묘 하나 잘못 건들면 어떻게 되는지” 절대 사람이 묻힐 수 없는 악지에 자리한 기이한 묘. ‘상덕’은 불길한 기운을 느끼고 제안을 거절하지만, ‘화림’의 설득으로 결국 파묘가 시작되고… 나와서는 안될 것이 나왔다.', DEFAULT, '15세 이상', 'Y', DEFAULT, 1, 2, DEFAULT, DEFAULT);

INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '스즈메의 문단속', '2024/01/10', 2, '122분', '한 소녀가 우연히 만난 청년과 재난의 문을 닫는 모험에 뛰어들게 되는 이야기를 다룬 애니메이션 영화', DEFAULT, '12세 이상', 'N', DEFAULT, 3, 4, DEFAULT, DEFAULT);

INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '대외비', '2023/03/01', 1, '116분', '1992년 부산, 만년 국회의원 후보 해웅과 정치판의 숨은 실세 순태, 행동파 조폭 필도가 대한민국을 뒤흔들 비밀 문서를 손에 쥐고 판을 뒤집기 위한 치열한 쟁탈전을 벌이는 범죄드라마', DEFAULT, '15세 이상', 'N', DEFAULT, 5, 6, DEFAULT, DEFAULT);

INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '서울의 봄', '2023/11/22', 1, '141분', '1979년 12월 12일, 수도 서울 군사반란 발생 그날, 대한민국의 운명이 바뀌었다 대한민국을 뒤흔든 10월 26일 이후, 서울에 새로운 바람이 불어온 것도 잠시 12월 12일, 보안사령관 전두광이 반란을 일으키고 군 내 사조직을 총동원하여 최전선의 전방부대까지 서울로 불러들인다. 권력에 눈이 먼 전두광의 반란군과 이에 맞선 수도경비사령관 이태신을 비롯한 진압군 사이, 일촉즉발의 9시간이 흘러가는데… 목숨을 건 두 세력의 팽팽한 대립 오늘 밤, 대한민국 수도에서 가장 치열한 전쟁이 펼쳐진다!', DEFAULT, '12세 이상', 'N', DEFAULT, 7, 8, DEFAULT, DEFAULT);

INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '범죄도시3', '2023/05/31', 1, '105분', '대체불가 괴물형사 마석도, 서울 광수대로 발탁! 베트남 납치 살해범 검거 후 7년 뒤, ‘마석도’(마동석)는 새로운 팀원들과 함께 살인사건을 조사한다. 사건 조사 중, ‘마석도’는 신종 마약 사건이 연루되었음을 알게 되고 수사를 확대한다. 한편, 마약 사건의 배후인 주성철(이준혁)은 계속해서 판을 키워가고 약을 유통하던 일본 조직과 리키(아오키 무네타카)까지 한국에 들어오며 사건의 규모는 점점 더 커져가는데... 나쁜 놈들 잡는 데 이유 없고 제한 없다. 커진 판도 시원하게 싹 쓸어버린다!', DEFAULT, '15세 이상', 'N', DEFAULT, 9, 10, DEFAULT, DEFAULT);
--------------------------------------------------------------------------------------------------------------------------------

--수민  
INSERT INTO MOVIE
    VALUES(SEQ_MOVIE_NO.NEXTVAL
                ,  '범죄도시2'
                , '2022-05-18'
                , '1'
                , '106분'
                , '금천서 강력반은 베트남으로 도주한 용의자를 인도받아 오라는 임무를 받고 베트남에 갔다가 수년간 관광객을 노린 살인범을 발견한다.'
                , DEFAULT
                , '15세 이상'
                , 'N'
                , DEFAULT
                , 11
                , 12
                , DEFAULT
                , DEFAULT);
                
--------------------
INSERT INTO MOVIE
    VALUES(SEQ_MOVIE_NO.NEXTVAL
                ,  '한산: 용의 출현'
                , '2022-07-27'
                , '1'
                , '130분'
                , '명량대첩이 일어나기 5년 전인 1592년 7월 8일, 조선의 앞날은 여전히 풍전등화이다. 위기에 빠진 조국을 위한 이순신 장군의 진두지휘로 한산도 앞바다에서 조선 수군의 전략과 패기가 더해진 한산해전이 벌어진다.'
                , DEFAULT
                , '12세 이상'
                , 'N'
                , DEFAULT
                , 13
                , 14
                , DEFAULT
                , DEFAULT);
                
-------------

INSERT INTO MOVIE
    VALUES(SEQ_MOVIE_NO.NEXTVAL
                ,  '공조2: 인터내셔날'
                , '2022-09-07'
                , '1'
                , '129분'
                , '남한 형사 강진태와 북한 형사 림철령이 새로운 임무를 위해 다시 한번 뭉친다. 여기에 미국 FBI 잭이 끼어들며 각자의 목적을 이루기 위한 남북미 형사들의 삼각 공조가 펼쳐진다.'
                , DEFAULT
                , '15세 이상'
                , 'N'
                , DEFAULT
                , 15
                , 16
                , DEFAULT
                , DEFAULT);
                
        
-----------
INSERT INTO MOVIE
    VALUES(SEQ_MOVIE_NO.NEXTVAL
                ,  '헌트'
                , '2022-08-10'
                , '1'
                , '125분'
                , '박평호와 김정도는 북한 간첩 동림을 찾아내는 임무를 맡는다. 그러나 일급 기밀이 유출되어 조직 내 스파이가 있음을 알게 되고, 서로를 의심하며 추적하던 중 숨겨진 진실과 마주한다.'
                , DEFAULT
                , '15세 이상'
                , 'N'
                , DEFAULT
                , 17
                , 18
                , DEFAULT
                , DEFAULT);
                
                
-----------

INSERT INTO MOVIE
    VALUES(SEQ_MOVIE_NO.NEXTVAL
                ,  '올빼미'
                , '2022-11-23'
                , '1'
                , '118분'
                , '맹인임에도 뛰어난 침술 실력을 인정받은 경수는 궁에 들어가게 된다. 그러던 어느 날, 그는 어둠 속에서 희미하게 소현세자의 충격적인 죽음을 목격한다.'
                , DEFAULT
                , '15세 이상'
                , 'N'
                , DEFAULT
                , 19
                , 20
                , DEFAULT
                , DEFAULT);
            


---------------------- 이용훈 --------------------------------
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '닥터 두리틀', '2020-01-08', '2', '101분', '동물들과 소통하는 특별한 능력을 지닌 닥터 두리틀(로버트 다우니 주니어)은 사랑하는 사람을 잃고 세상과 단절한 채 동물들과 친구가 되어 살아간다.', 'N', '전체 관람가', 'N', 'N', 31, 32, 'Y', SYSDATE);
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '나쁜 녀석들 : 포에버', '2020-01-15', '2', '124분', '마이애미 강력반의 베테랑 형사 ‘마이크’[윌 스미스]는 여전히 범죄자를 소탕하는 데 열성적이지만, 그의 파트너 ‘마커스’[마틴 로렌스]는 이제 일선에서 물러나 가족과 함께 시간을 보내고 싶어한다.', 'N', '청소년 관람불가', 'N', 'N', 33, 34, 'Y', SYSDATE);
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '스파이 지니어스', '2020-01-22', '2', '102분', '전 세계를 위협하는 불법 무기 거래 첩보를 입수한 스파이 에이전트는 천상천하 유아독존 슈퍼 스파이 ‘랜스’(윌 스미스)를 파견한다. 하지만, 최첨단 장비로 무장한 정체불명의 빌런 ‘킬리언’(벤 맨델슨)은 ‘랜스’로 위장해 무기를 훔치고 그를 함정에 빠트린다.', 'N', '전체 관람가', 'N', 'N', 35, 36, 'Y', SYSDATE);
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '작은 아씨들', '2020-02-12', '2', '135분', '배우가 되고 싶은 첫째 메그(엠마 왓슨) 작가가 되고 싶은 둘째 조(시얼샤 로넌) 음악가가 되고 싶은 셋째 베스(엘리자 스캔런) 화가가 되고 싶은 막내 에이미(플로렌스 퓨) 이웃집 소년 로리(티모시 샬라메)는 네 자매를 우연히 알게되고 각기 다른 개성의 네 자매들과 인연을 쌓아간다.', 'N', '전체 관람가', 'N', 'N', 37, 38, 'Y', SYSDATE);
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '1917', '2020-02-19', '2', '119분', '제1차 세계대전이 한창인 1917년. 독일군에 의해 모든 통신망이 파괴된 상황 속에서 영국군 병사 ‘스코필드’(조지 맥케이)와 ‘블레이크’(딘-찰스 채프먼)에게 하나의 미션이 주어졌다.', 'N', '15세 관람가', 'N', 'N', 39, 40, 'Y', SYSDATE);


------------------------ 김호용 ------------------------ 
INSERT INTO MOVIE (MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, VIEW_RATING, MV_POSTER, MV_PREVIEW) 
VALUES (SEQ_MOVIE_NO.NEXTVAL, '기생충', '2019-05-30', '1', '131분', '전원 백수로 살고 있지만 사이좋은 기택 가족. 장남 기우에게 친구 민혁이 고액 과외를 연결시켜주고 온 가족의 기대를 받으며 기우는 박 사장의 집으로 간다.', '15세 이상', 41, 42);

INSERT INTO MOVIE (MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, VIEW_RATING, MV_POSTER, MV_PREVIEW) 
VALUES (SEQ_MOVIE_NO.NEXTVAL, '조커', '2019-10-01', '2', '123분', '고담시의 광대 아서 플렉은 코미디언을 꿈꾸고 있다. 그는 서서히 그가 맨 정신으로는 코미디언이 될 수 없다는 사실을 깨닫기 시작한다.', '15세 이상', 43, 44);

INSERT INTO MOVIE (MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, VIEW_RATING, MV_POSTER, MV_PREVIEW) 
VALUES (SEQ_MOVIE_NO.NEXTVAL, '어벤져스: 엔드게임', '2019-04-24', '2', '182분', '인피니티 워 이후 절반만 살아남은 지구. 살아남은 어벤져스 멤버들은 타노스에게 반격하기 위해 계획을 세운다.', '12세 이상', 45, 46);

INSERT INTO MOVIE (MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, VIEW_RATING, MV_POSTER, MV_PREVIEW) 
VALUES (SEQ_MOVIE_NO.NEXTVAL, '나이브스 아웃', '2019-12-04', '2', '130분', '베스트셀러 작가 할런이 85세 생일날 숨진 채 발견된다. 그의 죽음의 원인을 밝히기 위해 경찰과 탐정 브누아 블랑은 수사에 나서고, 가족 전체가 용의선상에 오른다.', '12세 이상', 47, 48);

INSERT INTO MOVIE (MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, VIEW_RATING, MV_POSTER, MV_PREVIEW) 
VALUES (SEQ_MOVIE_NO.NEXTVAL, '겨울왕국 2', '2019-11-21', '2', '103분', '의문의 목소리가 엘사를 부르고, 아렌델 왕국에 위기가 찾아온다. 트롤은 엘사의 힘의 비밀과 진실을 찾아야 한다고 하고, 엘사와 안나는 여행을 떠난다.', '전체관람가', 49, 50);

-- -------------------배기웅---------------------------
INSERT INTO MOVIE
VALUES (
    SEQ_MOVIE_NO.NEXTVAL,
    '신과함께- 인과 연',
    '2018-08-01',
    '1',
    '141분',
    '천 년 동안 48명의 망자를 환생시킨 저승 삼차사, 한 명만 더 환생시키면 그들도 새로운 삶을 얻을 수 있다. 하지만 강림(하정우)은 원귀였던 수홍(김동욱)을 자신들의 마지막 귀인으로 정하는 이해할 수 없는 선택을 한다. 저승법상 원귀는 소멸되어야 마땅하나 염라대왕(이정재)은 저승 삼차사에게 새로운 조건을 내걸며 강림의 제안을 수락한다. 염라의 조건은 성주신(마동석)이 버티고 있어 저승 차사들이 가는 족족 실패하는 허춘삼 노인을 수홍의 재판이 끝나기 전까지 저승으로 데려오는 것. 

허춘삼을 데리러 이승으로 내려간 해원맥(주지훈)과 덕춘(김향기), 하지만 성주신의 막강한 힘 앞에 속수무책으로 당하기만 하던 중 우연히 그가 천 년 전 과거에 해원맥과 덕춘을 저승으로 데려간 저승 차사였다는 사실을 알게 된다. 스스로도 기억 못 하는 과거에 대한 호기심으로 해원맥과 덕춘은 성주신과 거래를 시작하는데…

이승과 저승, 현재와 과거를 오가는 천 년의 비밀이 밝혀진다!',
    DEFAULT,
    '12세 이상',
    DEFAULT,
    DEFAULT,
    51,
    52,
    DEFAULT,
    DEFAULT
);

INSERT INTO MOVIE
VALUES (
    SEQ_MOVIE_NO.NEXTVAL,
    '안시성',
    '2018-09-19',
    '1',
    '135분',
    '우리는 물러서는 법을 배우지 못했다!
우리는 무릎 꿇는 법을 배우지 못했다!
우리는 항복이라는 걸 배우지 못했다!

천하를 손에 넣으려는 당 태종은 수십만 대군을 동원해 고구려의 변방 안시성을 침공한다.
20만 당나라 최강 대군 VS 5천 명의 안시성 군사들.
40배의 전력 차이에도 불구하고, 안시성 성주 양만춘과 전사들은 당나라에 맞서 싸우기로 결심하는데…

동아시아 역사상 가장 위대한 승리를 이끈 안시성 전투가 시작된다!',
    DEFAULT,
    '12세 이상',
    DEFAULT,
    DEFAULT,
    53,
    54,
    DEFAULT,
    DEFAULT
);

INSERT INTO MOVIE
VALUES (
    SEQ_MOVIE_NO.NEXTVAL,
    '레디 플레이어 원',
    '2018-03-28',
    '2',
    '140분',
    '2045년, 암울한 현실과 달리 가상현실 오아시스(OASIS)에서는 누구든 원하는 캐릭터로 어디든지 갈 수 있고, 뭐든지 할 수 있고 상상하는 모든 게 가능하다. 웨이드 와츠(타이 쉐리던) 역시 유일한 낙은 대부분의 사람들이 하루를 보내는 오아시스에 접속하는 것이다.

어느 날 오아시스의 창시자인 괴짜 천재 제임스 할리데이(마크 라이런스)는 자신이 가상현실 속에 숨겨둔 3개의 미션에서 우승하는 사람에게 오아시스의 소유권과 막대한 유산을 상속한다는 유언을 남기고, 그가 사랑했던 80년대 대중문화 속에 힌트가 있음을 알린다.
제임스 할리데이를 선망했던 소년 ‘웨이드 와츠’가 첫 번째 수수께끼를 푸는 데 성공하자 이를 저지하기 위해 현실에서 살인도 마다하지 않는 ‘IOI’라는 거대 기업이 뛰어든다.

모두의 꿈과 희망이 되는 오아시스를 지키기 위해서는 반드시 우승해야 한다!
그리고 우승을 위해서는 가상현실이 아닌 현실세계의 우정과 사랑의 힘이 필요하기만 한데…',
    DEFAULT,
    '12세 이상',
    DEFAULT,
    DEFAULT,
    55,
    56,
    DEFAULT,
    DEFAULT
);

INSERT INTO MOVIE
VALUES (
    SEQ_MOVIE_NO.NEXTVAL,
    '어벤져스 인피니티 워',
    '2018-04-25',
    '2',
    '149분',
    '가디언즈 오브 갤럭시 멤버들과 와칸다 군대, 닥터 스트레인지 등 새로운 팀들과 함께 환상의 대연합을 이룬 어벤져스, 역대 최강 빌런 타노스에 맞서 전 우주에 운명이 걸린 인피니티 스톤을 향한 무한 대결이 펼쳐진다!

마블의 클라이맥스를 목격하라!',
    DEFAULT,
    '12세 이상',
    DEFAULT,
    DEFAULT,
    57,
    58,
    DEFAULT,
    DEFAULT
);


INSERT INTO MOVIE
VALUES (
    SEQ_MOVIE_NO.NEXTVAL,
    '블랙팬서',
    '2018-02-14',
    '2',
    '135분',
    '‘시빌 워’ 이후 와칸다의 왕위를 계승한 티찰라(채드윅 보스만)는 와칸다에만 존재하는 최강 희귀 금속 ‘비브라늄’과 왕좌를 노리는 숙적들의 음모가 전세계적인 위협으로 번지자 세상을 구할 히어로 ‘블랙 팬서’로서 피할 수 없는 전쟁에 나서는데…',
    DEFAULT,
    '12세 이상',
    DEFAULT,
    DEFAULT,
    59,
    60,
    DEFAULT,
    DEFAULT
);

------------------------------------------------ 용훈 -------------------------------------------------
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '뮬란', '2020-09-17', '2', '115분', '무예에 남다른 재능을 지닌 ‘뮬란’은 좋은 집안과 인연을 맺어 가문을 빛내길 바라는 부모님의 뜻에 따라 본연의 모습을 억누르고 성장한다.', 'N', '12세 관람가', 'N', 'N', 61, 62, 'Y', SYSDATE);
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '원더 우먼 1984', '2020-12-23', '2', '151분', '1984년 모든 것이 활기찬 시대, 다이애나 프린스는 고고학자로서 인간들 사이에서 조용히 살고 있다.', 'N', '12세 관람가', 'N', 'N', 63, 64, 'Y', SYSDATE);
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '남산의 부장들', '2020-01-22', '1', '114분', '1979년 10월 26일, 중앙정보부장 김규평(이병헌)이 대한민국 대통령을 암살한다. 이 사건의 40일전, 미국에서는 전 중앙정보부장 박용각(곽도원)이 청문회를 통해 전 세계에 정권의 실체를 고발하며 파란을 일으킨다.', 'N', '15세 관람가', 'N', 'N', 65, 66, 'Y', SYSDATE);
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '다만 악에서 구하소서', '2020-08-05', '1', '108분', '태국에서 충격적인 납치사건이 발생하고 마지막 청부살인 미션을 끝낸 암살자 인남(황정민)은 그것이 자신과 관계된 것임을 알게 된다.', 'N', '15세 관람가', 'N', 'N', 67, 68, 'Y', SYSDATE);



--------파일 추가--------
-------수민--------
-----MOVIE_FILE_MP4
INSERT INTO ATTACHMENT
        VALUES(SEQ_ATTACHMENT_NO.NEXTVAL
                    , '범죄도시2_예고편_12.mp4'
                    , '20240318103404_75346.mp4'
                    , DEFAULT
                    , 2
                    , 'resources/upfiles/'
                    , 1
                    , DEFAULT
                    , 2
                    , 6);
--             
INSERT INTO ATTACHMENT
        VALUES(SEQ_ATTACHMENT_NO.NEXTVAL
                    , '한산_예고편_14.mp4'
                    , '20240218103403_75346.mp4'
                    , DEFAULT
                    , 2
                    , 'resources/upfiles/'
                    , 1
                    , DEFAULT
                    , 2
                    , 7);
                    
--
INSERT INTO ATTACHMENT
        VALUES(SEQ_ATTACHMENT_NO.NEXTVAL
                    , '공조2_예고편_16.mp4'
                    , '20240118103402_75346.mp4'
                    , DEFAULT
                    , 2
                    , 'resources/upfiles/'
                    , 1
                    , DEFAULT
                    , 2
                    , 8);
                    
--
INSERT INTO ATTACHMENT
        VALUES(SEQ_ATTACHMENT_NO.NEXTVAL
                    , '헌트_예고편_18.mp4'
                    , '20240128103401_75348.mp4'
                    , DEFAULT
                    , 2
                    , 'resources/upfiles/'
                    , 1
                    , DEFAULT
                    , 2
                    , 9);
                    
--
INSERT INTO ATTACHMENT
        VALUES(SEQ_ATTACHMENT_NO.NEXTVAL
                    , '올빼미_예고편_20.mp4'
                    , '20240308103401_75356.mp4'
                    , DEFAULT
                    , 2
                    , 'resources/upfiles/'
                    , 1
                    , DEFAULT
                    , 2
                    , 10);
                    
-----MOVIE_FILE_POSTER
INSERT INTO ATTACHMENT
        VALUES(SEQ_ATTACHMENT_NO.NEXTVAL
                    , '범죄도시2_11.png'
                    , '20240318103401_75346.png'
                    , DEFAULT
                    , 1
                    , 'resources/upfiles/'
                    , 1
                    , DEFAULT
                    , 1
                    , 6);
--             
INSERT INTO ATTACHMENT
        VALUES(SEQ_ATTACHMENT_NO.NEXTVAL
                    , '한산_13.png'
                    , '20240218103401_75346.png'
                    , DEFAULT
                    , 1
                    , 'resources/upfiles/'
                    , 1
                    , DEFAULT
                    , 1
                    , 7);
                    
--
INSERT INTO ATTACHMENT
        VALUES(SEQ_ATTACHMENT_NO.NEXTVAL
                    , '공조2_15.png'
                    , '20240118103401_75346.png'
                    , DEFAULT
                    , 1
                    , 'resources/upfiles/'
                    , 1
                    , DEFAULT
                    , 1
                    , 8);
                    
--
INSERT INTO ATTACHMENT
        VALUES(SEQ_ATTACHMENT_NO.NEXTVAL
                    , '헌트_17.png'
                    , '20240128103401_75346.png'
                    , DEFAULT
                    , 1
                    , 'resources/upfiles/'
                    , 1
                    , DEFAULT
                    , 1
                    , 9);
                    
--
INSERT INTO ATTACHMENT
        VALUES(SEQ_ATTACHMENT_NO.NEXTVAL
                    , '올빼미_19.png'
                    , '20240308103401_75346.png'
                    , DEFAULT
                    , 1
                    , 'resources/upfiles/'
                    , 1
                    , DEFAULT
                    , 1
                    , 10);
-------------------------------------------------- 김지우 ---------------------------------------------------
INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '파묘.png', '20240318103838_91929.png', SYSDATE, 1, 'resources/upfiles/', 1, DEFAULT, 1, 1);
INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '파묘 예고편.mp4', '20240318104140_63098.mp4', SYSDATE, 2, 'resources/upfiles/', 1, DEFAULT, 2, 1);

INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '스즈메의문단속.png', '20240318104334_13872.png', SYSDATE, 1, 'resources/upfiles/', 1, DEFAULT, 1, 2);
INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '스즈메의 문단속 예고편.mp4', '20240318104441_38300.mp4', SYSDATE, 2, 'resources/upfiles/', 1, DEFAULT, 2, 2);

INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '대외비.png', '20240318104522_63626.png', SYSDATE, 1, 'resources/upfiles/', 1, DEFAULT, 1, 3);
INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '대외비 예고편.mp4', '20240318104633_46273.mp4', SYSDATE, 2, 'resources/upfiles/', 1, DEFAULT, 2, 3);

INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '서울의봄.png', '20240318104722_50221.png', SYSDATE, 1, 'resources/upfiles/', 1, DEFAULT, 1, 4);
INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '서울의봄 예고편.mp4', '20240318104745_76619.mp4', SYSDATE, 2, 'resources/upfiles/', 1, DEFAULT, 2, 4);

INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '범죄도시.png', '20240318104801_78030.png', SYSDATE, 1, 'resources/upfiles/', 1, DEFAULT, 1, 5);
INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '범죄도시 예고편.mp4', '20240318104819_65085.mp4', SYSDATE, 2, 'resources/upfiles/', 1, DEFAULT, 2, 5);

------------------------------------- 용훈 ---------------------------------





INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '닥터 두리틀_31.jpeg',
    '20240314153026_17162.JPEG',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    16
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '닥터 두리틀_31.mp4',
    '20240314153026_55362.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    16
);

INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '나쁜 녀석들 포에버_33.jpeg', '20240314143028_55362.jpeg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 17);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '나쁜 녀석들 포에버_34.mp4', '20240314143038_56342.mp4', SYSDATE, 2, 'resources/upfiles/', 1, 'Y', '2', 17);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '스파이 지니어스_35.jpeg',
    '20240315113026_57552.JPEG',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    18
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '스파이 지니어스_36.mp4',
    '20240315136027_55552.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    18
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '작은 아씨들_37.jpeg',
    '20240315115026_51552.JPEG',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    19
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '작은 아씨들_38.mp4',
    '20240315135027_55852.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    19
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '1917_39.jpeg',
    '20240316115026_55751.JPEG',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    20
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '1917_40.mp4',
    '20240316135027_55722.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    20
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '뮬란_61.jpeg',
    '20240316125026_12751.JPEG',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    31
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '뮬란_62.mp4',
    '20240316125127_84722.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    31
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '원더 우먼 1984_63.jpeg',
    '20240316125152_18751.JPEG',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    32
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '원더 우먼 1984_64.mp4',
    '20240316125150_84422.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    32
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '남산의 부장들_65.jpeg',
    '20240317125152_22750.JPEG',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    33
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '남산의 부장들_66.mp4',
    '20240317125150_84312.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    33
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '다만 악에서 구하소서_67.jpeg',
    '20240317125152_22751.JPEG',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    34
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '다만 악에서 구하소서_68.mp4',
    '20240317125150_84313.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    34
);










INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '범죄도시3.png', '20240318104801_78030', SYSDATE, 1, 'resources/upfiles/', 1, DEFAULT, 1, 5);
INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '범죄도시3 예고편.mp4', '20240318104819_65085', SYSDATE, 2, 'resources/upfiles/', 1, DEFAULT, 2, 5);


-------------------------------------------------배기웅-----------------------------------------------------------------------------
INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '신과함께인과연.jpeg',
    '20240314153026_57162.jpeg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    26
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '신과함께인과연.mp4',
    '20240314153026_87842.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    26
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '안시성.jpeg',
    '20240314153026_57889.jpeg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    27
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '안시성.mp4',
    '20240314103026_87842.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    27
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '레디플레이어원.jpeg',
    '20240314154832_77889.jpeg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    28
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '레디플레이어원.mp4',
    '20220314103626_81242.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    28
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '어벤져스인피니티워.jpeg',
    '20210624154832_12889.jpeg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    29
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '어벤져스인피니티워.mp4',
    '20210814101026_11242.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    29
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '블랙팬서.jpeg',
    '20190714154832_12481.jpeg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    30
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '블랙팬서.mp4',
    '20230614101626_77842.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    30
);
