    INSERT INTO
    TASTE_ANALYSIS
VALUES
    (
        SEQ_TASTE_ANALYSIS_NO.NEXTVAL,
        '대체로 작품을 즐기지만 때론 혹평도 마다치 않는 이성파'
    );
    
INSERT INTO
    TASTE_ANALYSIS
VALUES
    (
        SEQ_TASTE_ANALYSIS_NO.NEXTVAL,
        '편식 없이 골고루 보는 균형파'
    );
    
INSERT INTO
    TASTE_ANALYSIS
VALUES
    (
        SEQ_TASTE_ANALYSIS_NO.NEXTVAL,
        '작품을 정말로 즐길 줄 아는 현명파'
    );

INSERT INTO
    TASTE_ANALYSIS
VALUES
    (
        SEQ_TASTE_ANALYSIS_NO.NEXTVAL,
        '평가에 있어 주관이 뚜렷한 소나무파'
    );

INSERT INTO
    TASTE_ANALYSIS
VALUES
    (
        SEQ_TASTE_ANALYSIS_NO.NEXTVAL,
        '대중의 평가에 잘 휘둘리지 않는 지조파'
    );



INSERT INTO MEMBER (MEM_NO, MEM_ID, MEM_PWD, MEM_NAME, MEM_BD, MEM_GENDER, MEM_EMAIL, MEM_PHONE, PREF_GENRE, NICKNAME, MEM_STATUS, SIGNIN_DATE, MEM_LEVEL, MEM_COLOR, MEM_IMGPATH, MEM_FILE, TA_NO, DORMANT_STATUS)
SELECT 
  SEQ_MEMBER_NO.NEXTVAL,
  'user' || LPAD(ROWNUM, 3, '0'), -- 아이디를 'user001', 'user002', ... 형식으로 생성
  'password' || LPAD(ROWNUM, 3, '0'), -- 패스워드를 'password001', 'password002', ... 형식으로 생성
  'Name' || LPAD(ROWNUM, 3, '0'), -- 이름을 'Name001', 'Name002', ... 형식으로 생성
  TO_CHAR(TO_DATE('1980-01-01', 'YYYY-MM-DD') + DBMS_RANDOM.VALUE(1, 15000), 'YYYY-MM-DD'), -- 랜덤한 생년월일 생성
  CASE WHEN MOD(ROWNUM, 2) = 0 THEN 'M' ELSE 'F' END, -- 랜덤한 성별 생성
  'user' || LPAD(ROWNUM, 3, '0') || '@example.com', -- 이메일 생성
  '010-1234-5678', -- 랜덤한 전화번호 생성
  CASE WHEN MOD(ROWNUM, 3) = 0 THEN '액션' WHEN MOD(ROWNUM, 3) = 1 THEN '코미디' ELSE '로맨스' END, -- 랜덤한 선호장르 생성
  'Nickname' || LPAD(ROWNUM, 3, '0'), -- 닉네임을 'Nickname001', 'Nickname002', ... 형식으로 생성
  CASE WHEN MOD(ROWNUM, 2) = 0 THEN 'Y' ELSE 'N' END, -- 랜덤한 회원상태 생성
  SYSDATE - DBMS_RANDOM.VALUE(1, 365), -- 랜덤한 회원정보수정일 생성
  MOD(ROWNUM, 5) + 1, -- 회원등급을 1, 2, 3 중에서 랜덤하게 생성
  '#FFFFFF', -- 기본 회원정보색깔
  NULL, -- 기본 회원정보 이미지 경로
  NULL, -- NULL 값으로 MEM_FILE 생성
  MOD(ROWNUM, 5) + 1,
  CASE WHEN MOD(ROWNUM, 2) = 0 THEN 'Y' ELSE 'N' END
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
  LEVEL <= 900;
  
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
INSERT INTO NOTICE (NOTICE_NO, NOTICE_CATEGORY, NOTICE_TITLE, NOTICE_CONTENT, NOTICE_DATE, NOTICE_READ_COUNT, ADMIN_NO, NOTICE_STATUS, NOTICE_FIX)
SELECT 
  SEQ_NOTICE_NO.NEXTVAL,
  CASE WHEN ROWNUM <= 15 THEN '1' ELSE '2' END, -- 일반(1) 또는 이벤트(2) 카테고리를 랜덤하게 생성
  'Title' || LPAD(ROWNUM, 2, '0'), -- 공지사항 제목을 'Title01', 'Title02', ... 형식으로 생성
  'Content' || LPAD(ROWNUM, 2, '0'), -- 공지사항 내용을 'Content01', 'Content02', ... 형식으로 생성
  SYSDATE - DBMS_RANDOM.VALUE(1, 365), -- 랜덤한 작성일 생성
  0, -- 초기 조회수를 0으로 설정
  MOD(ROWNUM, 5) + 1, -- 1부터 5까지의 숫자를 순환하여 ADMIN_NO 생성
  'Y', -- 공지사항 상태를 기본값 'Y'로 설정
  'N' -- 공지사항 상단고정여부를 기본값 'N'로 설정
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
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '파묘', '2024-02-22', 1, '134분', '미국 LA, 거액의 의뢰를 받은 무당 ‘화림’(김고은)과 ‘봉길’(이도현)은 기이한 병이 대물림되는 집안의 장손을 만난다. 조상의 묫자리가 화근임을 알아챈 ‘화림’은 이장을 권하고, 돈 냄새를 맡은 최고의 풍수사 ‘상덕’(최민식)과 장의사 ‘영근’(유해진)이 합류한다. “전부 잘 알 거야… 묘 하나 잘못 건들면 어떻게 되는지” 절대 사람이 묻힐 수 없는 악지에 자리한 기이한 묘. ‘상덕’은 불길한 기운을 느끼고 제안을 거절하지만, ‘화림’의 설득으로 결국 파묘가 시작되고… 나와서는 안될 것이 나왔다.', DEFAULT, '15세 이상', 'Y', DEFAULT, 'resources/upfiles/20240318103838_91929.png', 'resources/upfiles/20240318104140_63098.mp4', DEFAULT, DEFAULT);

INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '스즈메의 문단속', '2024-01-10', 2, '122분', '한 소녀가 우연히 만난 청년과 재난의 문을 닫는 모험에 뛰어들게 되는 이야기를 다룬 애니메이션 영화', DEFAULT, '12세 이상', 'N', DEFAULT, 'resources/upfiles/20240318104334_13872.png', 'resources/upfiles/20240318104441_38300.mp4', DEFAULT, DEFAULT);

INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '대외비', '2023-03-01', 1, '116분', '1992년 부산, 만년 국회의원 후보 해웅과 정치판의 숨은 실세 순태, 행동파 조폭 필도가 대한민국을 뒤흔들 비밀 문서를 손에 쥐고 판을 뒤집기 위한 치열한 쟁탈전을 벌이는 범죄드라마', DEFAULT, '15세 이상', 'N', DEFAULT, 'resources/upfiles/20240318104522_63626.png', 'resources/upfiles/20240318104633_46273.mp4', DEFAULT, DEFAULT);

INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '서울의 봄', '2023-11-22', 1, '141분', '1979년 12월 12일, 수도 서울 군사반란 발생 그날, 대한민국의 운명이 바뀌었다 대한민국을 뒤흔든 10월 26일 이후, 서울에 새로운 바람이 불어온 것도 잠시 12월 12일, 보안사령관 전두광이 반란을 일으키고 군 내 사조직을 총동원하여 최전선의 전방부대까지 서울로 불러들인다. 권력에 눈이 먼 전두광의 반란군과 이에 맞선 수도경비사령관 이태신을 비롯한 진압군 사이, 일촉즉발의 9시간이 흘러가는데… 목숨을 건 두 세력의 팽팽한 대립 오늘 밤, 대한민국 수도에서 가장 치열한 전쟁이 펼쳐진다!', DEFAULT, '12세 이상', 'N', DEFAULT, 'resources/upfiles/20240318104722_50221.png', 'resources/upfiles/20240318104745_76619.mp4', DEFAULT, DEFAULT);

INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '범죄도시3', '2023-05-31', 1, '105분', '대체불가 괴물형사 마석도, 서울 광수대로 발탁! 베트남 납치 살해범 검거 후 7년 뒤, ‘마석도’(마동석)는 새로운 팀원들과 함께 살인사건을 조사한다. 사건 조사 중, ‘마석도’는 신종 마약 사건이 연루되었음을 알게 되고 수사를 확대한다. 한편, 마약 사건의 배후인 주성철(이준혁)은 계속해서 판을 키워가고 약을 유통하던 일본 조직과 리키(아오키 무네타카)까지 한국에 들어오며 사건의 규모는 점점 더 커져가는데... 나쁜 놈들 잡는 데 이유 없고 제한 없다. 커진 판도 시원하게 싹 쓸어버린다!', DEFAULT, '15세 이상', 'N', DEFAULT, 'resources/upfiles/20240318104801_78030.png', 'resources/upfiles/20240318104819_65085.mp4', DEFAULT, DEFAULT);
--------------------------------------------------------------------------------------------------------------------------------

-------------------------수민  ----------------
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
                , 'resources/upfiles/20240318103401_75346.png'
                , 'resources/upfiles/20240318103404_75346.mp4'
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
                , 'resources/upfiles/20240218103401_75346.png'
                , 'resources/upfiles/20240218103403_75346.mp4'
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
                , 'resources/upfiles/20240118103401_75346.png'
                , 'resources/upfiles/20240118103402_75346.mp4'
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
                , 'resources/upfiles/20240128103401_75346.png'
                , 'resources/upfiles/20240128103401_75348.mp4'
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
                , 'resources/upfiles/20240308103401_75346.png'
                , 'resources/upfiles/20240308103401_75356.mp4'
                , DEFAULT
                , DEFAULT);
            





------------------------------------------------------------------------ 정은정 ------------------------------------------------------------------------ 
INSERT INTO MOVIE (MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) 
VALUES (SEQ_MOVIE_NO.NEXTVAL, '스파이더맨: 노 웨이 홈', '2021-12-15', '2', '148분'
      , '‘미스테리오’의 계략으로 세상에 정체가 탄로난 스파이더맨 ‘피터 파커’는 하루 아침에 평범한 일상을 잃게 된다. 문제를 해결하기 위해 ‘닥터 스트레인지’를 찾아가 도움을 청하지만 뜻하지 않게 멀티버스가 열리면서 각기 다른 차원의 불청객들이 나타난다. ‘닥터 옥토퍼스’를 비롯해 스파이더맨에게 깊은 원한을 가진 숙적들의 강력한 공격에 ‘피터 파커’는 사상 최악의 위기를 맞게 되는데…'
      , 'N', '12세 이상', 'N', DEFAULT, 'resources/upfiles/20211215110327_51215.jpeg', 'resources/upfiles/20211215111035_23204.mp4', 'Y', SYSDATE);


INSERT INTO MOVIE (MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) 
VALUES (SEQ_MOVIE_NO.NEXTVAL, '모가디슈', '2021-07-28', '1', '121분'
      , '내전으로 고립된 낯선 도시, 모가디슈 지금부터 우리의 목표는 오로지 생존이다! 대한민국이 UN가입을 위해 동분서주하던 시기 1991년 소말리아의 수도 모가디슈에서는 일촉즉발의 내전이 일어난다. 통신마저 끊긴 그 곳에 고립된 대한민국 대사관의 직원과 가족들은 총알과 포탄이 빗발치는 가운데, 살아남기 위해 하루하루를 버텨낸다. 그러던 어느 날 밤, 북한 대사관의 일행들이 도움을 요청하며 문을 두드리는데… 목표는 하나, 모가디슈에서 탈출해야 한다!'
      , 'N', '15세 이상', 'N', DEFAULT, 'resources/upfiles/202107281652_96426.jpeg', 'resources/upfiles/20210728172012_93546.mp4', 'Y', SYSDATE);


INSERT INTO MOVIE (MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) 
VALUES (SEQ_MOVIE_NO.NEXTVAL, '블랙위도우', '2021-07-07', '2', '134분'
      , '어벤져스의 히어로 블랙 위도우, ‘나타샤 로마노프’ (스칼렛 요한슨)는 자신의 과거와 연결된 레드룸의 거대한 음모와 실체를 깨닫게 된다. 상대의 능력을 복제하는 빌런 ‘태스크마스터’와 새로운 위도우들의 위협에 맞서 목숨을 건 반격을 시작하는 ‘나타샤’는 스파이로 활약했던 자신의 과거 뿐 아니라, 어벤져스가 되기 전 함께했던 동료들을 마주해야만 하는데… 폭발하는 리얼 액션 카타르시스! MCU의 새로운 시대를 시작할 첫 액션 블록버스터를 만끽하라!'
      , 'N', '12세 이상', 'N', DEFAULT, 'resources/upfiles/202107071324_12379.jpeg', 'resources/upfiles/20210707133011_23125.mp4', 'Y', SYSDATE);


INSERT INTO MOVIE (MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) 
VALUES (SEQ_MOVIE_NO.NEXTVAL, '분노의 질주: 더 얼티메이트', '2021-05-19', '2', '142분'
      , '도미닉(빈 디젤)은 자신과 가장 가까웠던 형제 제이콥(존 시나)이 사이퍼(샤를리즈 테론)와 연합해 전 세계를 위기로 빠트릴 위험천만한 계획을 세운다는 사실을 알게 되고, 이를 막기 위해 다시 한 번 패밀리들을 소환한다. 가장 가까운 자가 한순간, 가장 위험한 적이 된 상황 도미닉과 패밀리들은 이에 반격할 놀라운 컴백과 작전을 세우고 지상도, 상공도, 국경도 경계가 없는 불가능한 대결이 시작되는데…'
      , 'N', '12세 이상', 'N', DEFAULT, 'resources/upfiles/202105191408_42420.jpeg', 'resources/upfiles/20210519144822_54523.mp4', 'Y', SYSDATE);


INSERT INTO MOVIE (MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) 
VALUES (SEQ_MOVIE_NO.NEXTVAL, '소울', '2021-01-20', '2', '107분'
      , '뉴욕에서 음악 선생님으로 일하던 ‘조’는 꿈에 그리던 최고의 밴드와 재즈 클럽에서 연주하게 된 그 날, 예기치 못한 사고로 영혼이 되어 ‘태어나기 전 세상’에 떨어진다. 탄생 전 영혼들이 멘토와 함께 자신의 관심사를 발견하면 지구 통행증을 발급하는 ‘태어나기 전 세상’ ‘조’는 그 곳에서 유일하게 지구에 가고 싶어하지 않는 시니컬한 영혼 ‘22’의 멘토가 된다. 링컨, 간디, 테레사 수녀도 멘토되길 포기한 영혼 ‘22’ 꿈의 무대에 서려면 ‘22’의 지구 통행증이 필요한 ‘조’ 그는 다시 지구로 돌아가 꿈의 무대에 설 수 있을까?'
      , 'N', '전체관람가', 'N', DEFAULT, 'resources/upfiles/202101201630_52311.jpeg', 'resources/upfiles/20210120163534_65912.mp4', 'Y', SYSDATE);

--------------------------------------------------------------------------------------------------------------------------------------------------------------- 


-------------------------------------- 이용훈 --------------------------------

INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '닥터 두리틀', '2020-01-08', '2', '101분', '동물들과 소통하는 특별한 능력을 지닌 닥터 두리틀(로버트 다우니 주니어)은 사랑하는 사람을 잃고 세상과 단절한 채 동물들과 친구가 되어 살아간다.', 'N', '전체관람가', 'N', 'N', 'resources/upfiles/20240314153026_17162.jpeg', 'resources/upfiles/20240314153026_55362.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '나쁜 녀석들 : 포에버', '2020-01-15', '2', '124분', '마이애미 강력반의 베테랑 형사 ‘마이크’[윌 스미스]는 여전히 범죄자를 소탕하는 데 열성적이지만, 그의 파트너 ‘마커스’[마틴 로렌스]는 이제 일선에서 물러나 가족과 함께 시간을 보내고 싶어한다.', 'N', '청소년 관람불가', 'N', 'N', 'resources/upfiles/20240314143028_55362.jpeg', 'resources/upfiles/20240314143038_56342.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '스파이 지니어스', '2020-01-22', '2', '102분', '전 세계를 위협하는 불법 무기 거래 첩보를 입수한 스파이 에이전트는 천상천하 유아독존 슈퍼 스파이 ‘랜스’(윌 스미스)를 파견한다. 하지만, 최첨단 장비로 무장한 정체불명의 빌런 ‘킬리언’(벤 맨델슨)은 ‘랜스’로 위장해 무기를 훔치고 그를 함정에 빠트린다.', 'N', '전체관람가', 'N', 'N', 'resources/upfiles/20240315113026_57552.jpeg', 'resources/upfiles/20240315136027_55552.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '작은 아씨들', '2020-02-12', '2', '135분', '배우가 되고 싶은 첫째 메그(엠마 왓슨) 작가가 되고 싶은 둘째 조(시얼샤 로넌) 음악가가 되고 싶은 셋째 베스(엘리자 스캔런) 화가가 되고 싶은 막내 에이미(플로렌스 퓨) 이웃집 소년 로리(티모시 샬라메)는 네 자매를 우연히 알게되고 각기 다른 개성의 네 자매들과 인연을 쌓아간다.', 'N', '전체관람가', 'N', 'N', 'resources/upfiles/20240315115026_51552.jpeg', 'resources/upfiles/20240315135027_55852.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '1917', '2020-02-19', '2', '119분', '제1차 세계대전이 한창인 1917년. 독일군에 의해 모든 통신망이 파괴된 상황 속에서 영국군 병사 ‘스코필드’(조지 맥케이)와 ‘블레이크’(딘-찰스 채프먼)에게 하나의 미션이 주어졌다.', 'N', '15세 관람가', 'N', 'N', 'resources/upfiles/20240316115026_55751.jpeg', 'resources/upfiles/20240316135027_55722.mp4', 'Y', SYSDATE);
      

------------------------ 김호용 ------------------------ 
INSERT INTO MOVIE (MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, VIEW_RATING, MV_POSTER, MV_PREVIEW) 
VALUES (SEQ_MOVIE_NO.NEXTVAL, '기생충', '2019-05-30', '1', '131분', '전원 백수로 살고 있지만 사이좋은 기택 가족. 장남 기우에게 친구 민혁이 고액 과외를 연결시켜주고 온 가족의 기대를 받으며 기우는 박 사장의 집으로 간다.', '15세 이상', 'resources/upfiles/20240318103910_27134.png', 'resources/upfiles/20240318103910_464134.mp4');

INSERT INTO MOVIE (MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, VIEW_RATING, MV_POSTER, MV_PREVIEW) 
VALUES (SEQ_MOVIE_NO.NEXTVAL, '조커', '2019-10-01', '2', '123분', '고담시의 광대 아서 플렉은 코미디언을 꿈꾸고 있다. 그는 서서히 그가 맨 정신으로는 코미디언이 될 수 없다는 사실을 깨닫기 시작한다.', '15세 이상', 'resources/upfiles/20240318104410_12834.png', 'resources/upfiles/20240318103910_25634.mp4');

INSERT INTO MOVIE (MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, VIEW_RATING, MV_POSTER, MV_PREVIEW) 
VALUES (SEQ_MOVIE_NO.NEXTVAL, '어벤져스: 엔드게임', '2019-04-24', '2', '182분', '인피니티 워 이후 절반만 살아남은 지구. 살아남은 어벤져스 멤버들은 타노스에게 반격하기 위해 계획을 세운다.', '12세 이상', 'resources/upfiles/20240318104510_34834.png', 'resources/upfiles/20240318113910_94634.mp4');

INSERT INTO MOVIE (MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, VIEW_RATING, MV_POSTER, MV_PREVIEW) 
VALUES (SEQ_MOVIE_NO.NEXTVAL, '나이브스 아웃', '2019-12-04', '2', '130분', '베스트셀러 작가 할런이 85세 생일날 숨진 채 발견된다. 그의 죽음의 원인을 밝히기 위해 경찰과 탐정 브누아 블랑은 수사에 나서고, 가족 전체가 용의선상에 오른다.', '12세 이상', 'resources/upfiles/20240318104630_44834.png', 'resources/upfiles/20240318113910_14634.mp4');

INSERT INTO MOVIE (MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, VIEW_RATING, MV_POSTER, MV_PREVIEW) 
VALUES (SEQ_MOVIE_NO.NEXTVAL, '겨울왕국 2', '2019-11-21', '2', '103분', '의문의 목소리가 엘사를 부르고, 아렌델 왕국에 위기가 찾아온다. 트롤은 엘사의 힘의 비밀과 진실을 찾아야 한다고 하고, 엘사와 안나는 여행을 떠난다.', '전체관람가', 'resources/upfiles/20240318104730_64834.png', 'resources/upfiles/20240318113110_76634.mp4');

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
    'resources/upfiles/20240314153026_57162.png',
    'resources/upfiles/20240314153026_87842.mp4',
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
    'resources/upfiles/20240314153026_57889.webp',
    'resources/upfiles/20240314103026_87842.mp4',
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
    'resources/upfiles/20240314154832_77889.webp',
    'resources/upfiles/20220314103626_81242.mp4',
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
    'resources/upfiles/20210624154832_12889.webp',
    'resources/upfiles/20210814101026_11242.mp4',
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
    'resources/upfiles/20190714154832_12481.webp',
    'resources/upfiles/20230614101626_77842.mp4',
    DEFAULT,
    DEFAULT
);

------------------------------------------------ 용훈 -------------------------------------------------
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '뮬란', '2020-09-17', '2', '115분', '무예에 남다른 재능을 지닌 ‘뮬란’은 좋은 집안과 인연을 맺어 가문을 빛내길 바라는 부모님의 뜻에 따라 본연의 모습을 억누르고 성장한다.', 'N', '12세 관람가', 'N', 'N', 'resources/upfiles/20240316125026_12751.jpeg', 'resources/upfiles/20240316125127_84722.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '원더 우먼 1984', '2020-12-23', '2', '151분', '1984년 모든 것이 활기찬 시대, 다이애나 프린스는 고고학자로서 인간들 사이에서 조용히 살고 있다.', 'N', '12세 관람가', 'N', 'N', 'resources/upfiles/20240316125152_18751.jpeg', 'resources/upfiles/20240316125150_84422.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '남산의 부장들', '2020-01-22', '1', '114분', '1979년 10월 26일, 중앙정보부장 김규평(이병헌)이 대한민국 대통령을 암살한다. 이 사건의 40일전, 미국에서는 전 중앙정보부장 박용각(곽도원)이 청문회를 통해 전 세계에 정권의 실체를 고발하며 파란을 일으킨다.', 'N', '15세 관람가', 'N', 'N', 'resources/upfiles/20240317125152_22750.jpeg', 'resources/upfiles/20240317125150_84312.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '다만 악에서 구하소서', '2020-08-05', '1', '108분', '태국에서 충격적인 납치사건이 발생하고 마지막 청부살인 미션을 끝낸 암살자 인남(황정민)은 그것이 자신과 관계된 것임을 알게 된다.', 'N', '15세 관람가', 'N', 'N', 'resources/upfiles/20240317125152_22751.jpeg', 'resources/upfiles/20240317125150_84313.mp4', 'Y', SYSDATE);




------------------------------------------------------------------------------- 은정 ---------------------------------------------------------------------------- 

INSERT INTO MOVIE (MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) 
VALUES (SEQ_MOVIE_NO.NEXTVAL, '듄', '2021-10-20', '2', '155분'
      , '10191년, 아트레이데스 가문의 후계자인 폴(티모시 샬라메)은 시공을 초월한 존재이자 전 우주를 구원할 예지된 자의 운명을 타고났다. 그리고 어떤 계시처럼 매일 꿈에서 아라키스 행성에 있는 한 여인을 만난다. 모래언덕을 뜻하는 "듄"이라 불리는 아라키스는 물 한 방울 없는 사막이지만 우주에서 가장 비싼 물질인 신성한 환각제 스파이스의 유일한 생산지로 이를 차지하기 위한 전쟁이 치열하다. 황제의 명령으로 폴과 아트레이데스 가문은 죽음이 기다리는 아라키스로 향하는데… 위대한 자는 부름에 응답한다, 두려움에 맞서라, 이것은 위대한 시작이다!'
      , 'N', '12세 이상', 'N', DEFAULT, 'resources/upfiles/202110201015_12356.jpeg', 'resources/upfiles/20211020102003_54688.mp4', 'Y', SYSDATE);
      
        
INSERT INTO MOVIE (MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) 
VALUES (SEQ_MOVIE_NO.NEXTVAL, '미나리', '2021-03-03', '2', '115분'
      , '"미나리는 어디서든 잘 자라" 낯선 미국, 아칸소로 떠나온 한국 가족. 가족들에게 뭔가 해내는 걸 보여주고 싶은 아빠 "제이콥"(스티븐 연)은 자신만의 농장을 가꾸기 시작하고 엄마 "모니카"(한예리)도 다시 일자리를 찾는다. 아직 어린 아이들을 위해 ‘모니카’의 엄마 ‘순자’(윤여정)가 함께 살기로 하고 가방 가득 고춧가루, 멸치, 한약 그리고 미나리씨를 담은 할머니가 도착한다. 의젓한 큰딸 "앤"(노엘 케이트 조)과 장난꾸러기 막내아들 "데이빗"(앨런 김)은 여느 그랜마같지 않은 할머니가 영- 못마땅한데… 함께 있다면, 새로 시작할 수 있다는 희망으로 하루하루 뿌리 내리며 살아가는 어느 가족의 아주 특별한 여정이 시작된다!'
      , 'N', '12세 이상', 'N', DEFAULT, 'resources/upfiles/202103031120_56255.jpeg', 'resources/upfiles/20210303115243_98542.mp4', 'Y', SYSDATE);


INSERT INTO MOVIE (MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) 
VALUES (SEQ_MOVIE_NO.NEXTVAL, '킹스맨: 퍼스트 에이전트', '2021-12-22', '2', '130분'
      , '역사상 최악의 폭군들과 범죄자들이 모여 수백만 명의 생명을 위협할 전쟁을 모의하는 광기의 시대. 이들을 막으려는 한 사람과 그가 비밀리에 운영 중인 독립 정보기관, ‘킹스맨’의 최초 미션이 시작된다! 베일에 감춰졌던 킹스맨의 탄생을 목격하라!'
      , 'N', '청소년 관람불가', 'N', DEFAULT, 'resources/upfiles/202112221803_64555.jpeg', 'resources/upfiles/20211222181539_32156.mp4', 'Y', SYSDATE);

--------------------------------------------------------------------------------------------------------------------------------------------------------------- 

----------------------------------------------- 용훈 -------------------------------------------------
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '듄: 파트2', '2024-02-28', '2', '166분', '황제의 모략으로 멸문한 가문의 유일한 후계자 폴.(티모시 샬라메) 어머니 레이디 제시카(레베카 퍼거슨)와 간신히 목숨만 부지한 채 사막으로 도망친다.', 'N', '12세 관람가', 'Y', 'N', 'resources/upfiles/20240320135127_75552.jpeg', 'resources/upfiles/20240320135127_38483.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '가여운 것들', '2024-03-06', '2', '141분', '천재적이지만 특이한 과학자 갓윈 백스터(윌렘 대포)에 의해 새롭게 되살아난 벨라 백스터(엠마 스톤).', 'N', '청소년 관람불가', 'Y', 'N', 'resources/upfiles/20240320135128_11483.jpeg', 'resources/upfiles/20240320135128_15883.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '시민덕희', '2024-01-24', '1', '114분', '내 돈을 사기 친 그 놈이 구조 요청을 해왔다! 세탁소 화재로 인해 대출상품을 알아보던 생활력 만렙 덕희에게 어느 날, 거래은행의 손대리가 합리적인 대출상품을 제안하겠다며 전화를 걸어온다.', 'N', '15세 관람가', 'Y', 'N', 'resources/upfiles/20240320135130_85133.jpeg', 'resources/upfiles/20240320135130_12345.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE(MV_NO, MV_NAME, MV_OPENDATE, MV_NATION, MV_RTIME, MV_STORY, FPAGE_EXPOSED, VIEW_RATING, CURRENT_SCREENING, MPAGE_EXPOSED, MV_POSTER, MV_PREVIEW, MV_STATUS, MV_DATE) VALUES(SEQ_MOVIE_NO.NEXTVAL, '귀멸의 칼날: 인연의 기적, 그리고 합동 강화 훈련으로', '2024-02-14', '2', '103분', '‘탄지로’와 상현 4 ‘한텐구’의 목숨을 건 혈투와, ‘무잔’과의 최종 국면을 앞둔 귀살대원들의 마지막 훈련을 그린 영화', 'N', '15세 관람가', 'Y', 'N', 'resources/upfiles/20240320135135_84741.jpeg', 'resources/upfiles/20240320135135_99175.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '고질라 X 콩 : 뉴 엠파이어', '2024-03-27', '2', '115분', '고질라 X 콩, 이번에는 한 팀이다! "고질라" VS "콩", 두 타이탄의 전설적인 대결 이후 할로우 어스에 남은 "콩"은 드디어 애타게 찾던 동족을 발견하지만 그 뒤에 도사리고 있는 예상치 못한 위협에 맞닥뜨린다.', 'N', '12세 관람가', 'Y', 'N', 'resources/upfiles/20240320135135_84742.jpg', 'resources/upfiles/20240320135135_84743.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '댓글부대', '2024-03-27', '1', '109분', '실력 있지만 허세 가득한 사회부 기자 ‘임상진’ 대기업 ‘만전’의 비리를 취재하지만 오보로 판명되며 정직당한다.', 'N', '15세 관람가', 'Y', 'N', 'resources/upfiles/20240320135136_84743.jpg', 'resources/upfiles/20240320135136_84744.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '남은 인생 10년', '2024-04-03', '2', '125분', '매일 밤, 눈 감기가 두려웠던 난치병 환자 ‘마츠리’ 매일 아침, 눈 뜨기가 두려웠던 외톨이 ‘카즈토’ 운명은 정반대에 있던 두 사람을 마주 보게 한다.', 'N', '12세 관람가', 'A', 'N', 'resources/upfiles/20240322135135_84751.jpeg', 'resources/upfiles/20240322135135_84752.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '비키퍼', '2024-04-03', '2', '105분', '법 위에 있는 비밀 기관 "비키퍼" 그곳의 전설로 남은 탑티어 에이전트 "애덤 클레이"는 기관의 눈을 피해 자취를 감추고 양봉가로 살아간다.', 'N', '청소년 관람불가', 'A', 'N', 'resources/upfiles/20240320135135_94742.jpg', 'resources/upfiles/20240320135135_94743.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '라스트 썸머', '2024-04-03', '2', '104분', '남편 "피에르"와 함께 입양한 두 딸을 키우며 완벽한 삶을 살고 있는 청소년 전문 변호사 "안느" 어느 날, 남편이 전처와 낳은 아들 ‘테오’가 학교에서 사고를 치며 ‘안느’와 ‘테오’는 한집에 살게 된다.', 'N', '청소년 관람불가', 'A', 'N', 'resources/upfiles/20240320135135_94744.jpg', 'resources/upfiles/20240320135135_94745.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '오멘: 저주의 시작', '2024-04-03', '2', '119분', '수녀가 되기 위해 로마에 가게 된 ‘마거릿’(넬 타이거 프리). 그곳에서 새로운 삶을 시작하려는 그때, 믿음을 뒤흔드는 어둠의 그림자를 마주한다.', 'N', '15세 관람가', 'A', 'N', 'resources/upfiles/20240320135136_04744.jpg', 'resources/upfiles/20240320135136_04745.mp4', 'Y', SYSDATE);

INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '메이 디셈버', '2024-03-13', '2', '117분', '“왜 날 연기하고 싶어요?” “전 이해하기 어려운 캐릭터가 좋아요” 신문 1면을 장식하며 미국을 떠들썩하게 만든 충격적인 로맨스의 주인공들인 ‘그레이시’(줄리안 무어)와 그보다 23살 어린 남편 ‘조’(찰스 멜튼). 20여 년이 흐른 어느 날, 영화에서 그레이시를 연기하게 된 인기 배우 ‘엘리자베스’(나탈리 포트만)가 캐릭터 연구를 위해 그들의 집에 머물게 된다.', 'N', '청소년 관람불가', 'Y', 'N', 'resources/upfiles/20240320135136_05744.jpg', 'resources/upfiles/20240320135136_05745.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '화녀', '2024-03-14', '1', '102분', '연기대상까지 받으며 잘 나가던 여배우 ‘수연’(박지연)은 어느 날, 음주 사고를 일으켜 긴 자숙의 시간을 갖는다 자숙 이후 에세이를 발간하며 다시 한번 복귀를 시도하지만, 세상은 그녀를 차갑게 대하고...', 'N', '청소년 관람불가', 'Y', 'N', 'resources/upfiles/20240320135136_05746.jpg', 'resources/upfiles/20240320135136_05747.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '우견니', '2024-02-14', '2', '110분', '“내 청춘은 모두 너와 연결되어 있어” 친구들에게 놀림당하지만 늘 햇살처럼 밝은 ‘자오양’. 무뚝뚝한 엘리트 전학생 ‘저우찬’. 극과 극인 두 사람은 함께 꿈을 키워 나가며 점차 가까워지고, 단 한 번뿐인 서로의 청춘에 밝은 빛이 되어준다.', 'N', '12세 관람가', 'Y', 'N', 'resources/upfiles/20240320135136_05748.jpg', 'resources/upfiles/20240320135136_05749.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '소녀는 졸업하지 않는다', '2024-01-24', '2', '120분', '폐교를 앞둔 고등학교. 마지막 졸업식까지 D-2 4명의 소녀 어쩔 수 없는 이별 앞에 소녀들이 간직한 애틋하고 비밀스러운 마음은…?.', 'N', '12세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05750.jpg', 'resources/upfiles/20240320135136_05751.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '노량: 죽음의 바다', '2023-12-20', '1', '153분', '임진왜란 발발로부터 7년이 지난 1598년 12월. 이순신(김윤석)은 왜군의 수장이던 도요토미 히데요시가 갑작스럽게 사망한 뒤 왜군들이 조선에서 황급히 퇴각하려 한다는 것을 알게 된다.', 'N', '12세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05752.jpg', 'resources/upfiles/20240320135136_05753.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '아쿠아맨과 로스트 킹덤', '2023-12-20', '2', '124분', '아틀란티스 왕국을 이끌 왕의 자리에 오른 ‘아쿠아맨’. 그 앞에 ‘블랙 만타’가 세상을 뒤흔들 강력한 지배 아이템 ‘블랙 트라이던트’를 손에 넣게 된다.', 'N', '12세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05754.jpg', 'resources/upfiles/20240320135136_05755.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '나폴레옹', '2023-12-06', '2', '158분', '스스로 황제가 된 영웅! 1793년 혁명의 불꽃이 프랑스 전역을 밝히기 시작한다. 코르시카 출신의 장교 "나폴레옹"(호아킨 피닉스)은 혼란스러운 상황 속 국가를 위해 맞서며 영웅으로 떠오른다.', 'N', '15세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05756.jpg', 'resources/upfiles/20240320135136_05757.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '바비', '2023-07-19', '2', '114분', '원하는 무엇이든 될 수 있는 "바비랜드"에서 살아가던 "바비"가 현실 세계와 이어진 포털의 균열을 발견하게 되고, 이를 해결하기 위해 "켄"과 예기치 못한 여정을 떠나면서 펼쳐지는 이야기.', 'N', '12세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05758.jpg', 'resources/upfiles/20240320135136_05759.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '더 마블스', '2023-11-08', '2', '105분', '강력한 힘으로 은하계를 수호하는 최강 히어로 캡틴 마블 ‘캐럴 댄버스’ 캡틴 마블의 오랜 친구의 딸이자, 빛의 파장을 조작하는 히어로 ‘모니카 램보’ 최애 히어로 캡틴 마블의 열렬한 팬인 미즈 마블 ‘카말라 칸’ 캡틴 마블에 대한 복수를 꿈꾸는 냉혹한 크리족 리더 ‘다르-벤’의 영향으로 세 명의 히어로는 능력을 사용할 때마다 서로의 위치가 뒤바뀌게 된다.', 'N', '12세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05760.jpg', 'resources/upfiles/20240320135136_05761.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '헝거게임: 노래하는 새와 뱀의 발라드', '2023-11-15', '2', '157분', '반란의 불씨를 잠재우기 위해 시작된 잔인한 서바이벌 헝거게임. 헝거게임 10회를 맞아 ‘멘토제’가 도입되고 ‘스노우’는 12구역의 소녀 ‘루시 그레이’의 멘토가 된다. 그는 몰락한 가문의 영광을 되찾기 위해 ‘루시 그레이’를 헝거게임에서 우승 시키려 수단과 방법을 가리지 않는데...', 'N', '15세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05762.jpg', 'resources/upfiles/20240320135136_05763.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '사채소년', '2023-11-22', '1', '105분', '학교 서열 최하위, 고교사채왕이 되다! 존재감도, 빽도, 돈도 없는 서열 최하위 "강진". 일진들의 괴롭힘에 시달리며 최악의 학교 생활을 이어가던 중 우연한 기회로 사채업자 "랑"에게 동업을 제안받게 된다.', 'N', '15세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05764.jpg', 'resources/upfiles/20240320135136_05765.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '30일', '2023-10-03', '1', '119분', '“완벽한 저에게 신은 저 여자를 던지셨죠” 지성과 외모 그리고 찌질함까지 타고난, "정열"(강하늘). “모기 같은 존재죠. 존재의 이유를 모르겠는?” 능력과 커리어 그리고 똘기까지 타고난, "나라"(정소민).', 'N', '12세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05766.jpg', 'resources/upfiles/20240320135136_05767.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '용감한 시민', '2023-10-25', '1', '112분', '불의는 못 본 척, 성질은 없는 척, 주먹은 약한 척 먹고 살기 위해 조용히 살아 온 기간제 교사 "소시민". 법도 경찰도 무서울 것 하나 없는 안하무인 절대권력 "한수강"의 선을 넘는 행동을 목격하게 된다.', 'N', '15세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05768.jpg', 'resources/upfiles/20240320135136_05769.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '화사한 그녀', '2023-10-11', '1', '121분', '인생 역전 한방을 꿈꾸는 화사한 작전꾼 ‘지혜’ 매번 허당한 실력으로 허탕만 치던 그녀에게 600억이라는 일생일대의 기회가 찾아왔다! 실패는 사치다!라는 모토 아래 영혼까지 끌어 모은 마지막 작전을 시작하는데...', 'N', '12세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05770.jpg', 'resources/upfiles/20240320135136_05771.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '드림쏭2', '2023-10-03', '2', '90분', '더 큰 무대로 돌아왔다! 이번엔 월드 투어다! 드림쏭 이후 1년, ‘버디’와 그의 밴드 ‘트루 블루’는 팬들의 열렬한 사랑을 받으며 눈의 마을의 인기 스타가 된다.', 'N', '전체관람가', 'N', 'N', 'resources/upfiles/20240320135136_05772.jpg', 'resources/upfiles/20240320135136_05773.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '천박사 퇴마 연구소: 설경의 비밀', '2023-09-27', '1', '98분', '대대로 마을을 지켜 온 당주집 장손이지만 정작 귀신은 믿지 않는 가짜 퇴마사 ‘천박사’(강동원). 사람의 마음을 꿰뚫는 통찰력으로 가짜 퇴마를 하며, 의뢰받은 사건들을 해결해 오던 그에게 귀신을 보는 의뢰인 ‘유경’(이솜)이 찾아와 거액의 수임료로 거절하기 힘든 제안을 한다.', 'N', '12세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05774.jpg', 'resources/upfiles/20240320135136_05775.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '거미집', '2023-09-27', '1', '132분', '“결말만 바꾸면 걸작이 된다, 딱 이틀이면 돼!” 1970년대 꿈도 예술도 검열당하던 시대 성공적이었던 데뷔작 이후, 악평과 조롱에 시달리던 김감독(송강호)은 촬영이 끝난 영화 ‘거미집’의 새로운 결말에 대한 영감을 주는 꿈을 며칠째 꾸고 있다.', 'N', '15세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05776.jpg', 'resources/upfiles/20240320135136_05777.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '1947 보스톤', '2023-09-27', '1', '108분', '“나라가 독립을 했으면 당연히 우리 기록도 독립이 되어야지!” 1936년 베를린 올림픽, 세계 신기록을 세운 마라톤 금메달리스트 ‘손기정’. 기미가요가 울려 퍼지는 시상대에서 화분으로 가슴에 단 일장기를 가렸던 그는 하루아침에 민족의 영웅으로 떠올랐지만 일제의 탄압으로 더 이상 달릴 수 없게 된다.', 'N', '12세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05778.jpg', 'resources/upfiles/20240320135136_05779.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '오펜하이머', '2023-08-15', '2', '180분', '“나는 이제 죽음이요, 세상의 파괴자가 되었다.” 세상을 구하기 위해 세상을 파괴할 지도 모르는 선택을 해야 하는 천재 과학자의 핵개발 프로젝트.', 'N', '15세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05780.jpg', 'resources/upfiles/20240320135136_05781.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '비공식작전', '2023-08-02', '1', '132분', '비공식적으로? 알아서 해라? 여기는 하루하루가 지뢰밭이에요” 1987년, 5년째 중동과를 벗어나지 못하고 있는 외교관 ‘민준’(하정우). 어느 날 수화기 너머로 20개월 전 레바논에서 실종된 외교관의 암호 메시지가 들려온다.', 'N', '12세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05782.jpg', 'resources/upfiles/20240320135136_05783.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '달짝지근해: 7510', '2023-08-15', '1', '119분', '타고난 미각 100%, 현실 감각은 0% 제과 연구원 ‘치호’(유해진). 과자밖에 모르는 ‘치호’ 앞에 직진밖에 모르는 세상 긍정 마인드 ‘일영’(김희선)이 나타나고, ‘치호’는 인생의 새로운 맛을 알아가기 시작한다.', 'N', '12세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05784.jpg', 'resources/upfiles/20240320135136_05785.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '타겟', '2023-08-30', '1', '101분', '중고거래로 범죄의 표적이 된 ‘수현’의 일상 속에서 벌어지는 서스펜스를 담은 스릴러.', 'N', '15세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05786.jpg', 'resources/upfiles/20240320135136_05785.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '메가로돈 2', '2023-08-15', '2', '116분', '더 거대해진 메가로돈 VS 더 강력해진 제이슨 스타뎀 지구 역사상 가장 거대한 최상위 포식자 ‘메가로돈’과 목숨 건 사투 끝에 살아남은 다이버 ‘조나스’는 해양 연구소의 팀원들과 함께 심해 탐사에 나서던 중 예기치 못한 사고로 해저 7,620m에 고립되고 만다.', 'N', '12세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05788.jpg', 'resources/upfiles/20240320135136_05789.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '엘리멘탈', '2023-06-14', '2', '109분', '불, 물, 공기, 흙 4개의 원소들이 살고 있는 ‘엘리멘트 시티’ 재치 있고 불처럼 열정 넘치는 "앰버"는 어느 날 우연히 유쾌하고 감성적이며 물 흐르듯 사는 "웨이드"를 만나 특별한 우정을 쌓으며, 지금껏 믿어온 모든 것들이 흔들리는 새로운 경험을 하게 되는데...', 'N', '전체관람가', 'N', 'N', 'resources/upfiles/20240320135136_05790.jpg', 'resources/upfiles/20240320135136_05791.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '플래시', '2023-06-14', '2', '144분', '시공간이 붕괴된 세계, 차원이 다른 히어로가 온다! 빛보다 빠른 스피드, 물체 투과, 전기 방출, 자체 회복, 천재적인 두뇌까지 갓벽한 능력을 자랑하지만 존재감은 제로, 저스티스 리그에서 궂은일을 도맡아 하는 히어로 ‘플래시’.', 'N', '12세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05792.jpg', 'resources/upfiles/20240320135136_05793.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '가디언즈 오브 갤럭시: Volume 3', '2023-05-03', '2', '150분', '‘가모라’를 잃고 슬픔에 빠져 있던 ‘피터 퀼’이 위기에 처한 은하계와 동료를 지키기 위해 다시 한번 가디언즈 팀과 힘을 모으고, 성공하지 못할 경우 그들의 마지막이 될지도 모르는 미션에 나서는 이야기.', 'N', '12세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05794.jpg', 'resources/upfiles/20240320135136_05795.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '인어공주', '2023-05-24', '2', '135분', '아틀란티카 바다의 왕 ‘트라이튼’의 사랑스러운 막내딸인 인어 ‘에리얼’은 늘 인간들이 사는 바다 너머 세상으로의 모험을 꿈꾼다.', 'N', '전체관람가', 'N', 'N', 'resources/upfiles/20240320135136_05796.jpg', 'resources/upfiles/20240320135136_05797.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '존 윅 4', '2023-04-12', '2', '169분', '죽을 위기에서 살아난 ‘존 윅’은 ‘최고 회의’를 쓰러트릴 방법을 찾아낸다. 비로소 완전한 자유의 희망을 보지만, NEW 빌런 ‘그라몽 후작’과 전 세계의 최강 연합은 ‘존 윅’의 오랜 친구까지 적으로 만들어 버리고, 새로운 위기에 놓인 ‘존 윅’은 최후의 반격을 준비하는데...', 'N', '청소년 관람불가', 'N', 'N', 'resources/upfiles/20240320135136_05798.jpg', 'resources/upfiles/20240320135136_05799.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '더 퍼스트 슬램덩크', '2023-01-04', '2', '124분', '전국 제패를 꿈꾸는 북산고 농구부 5인방의 꿈과 열정, 멈추지 않는 도전을 그린 영화.', 'N', '12세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05800.jpg', 'resources/upfiles/20240320135136_05801.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '메간', '2023-01-25', '2', '102분', '교통사고로 부모를 잃고 혼자가 된 소녀 ‘케이디’. 로봇 엔지니어이자, ‘케이디’의 보호자가 된 ‘젬마’는 ‘케이디’를 안전하게 지켜야 하는 프로그램이 입력된 AI 로봇 ‘메간’을 선물한다.', 'N', '15세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05802.jpg', 'resources/upfiles/20240320135136_05803.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '아바타: 물의 길', '2022-12-14', '2', '192분', '<아바타: 물의 길>은 판도라 행성에서 "제이크 설리"와 "네이티리"가 이룬 가족이 겪게 되는 무자비한 위협과 살아남기 위해 떠나야 하는 긴 여정과 전투, 그리고 견뎌내야 할 상처에 대한 이야기를 그렸다.', 'N', '12세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05804.jpg', 'resources/upfiles/20240320135136_05805.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '영웅', '2022-12-21', '1', '120분', '어머니 ‘조마리아’(나문희)와 가족들을 남겨둔 채 고향을 떠나온 대한제국 의병대장 ‘안중근’(정성화). 동지들과 함께 네 번째 손가락을 자르는 단지동맹으로 조국 독립의 결의를 다진 안중근은 조선 침략의 원흉인 ‘이토 히로부미’를 3년 내에 처단하지 못하면 자결하기로 피로 맹세한다.', 'N', '12세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05806.jpg', 'resources/upfiles/20240320135136_05807.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '오펀: 천사의 탄생', '2022-10-12', '2', '98분', '엄청난 비밀을 숨긴 사이코패스가 에스토니아의 정신병동을 탈출, 부유한 가족의 실종된 딸 ‘에스더’로 사칭해 미국에 온다.', 'N', '15세 관람가', 'N', 'N', 'resources/upfiles/20240320135136_05808.jpg', 'resources/upfiles/20240320135136_05809.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '알라딘', '2019-05-23', '2', '128분', '머나먼 사막 속 신비의 아그라바 왕국의 시대. 좀도둑 ‘알라딘’은 마법사 ‘자파’의 의뢰로 마법 램프를 찾아 나섰다가 주인에게 세 가지 소원을 들어주는 지니를 만나게 되고, 자스민 공주의 마음을 얻으려다 생각도 못했던 모험에 휘말리게 되는데...', 'N', '전체관람가', 'N', 'N', 'resources/upfiles/20240320135136_05810.jpg', 'resources/upfiles/20240320135136_05811.mp4', 'Y', SYSDATE);
INSERT INTO MOVIE VALUES(SEQ_MOVIE_NO.NEXTVAL, '미니언즈2', '2022-07-20', '2', '87분', '세계 최고의 슈퍼 악당을 꿈꾸는 미니보스 ‘그루’와 그를 따라다니는 미니언들. 어느 날 그루는 최고의 악당 조직 ‘빌런6’의 마법 스톤을 훔치는데 성공하지만 뉴페이스 미니언 ‘오토’의 실수로 스톤을 잃어버리고 빌런6에게 납치까지 당한다.', 'N', '전체관람가', 'N', 'N', 'resources/upfiles/20240320135136_05812.jpg', 'resources/upfiles/20240320135136_05813.mp4', 'Y', SYSDATE);



--------파일 추가--------
-------------------------------------------------- 김지우 ---------------------------------------------------
INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '파묘.png', '20240318103838_91929.png', SYSDATE, 1, 'resources/upfiles/', 1, DEFAULT, 1, 1);
INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '파묘 예고편.mp4', '20240318104140_63098.mp4', SYSDATE, 2, 'resources/upfiles/', 1, DEFAULT, 2, 1);

INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '스즈메의문단속.png', '20240318104334_13872.png', SYSDATE, 1, 'resources/upfiles/', 1, DEFAULT, 1, 2);
INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '스즈메의 문단속 예고편.mp4', '20240318104441_38300.mp4', SYSDATE, 2, 'resources/upfiles/', 1, DEFAULT, 2, 2);

INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '대외비.png', '20240318104522_63626.png', SYSDATE, 1, 'resources/upfiles/', 1, DEFAULT, 1, 3);
INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '대외비 예고편.mp4', '20240318104633_46273.mp4', SYSDATE, 2, 'resources/upfiles/', 1, DEFAULT, 2, 3);

INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '서울의봄.png', '20240318104722_50221.png', SYSDATE, 1, 'resources/upfiles/', 1, DEFAULT, 1, 4);
INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '서울의봄 예고편.mp4', '20240318104745_76619.mp4', SYSDATE, 2, 'resources/upfiles/', 1, DEFAULT, 2, 4);

INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '범죄도시3.png', '20240318104801_78030.png', SYSDATE, 1, 'resources/upfiles/', 1, DEFAULT, 1, 5);
INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '범죄도시3 예고편.mp4', '20240318104819_65085.mp4', SYSDATE, 2, 'resources/upfiles/', 1, DEFAULT, 2, 5);
-------수민--------
-----MOVIE_FILE_MP4
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
                    , '한산_13.png'
                    , '20240218103401_75346.png'
                    , DEFAULT
                    , 1
                    , 'resources/upfiles/'
                    , 1
                    , DEFAULT
                    , 1
                    , 7);
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
                    , '공조2_15.png'
                    , '20240118103401_75346.png'
                    , DEFAULT
                    , 1
                    , 'resources/upfiles/'
                    , 1
                    , DEFAULT
                    , 1
                    , 8);
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
                    , '헌트_17.png'
                    , '20240128103401_75346.png'
                    , DEFAULT
                    , 1
                    , 'resources/upfiles/'
                    , 1
                    , DEFAULT
                    , 1
                    , 9);
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
                    , '올빼미_19.png'
                    , '20240308103401_75346.png'
                    , DEFAULT
                    , 1
                    , 'resources/upfiles/'
                    , 1
                    , DEFAULT
                    , 1
                    , 10);
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
                    

------------------------------------- 용훈 ---------------------------------





INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '닥터 두리틀_31.jpeg',
    '20240314153026_17162.jpeg',
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
    '20240315113026_57552.jpeg',
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
    '20240315115026_51552.jpeg',
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
    '20240316115026_55751.jpeg',
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
    '20240316125026_12751.jpeg',
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
    '20240316125152_18751.jpeg',
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
    '20240317125152_22750.jpeg',
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
    '20240317125152_22751.jpeg',
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












-------------------------------------------------김호용-----------------------------------------------------------------------------
INSERT INTO ATTACHMENT (FILE_NO, ORIGIN_NAME, CHANGE_NAME, FILE_TYPE, FILE_PATH, FILE_LEVEL, REF_TYPE, REF_NO)
VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '기생충포스터.png', '20240318103910_27134.png', 1, 'resources/upfiles/', 1, '1', 21);

INSERT INTO ATTACHMENT (FILE_NO, ORIGIN_NAME, CHANGE_NAME, FILE_TYPE, FILE_PATH, FILE_LEVEL, REF_TYPE, REF_NO)
VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '기생충예고편.mp4', '20240318103910_464134.mp4', 2, 'resources/upfiles/', 1, '2', 21);

INSERT INTO ATTACHMENT (FILE_NO, ORIGIN_NAME, CHANGE_NAME, FILE_TYPE, FILE_PATH, FILE_LEVEL, REF_TYPE, REF_NO)
VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '조커포스터.png', '20240318104410_12834.png', 1, 'resources/upfiles/', 1, '1', 22);

INSERT INTO ATTACHMENT (FILE_NO, ORIGIN_NAME, CHANGE_NAME, FILE_TYPE, FILE_PATH, FILE_LEVEL, REF_TYPE, REF_NO)
VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '조커예고편.mp4', '20240318103910_25634.mp4', 2, 'resources/upfiles/', 1, '2', 22);

INSERT INTO ATTACHMENT (FILE_NO, ORIGIN_NAME, CHANGE_NAME, FILE_TYPE, FILE_PATH, FILE_LEVEL, REF_TYPE, REF_NO)
VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '어벤져스엔드게임포스터.png', '20240318104510_34834.png', 1, 'resources/upfiles/', 1, '1', 23);

INSERT INTO ATTACHMENT (FILE_NO, ORIGIN_NAME, CHANGE_NAME, FILE_TYPE, FILE_PATH, FILE_LEVEL, REF_TYPE, REF_NO)
VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '어벤져스엔드게임예고편.mp4', '20240318113910_94634.mp4', 2, 'resources/upfiles/', 1, '2', 23);

INSERT INTO ATTACHMENT (FILE_NO, ORIGIN_NAME, CHANGE_NAME, FILE_TYPE, FILE_PATH, FILE_LEVEL, REF_TYPE, REF_NO)
VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '나이브스아웃포스터.png', '20240318104630_44834.png', 1, 'resources/upfiles/', 1, '1', 24);

INSERT INTO ATTACHMENT (FILE_NO, ORIGIN_NAME, CHANGE_NAME, FILE_TYPE, FILE_PATH, FILE_LEVEL, REF_TYPE, REF_NO)
VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '나이브스아웃예고편.mp4', '20240318113910_14634.mp4', 2, 'resources/upfiles/', 1, '2', 24);

INSERT INTO ATTACHMENT (FILE_NO, ORIGIN_NAME, CHANGE_NAME, FILE_TYPE, FILE_PATH, FILE_LEVEL, REF_TYPE, REF_NO)
VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '겨울왕국2포스터.png', '20240318104730_64834.png', 1, 'resources/upfiles/', 1, '1', 25);

INSERT INTO ATTACHMENT (FILE_NO, ORIGIN_NAME, CHANGE_NAME, FILE_TYPE, FILE_PATH, FILE_LEVEL, REF_TYPE, REF_NO)
VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '겨울왕국2예고편.mp4', '20240318113110_76634.mp4', 2, 'resources/upfiles/', 1, '2', 25);

-------------------------------------------------배기웅-----------------------------------------------------------------------------
INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '신과함께인과연.png',
    '20240314153026_57162.png',
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
    '안시성.webp',
    '20240314153026_57889.webp',
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
    '레디플레이어원.webp',
    '20240314154832_77889.webp',
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
    '어벤져스인피니티워.webp',
    '20210624154832_12889.webp',
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
    '블랙팬서.webp',
    '20190714154832_12481.webp',
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



-------------------------------------------------------------- 정은정 --------------------------------------------------------------

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '스파이더맨：노 웨이 홈 포스터.jpeg',
    '20211215110327_51215.jpeg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    11
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '스파이더맨：노 웨이 홈 예고편.mp4',
    '20211215111035_23204.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    11
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '모가디슈 포스터.jpeg',
    '202107281652_96426.jpeg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    12
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '모가디슈 예고편.mp4',
    '20210728172012_93546.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    12
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '블랙 위도우 포스터.jpeg',
    '202107071324_12379.jpeg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    13
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '블랙 위도우 예고편.mp4',
    '20210707133011_23125.mp4',
    SYSDATE,
    3,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    13
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '분노의 질주：더 얼티메이트 포스터.jpeg',
    '202105191408_42420.jpeg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    14
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '분노의 질주：더 얼티메이트 예고편.mp4',
    '20210519144822_54523.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    14
);


INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '소울 포스터.jpeg',
    '202101201630_52311.jpeg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    15
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '소울 예고편.mp4',
    '20210120163534_65912.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    15
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '듄 포스터.jpeg',
    '202110201015_12356.jpeg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    35
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '듄 예고편.mp4',
    '20211020102003_54688.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    35
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '미나리 포스터.jpeg',
    '202103031120_56255.jpeg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    36
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '미나리 예고편.mp4',
    '20210303115243_98542.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    36
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '킹스맨：퍼스트 에이전트 포스터.jpeg',
    '202112221803_64555.jpeg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    37
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '킹스맨：퍼스트 에이전트 예고편.mp4',
    '20211222181539_32156.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    37
);

-------------------------------------------------------------- 정은정 --------------------------------------------------------------
----------------------------- 용훈 -------------------------------
INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '듄: 파트2.jpeg',
    '20240320135127_75552.jpeg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    38
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '듄: 파트2.mp4',
    '20240320135127_38483.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    38
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '가여운 것들.jpeg',
    '20240320135128_11483.jpeg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    39
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '가여운 것들.mp4',
    '20240320135128_15883.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    39
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '시민덕희.jpeg',
    '20240320135130_85133.jpeg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    40
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '시민덕희.mp4',
    '20240320135130_12345.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    40
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '귀멸의 칼날: 인연의 기적, 그리고 합동 강화 훈련으로.jpeg',
    '20240320135135_84741.jpeg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    41
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '귀멸의 칼날: 인연의 기적, 그리고 합동 강화 훈련으로.mp4',
    '20240320135135_99175.mp4',
    SYSDATE,
    2,
    'resources/upfiles/',
    1,
    'Y',
    '2',
    41
);


------------------영화 추가 사진 기웅-----------------

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '레디플레이어원추가사진1.jpg',
    '20180322154832_77889.jpg',
    SYSDATE,
    1,
    'resources/upfiles/',
    2,
    'Y',
    '1',
    28
);
INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '레디플레이어원추가사진2.webp',
    '20180321154832_77889.webp',
    SYSDATE,
    1,
    'resources/upfiles/',
    2,
    'Y',
    '1',
    28
);
INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '레디플레이어원추가사진3.jpg',
    '20180322154831_77889.jpg',
    SYSDATE,
    1,
    'resources/upfiles/',
    2,
    'Y',
    '1',
    28
);
INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '레디플레이어원추가사진4.webp',
    '20180322154832_77866.webp',
    SYSDATE,
    1,
    'resources/upfiles/',
    2,
    'Y',
    '1',
    28
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '레디플레이어원추가사진5.png',
    '20181222154832_77866.png',
    SYSDATE,
    1,
    'resources/upfiles/',
    2,
    'Y',
    '1',
    28
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '스티븐스필버그.webp',
    '20080321154832_77889.webp',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '8',
    1
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '마크라이런스.jpeg',
    '20090321154832_77889.jpeg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '8',
    2
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '사이먼페그.webp',
    '20090321155232_77189.webp',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '8',
    3
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '올리비아쿡.jpg',
    '20120821155232_77189.jpg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '8',
    4
);

INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '타이셰리던.webp',
    '20121111155232_77189.webp',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '8',
    5
);
---------------------------------------------------- 영화 첨부파일 [용훈] ----------------------------------------------------------
INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '고질라 X 콩 : 뉴 엠파이어.jpg',
    '20240320135135_84742.jpeg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    42
);
INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '고질라 X 콩 : 뉴 엠파이어.mp4',
    '20240320135135_84743.mp4',
    SYSDATE,
    1,
    'resources/upfiles/',
    2,
    'Y',
    '1',
    42
);
INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '댓글부대.jpg',
    '20240320135136_84743.jpeg',
    SYSDATE,
    1,
    'resources/upfiles/',
    1,
    'Y',
    '1',
    43
);
INSERT INTO ATTACHMENT 
VALUES (
    SEQ_ATTACHMENT_NO.NEXTVAL,
    '댓글부대.mp4',
    '20240320135136_84744.mp4',
    SYSDATE,
    1,
    'resources/upfiles/',
    2,
    'Y',
    '1',
    43
);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '남은 인생 10년.jpg', '20240322135135_84751.jpeg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 44);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '남은 인생 10년.mp4', '20240322135135_84752.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 44);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '비키퍼.jpg', '20240320135135_94742.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 45);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '비키퍼.mp4', '20240320135135_94743.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 45);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '라스트 썸머.jpg', '20240320135135_94744.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 46);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '라스트 썸머.mp4', '20240320135135_94745.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 46);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '오멘: 저주의 시작.jpg', '20240320135136_04744.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 47);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '오멘: 저주의 시작.mp4', '20240320135136_04745.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 47);

INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '메이 디셈버.jpg', '20240320135136_05744.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 48);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '메이 디셈버.mp4', '20240320135136_05745.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 48);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '화녀.jpg', '20240320135136_05746.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 49);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '화녀.mp4', '20240320135136_05747.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 49);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '우견니.jpg', '20240320135136_05748.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 50);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '우견니.mp4', '20240320135136_05749.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 50);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '소녀는 졸업하지 않는다.jpg', '20240320135136_05750.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 51);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '소녀는 졸업하지 않는다.mp4', '20240320135136_05751.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 51);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '노량: 죽음의 바다.jpg', '20240320135136_05752.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 52);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '노량: 죽음의 바다.mp4', '20240320135136_05753.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 52);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '아쿠아맨과 로스트 킹덤.jpg', '20240320135136_05754.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 53);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '아쿠아맨과 로스트 킹덤.mp4', '20240320135136_05755.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 53);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '나폴레옹.jpg', '20240320135136_05756.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 54);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '나폴레옹.mp4', '20240320135136_05757.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 54);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '바비.jpg', '20240320135136_05758.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 55);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '바비.mp4', '20240320135136_05759.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 55);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '더 마블스.jpg', '20240320135136_05760.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 56);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '더 마블스.mp4', '20240320135136_05761.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 56);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '헝거게임: 노래하는 새와 뱀의 발라드.jpg', '20240320135136_05762.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 57);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '헝거게임: 노래하는 새와 뱀의 발라드.mp4', '20240320135136_05763.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 57);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '사채소년.jpg', '20240320135136_05764.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 58);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '사채소년.mp4', '20240320135136_05765.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 58);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '30일.jpg', '20240320135136_05766.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 59);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '30일.mp4', '20240320135136_05767.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 59);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '용감한 시민.jpg', '20240320135136_05768.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 60);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '용감한 시민.mp4', '20240320135136_05769.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 60);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '화사한 그녀.jpg', '20240320135136_05770.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 61);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '화사한 그녀.mp4', '20240320135136_05771.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 61);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '드림쏭2.jpg', '20240320135136_05772.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 62);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '드림쏭2.mp4', '20240320135136_05773.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 62);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '천박사 퇴마 연구소: 설경의 비밀.jpg', '20240320135136_05774.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 63);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '천박사 퇴마 연구소: 설경의 비밀.mp4', '20240320135136_05775.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 63);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '거미집.jpg', '20240320135136_05776.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 64);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '거미집.mp4', '20240320135136_05777.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 64);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '1947 보스톤.jpg', '20240320135136_05778.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 65);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '1947 보스톤.mp4', '20240320135136_05779.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 65);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '오펜하이머.jpg', '20240320135136_05780.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 66);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '오펜하이머.mp4', '20240320135136_05781.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 66);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '비공식작전.jpg', '20240320135136_05782.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 67);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '비공식작전.mp4', '20240320135136_05783.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 67);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '달짝지근해: 7510.jpg', '20240320135136_05784.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 68);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '달짝지근해: 7510.mp4', '20240320135136_05785.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 68);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '타겟.jpg', '20240320135136_05786.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 69);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '타겟.mp4', '20240320135136_05787.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 69);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '메가로돈 2.jpg', '20240320135136_05788.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 70);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '메가로돈 2.mp4', '20240320135136_05789.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 70);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '엘리멘탈.jpg', '20240320135136_05790.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 71);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '엘리멘탈.mp4', '20240320135136_05791.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 71);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '플래시.jpg', '20240320135136_05792.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 72);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '플래시.mp4', '20240320135136_05793.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 72);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '가디언즈 오브 갤럭시: Volume 3.jpg', '20240320135136_05794.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 73);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '가디언즈 오브 갤럭시: Volume 3.mp4', '20240320135136_05795.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 73);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '인어공주.jpg', '20240320135136_05796.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 74);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '인어공주.mp4', '20240320135136_05797.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 74);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '존 윅 4.jpg', '20240320135136_05798.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 75);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '존 윅 4.mp4', '20240320135136_05799.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 75);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '더 퍼스트 슬램덩크.jpg', '20240320135136_05800.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 76);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '더 퍼스트 슬램덩크.mp4', '20240320135136_05801.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 76);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '메간.jpg', '20240320135136_05802.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 77);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '메간.mp4', '20240320135136_05803.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 77);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '아바타: 물의 길.jpg', '20240320135136_05804.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 78);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '아바타: 물의 길.mp4', '20240320135136_05805.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 78);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '영웅.jpg', '20240320135136_05806.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 79);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '영웅.mp4', '20240320135136_05807.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 79);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '오펀: 천사의 탄생.jpg', '20240320135136_05808.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 80);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '오펀: 천사의 탄생.mp4', '20240320135136_05809.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 80);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '알라딘.jpg', '20240320135136_05810.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 81);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '알라딘.mp4', '20240320135136_05811.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 81);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '미니언즈2.jpg', '20240320135136_05812.jpg', SYSDATE, 1, 'resources/upfiles/', 1, 'Y', '1', 82);
INSERT INTO ATTACHMENT VALUES (SEQ_ATTACHMENT_NO.NEXTVAL, '미니언즈2.mp4', '20240320135136_05813.mp4', SYSDATE, 1, 'resources/upfiles/', 2, 'Y', '1', 82);



-----------------------영화-카테고리 데이블 데이터 추가----------------------
--INSERT INTO MOVIE_CATEGORY (MV_CATEGORY_NO, MV_NO, CATEGORY_NO)
--SELECT SEQ_MOVIE_CATEGORY_NO.NEXTVAL, 
--       TRUNC(DBMS_RANDOM.VALUE(1, 37)), 
--       TRUNC(DBMS_RANDOM.VALUE(1, 15))
--FROM dual
--CONNECT BY level <= 60;
---------------------------- MEMBER 테이블 회원등급 UPDATE -----------------------------------------------------
---------- 김지우
-------------- MEM_NO가 26 ~ 28인 회원 등급 5로 변경
-------------- MEM_NO가 29 ~ 30인 회원 등급 4로 변경
UPDATE MEMBER SET MEM_LEVEL=4 WHERE MEM_NO BETWEEN 29 AND 30;
UPDATE MEMBER SET MEM_LEVEL=5 WHERE MEM_NO BETWEEN 26 AND 28;


-- REVIEW 테이블에 샘플 데이터 삽입
--INSERT INTO REVIEW (MV_REVIEW_NO, REVIEW_CONTENT, REVIEW_DATE, LIKE_POINT, MEM_NO, MV_NO)
--SELECT SEQ_REVIEW_NO.NEXTVAL,
--       dbms_random.string('L', floor(dbms_random.value(200, 401))), -- 랜덤한 길이의 문자열 생성 (200~400자)
--       SYSDATE - floor(dbms_random.value(0, 30)),                   -- 랜덤한 날짜 생성 (최근 30일 내)
--       floor(dbms_random.value(1, 11))/2,                           -- 0.5의 배수인 별점 생성 (1~5)
--       floor(dbms_random.value(1, 31)),                             -- 1~30 사이의 회원 번호
--       floor(dbms_random.value(1, 38))                              -- 1~37 사이의 영화 번호
--FROM dual
--CONNECT BY LEVEL <= 300;  -- 300개의 샘플 데이터 생성

INSERT INTO REVIEW (MV_REVIEW_NO, REVIEW_CONTENT, REVIEW_DATE, LIKE_POINT, MEM_NO, MV_NO)
SELECT SEQ_REVIEW_NO.NEXTVAL,
       dbms_random.string('L', floor(dbms_random.value(200, 401))), -- 랜덤한 길이의 문자열 생성 (200~400자)
       SYSDATE - floor(dbms_random.value(0, 30)),                   -- 랜덤한 날짜 생성 (최근 30일 내)
       floor(dbms_random.value(1, 11))/2,                           -- 0.5의 배수인 별점 생성 (1~5)
       MEM.MEM_NO,
       MOV.MV_NO
FROM (SELECT LEVEL AS MEM_NO FROM dual CONNECT BY LEVEL <= 30) MEM,
     (SELECT LEVEL AS MV_NO FROM dual CONNECT BY LEVEL <= 41) MOV
WHERE NOT EXISTS (
    SELECT 1
    FROM REVIEW
    WHERE MEM_NO = MEM.MEM_NO AND MV_NO = MOV.MV_NO
)
AND ROWNUM <= 400;  -- 400개의 샘플 데이터 생성



-- APPROVAL 테이블에 샘플 데이터 삽입
--INSERT INTO APPROVAL (APPROVAL_NO, APPROVAL_TYPE, MEM_NO, MV_REVIEW_NO)
--SELECT SEQ_APPROVAL_NO.NEXTVAL,
--       CASE WHEN MOD(ROWNUM, 2) = 0 THEN 1 ELSE 2 END,  -- 공감 또는 비공감 타입 선택
--       MEM_NO,
--       MV_REVIEW_NO
--FROM (
--    SELECT MEM_NO, MV_REVIEW_NO
--    FROM (
--        SELECT DISTINCT MEM_NO, MV_REVIEW_NO
--        FROM (
--            SELECT MEM_NO,
--                   MV_REVIEW_NO,
--                   ROW_NUMBER() OVER (PARTITION BY MEM_NO, MV_REVIEW_NO ORDER BY dbms_random.value) AS RN
--            FROM (
--                SELECT DISTINCT floor(dbms_random.value(1, 31)) AS MEM_NO,  -- 1~30 사이의 회원 번호
--                                floor(dbms_random.value(1, 401)) AS MV_REVIEW_NO  -- 1~400 사이의 리뷰 번호
--                FROM dual
--                CONNECT BY LEVEL <= 2000  -- 2500개의 샘플 데이터 생성
--            )
--        )
--        WHERE RN = 1
--    )
--)
--WHERE ROWNUM <= 2000;  -- 최종 2500개의 샘플 데이터 생성

-- 공감/비공감을 표시하는 샘플 데이터 생성
INSERT INTO APPROVAL (APPROVAL_NO, APPROVAL_TYPE, MEM_NO, MV_REVIEW_NO)
SELECT SEQ_APPROVAL_NO.NEXTVAL,
       CASE WHEN dbms_random.value(0, 1) < 0.5 THEN 1 ELSE 2 END, -- 50% 확률로 공감(1) 또는 비공감(2) 지정
       MEM_NO,
       MV_REVIEW_NO
FROM (
    SELECT MEM_NO,
           MV_NO AS MV_REVIEW_NO
    FROM (
        SELECT LEVEL AS MEM_NO
        FROM dual
        CONNECT BY LEVEL <= 30
    ) m,
    (
        SELECT LEVEL AS MV_NO
        FROM dual
        CONNECT BY LEVEL <= 400
    ) r
)
WHERE NOT EXISTS (
    SELECT 1
    FROM APPROVAL a
    WHERE a.MEM_NO = MEM_NO AND a.MV_REVIEW_NO = MV_REVIEW_NO
) AND ROWNUM <= 2000;  -- 2000개의 샘플 데이터 생성

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 1
    , 4
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 1
    , 5
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 2
    , 6
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 2
    , 9
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 2
    , 12
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 3
    , 11
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 3
    , 8
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 4
    , 8
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 5
    , 1
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 5
    , 2
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 5
    , 11
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 6
    , 1
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 6
    , 2
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 6
    , 11
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 7
    , 1
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 7
    , 8
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 8
    , 1
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 8
    , 2
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 8
    , 11
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 9
    , 1
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 9
    , 8
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 10
    , 8
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 11
    , 1
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 11
    , 10
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 11
    , 12
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 12
    , 8
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 13
    , 1
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 13
    , 7
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 13
    , 12
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 14
    , 1
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 14
    , 11
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 15
    , 9
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 15
    , 14
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 16
    , 2
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 16
    , 14
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 16
    , 6
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 17
    , 1
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 17
    , 2
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 17
    , 11
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 18
    , 9
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 18
    , 2
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 19
    , 3
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 19
    , 8
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 20
    , 8
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 21
    , 8
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 22
    , 4
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 22
    , 8
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 23
    , 1
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 23
    , 10
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 24
    , 8
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 24
    , 11
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 25
    , 9
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 25
    , 14
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 26
    , 6
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 26
    , 8
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 27
    , 1
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 27
    , 8
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 28
    , 6
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 28
    , 7
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 28
    , 10
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 29
    , 1
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 29
    , 10
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 30
    , 1
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 30
    , 10
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 31
    , 7
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 31
    , 12
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 31
    , 8
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 31
    , 14
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 32
    , 1
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 33
    , 8
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 34
    , 1
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 34
    , 11
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 35
    , 10
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 35
    , 8
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 36
    , 8
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 36
    , 14
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 37
    , 1
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 37
    , 2
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 38
    , 10
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 38
    , 6
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 39
    , 8
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 40
    , 8
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 40
    , 2
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 41
    , 1
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 41
    , 9
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 42
    , 1
); 

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 42
    , 6
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 43
    , 8
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 43
    , 11
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 44
    , 8
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 44
    , 3
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 45
    , 1
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 46
    , 8
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 46
    , 3
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 46
    , 4
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 47
    , 4
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 47
    , 5
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 48
    , 8
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 49
    , 4
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 50
    , 3
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 51
    , 3
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 52
    , 1
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 52
    , 8
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 53
    , 1
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 53
    , 6
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 54
    , 8
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 55
    , 8
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 56
    , 1
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 56
    , 8
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 57
    , 1
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 57
    , 12
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 57
    , 10
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 57
    , 4
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 58
    , 1
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 59
    , 2
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 59
    , 3
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 60
    , 1
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 60
    , 8
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 61
    , 2
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 62
    , 9
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 62
    , 14
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 63
    , 1
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 63
    , 6
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 64
    , 8
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 64
    , 2
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 65
    , 8
);
INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 66
    , 8
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 67
    , 8
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 68
    , 2
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 68
    , 8
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 69
    , 4
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 70
    , 1
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 71
    , 9
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 71
    , 3
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 72
    , 1
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 73
    , 1
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 74
    , 6
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 74
    , 15
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 75
    , 1
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 76
    , 9
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 76
    , 8
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 77
    , 5
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 77
    , 4
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 78
    , 6
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 78
    , 1
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 78
    , 10
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 79
    , 8
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 79
    , 15
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 80
    , 5
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 80
    , 4
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 81
    , 6
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 81
    , 15
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 82
    , 2
);

INSERT INTO MOVIE_CATEGORY
VALUES (
    SEQ_MOVIE_CATEGORY_NO.NEXTVAL
    , 82
    , 9
);
--------------- 기웅 인물 데이터 추가
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '스티븐 스필버그'
    , '감독'
    , '1946-12-18'
    , '미국'
    , 'resources/upfiles/20080321154832_77889.webp'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '마크 라이런스'
    , '배우, 연출가'
    , '1960-01-18'
    , '영국'
    , 'resources/upfiles/20090321154832_77889.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '사이먼 페그'
    , '배우, 희극인, 각본가'
    , '1970-02-14'
    , '영국'
    , 'resources/upfiles/20090321155232_77189.webp'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '올리비아 쿡'
    , '배우'
    , '1993-12-27'
    , '잉글랜드'
    , 'resources/upfiles/20120821155232_77189.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '타이 셰리던'
    , '배우'
    , '1996-11-11'
    , '미국'
    , 'resources/upfiles/20121111155232_77189.webp'
    , DEFAULT
);
------------------------------- [용훈] 인물 데이터 추가---------------------------------------------
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '장재현'
    , '감독'
    , '1981-00-00'
    , '한국'
    , 'resources/upfiles/20221212125232_72122.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '최민식'
    , '배우'
    , '1962-04-27'
    , '한국'
    , 'resources/upfiles/20221212122242_82112.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '김고은'
    , '배우'
    , '1991-07-02'
    , '한국'
    , 'resources/upfiles/20221115172448_84176.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '유해진'
    , '배우'
    , '1970-01-04'
    , '한국'
    , 'resources/upfiles/20230202041440_98451.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '이도현'
    , '배우'
    , '1995-04-11'
    , '한국'
    , 'resources/upfiles/20230408071165_15117.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '신카이 마코토'
    , '감독'
    , '1973-02-09'
    , '일본'
    , 'resources/upfiles/20230409071046_12345.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '하라 나노카'
    , '배우'
    , '2003-08-26'
    , '일본'
    , 'resources/upfiles/20230101011244_23345.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '마츠무라 호쿠토'
    , '배우, 가수'
    , '1995-06-18'
    , '일본'
    , 'resources/upfiles/20230202021223_14615.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '후카츠 에리'
    , '배우'
    , '1973-01-11'
    , '일본'
    , 'resources/upfiles/20230303033165_18416.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '김성수'
    , '감독'
    , '1961-07-31'
    , '한국'
    , 'resources/upfiles/20230304051514_19151.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '황정민'
    , '배우'
    , '1970-09-01'
    , '한국'
    , 'resources/upfiles/20230305051615_21042.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '정우성'
    , '배우'
    , '1973-04-22'
    , '한국'
    , 'resources/upfiles/20230305061711_22189.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '이성민'
    , '배우'
    , '1968-10-15'
    , '한국'
    , 'resources/upfiles/20230306070102_23489.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '박해준'
    , '배우'
    , '1976-06-14'
    , '한국'
    , 'resources/upfiles/20230307080203_13579.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '이상용'
    , '감독'
    , '1980-00-00'
    , '한국'
    , 'resources/upfiles/20230308090304_23689.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '마동석'
    , '배우, 제작자'
    , '1971-03-01'
    , '미국'
    , 'resources/upfiles/20230309090305_32180.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '이준혁'
    , '배우'
    , '1984-03-13'
    , '한국'
    , 'resources/upfiles/20230309100405_32982.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '아오키 무네타카'
    , '배우, 제작자'
    , '1980-03-14'
    , '일본'
    , 'resources/upfiles/20230309110101_12053.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '이범수'
    , '배우'
    , '1969-11-25'
    , '한국'
    , 'resources/upfiles/20230309120202_43251.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '최귀화'
    , '배우'
    , '1978-03-03'
    , '한국'
    , 'resources/upfiles/20230309120404_14236.jpg'
    , DEFAULT
);

INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '톰 홀란드'
    , '배우'
    , '1996-06-01'
    , '영국'
    , 'resources/upfiles/20230309120515_16817.jpg'
    , DEFAULT
);

INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '김한민'
    , '감독'
    , '1969-11-05'
    , '한국'
    , 'resources/upfiles/20230309120501_21357.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '박해일'
    , '배우'
    , '1977-01-26'
    , '한국'
    , 'resources/upfiles/20230309120502_18754.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '변요한'
    , '배우'
    , '1986-04-29'
    , '한국'
    , 'resources/upfiles/20230309120503_28754.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '안성기'
    , '배우'
    , '1952-01-01'
    , '한국'
    , 'resources/upfiles/20230309120504_62754.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '손현주'
    , '배우'
    , '1965-06-24'
    , '한국'
    , 'resources/upfiles/20230309120505_68754.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '이석훈'
    , '감독'
    , '1972-01-05'
    , '한국'
    , 'resources/upfiles/20230309120506_51954.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '현빈'
    , '배우'
    , '1982-09-25'
    , '한국'
    , 'resources/upfiles/20230309120507_51951.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '임윤아'
    , '배우, 가수'
    , '1990-05-30'
    , '한국'
    , 'resources/upfiles/20230309120508_33551.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '다니엘 헤니'
    , '배우'
    , '1979-11-28'
    , '미국'
    , 'resources/upfiles/20230309120509_43892.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '이정재'
    , '배우, 감독'
    , '1972-12-15'
    , '한국'
    , 'resources/upfiles/20230309120509_41122.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '전혜진'
    , '배우'
    , '1976-08-10'
    , '한국'
    , 'resources/upfiles/20230309120510_28899.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '허성태'
    , '배우'
    , '1977-10-20'
    , '한국'
    , 'resources/upfiles/20230309120512_31599.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '안태진'
    , '감독'
    , '1972-00-00'
    , '한국'
    , 'resources/upfiles/20230309120512_31454.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '류준열'
    , '배우'
    , '1986-09-25'
    , '한국'
    , 'resources/upfiles/20230309120513_25161.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '존 왓츠'
    , '감독'
    , '1981-06-28'
    , '미국'
    , 'resources/upfiles/20230309120514_32877.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '젠데이아 콜먼'
    , '배우, 가수'
    , '1996-09-01'
    , '미국'
    , 'resources/upfiles/20230309120515_16828.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '베네딕트 컴버배치'
    , '배우'
    , '1976-07-19'
    , '영국'
    , 'resources/upfiles/20230309120515_35875.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '류승완'
    , '감독'
    , '1973-12-15'
    , '한국'
    , 'resources/upfiles/20230309120516_55875.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '김윤석'
    , '배우, 감독'
    , '1967-01-21'
    , '한국'
    , 'resources/upfiles/20230309120517_51584.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '조인성'
    , '배우'
    , '1981-07-28'
    , '한국'
    , 'resources/upfiles/20230309120517_23584.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '허준호'
    , '배우'
    , '1964-04-14'
    , '한국'
    , 'resources/upfiles/20230309120518_68474.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '케이트 쇼트랜드'
    , '감독, 작가'
    , '1968-08-10'
    , '오스트레일리아'
    , 'resources/upfiles/20230309120519_65651.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '스칼릿 조핸슨'
    , '배우, 가수'
    , '1984-11-22'
    , '미국'
    , 'resources/upfiles/20230309120519_98754.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '플로렌스 퓨'
    , '배우'
    , '1996-01-03'
    , '영국'
    , 'resources/upfiles/20230309120520_01532.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '레이첼 와이즈'
    , '배우'
    , '1970-03-07'
    , '영국'
    , 'resources/upfiles/20230309120520_02532.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '저스틴 린'
    , '감독'
    , '1971-00-00'
    , '대만'
    , 'resources/upfiles/20230309120520_10101.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '빈 디젤'
    , '배우, 감독'
    , '1967-07-18'
    , '미국'
    , 'resources/upfiles/20230309120520_10102.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '존 시나'
    , '배우, 프로레슬링선수'
    , '1977-04-23'
    , '미국'
    , 'resources/upfiles/20230309120520_10103.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '피트 닥터'
    , '감독'
    , '1968-10-09'
    , '미국'
    , 'resources/upfiles/20230309120520_10113.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '제이미 폭스'
    , '배우, 가수'
    , '1967-12-13'
    , '미국'
    , 'resources/upfiles/20230309120520_10114.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '스티븐 개건'
    , '감독, 작가'
    , '1965-05-06'
    , '미국'
    , 'resources/upfiles/20230309120520_20111.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '로버트 다우니 주니어'
    , '배우'
    , '1965-04-04'
    , '미국'
    , 'resources/upfiles/20230309120520_20112.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '라미 말렉'
    , '배우'
    , '1981-05-12'
    , '미국'
    , 'resources/upfiles/20230309120520_20113.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '안소니 루소'
    , '감독, PD'
    , '1970-02-03'
    , '미국'
    , 'resources/upfiles/20230309120520_20114.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '조 루소'
    , '감독, PD'
    , '1971-07-08'
    , '미국'
    , 'resources/upfiles/20230309120520_20115.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '크리스 에반스'
    , '배우'
    , '1981-06-13'
    , '미국'
    , 'resources/upfiles/20230309120520_20166.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '크리스 헴스워스'
    , '배우'
    , '1983-08-11'
    , '오스트레일리아'
    , 'resources/upfiles/20230309120520_20167.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '마크 러팔로'
    , '배우, 감독'
    , '1967-11-22'
    , '미국'
    , 'resources/upfiles/20230309120520_20168.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '제레미 레너'
    , '배우'
    , '1971-01-07'
    , '미국'
    , 'resources/upfiles/20230309120520_20169.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '폴 러드'
    , '배우'
    , '1969-04-06'
    , '미국'
    , 'resources/upfiles/20230309120520_20170.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '돈 치들'
    , '배우'
    , '1964-11-29'
    , '미국'
    , 'resources/upfiles/20230309120520_20171.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '브리 라슨'
    , '배우, 가수'
    , '1989-10-01'
    , '미국'
    , 'resources/upfiles/20230309120520_20172.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '드니 빌뇌브'
    , '감독, 작가'
    , '1967-10-03'
    , '캐나다'
    , 'resources/upfiles/20230309120521_10172.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '티모시 샬라메'
    , '배우'
    , '1995-12-27'
    , '미국'
    , 'resources/upfiles/20230309120521_10173.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '레베카 퍼거슨'
    , '배우'
    , '1983-10-19'
    , '스웨덴'
    , 'resources/upfiles/20230309120521_10174.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '그레타 거윅'
    , '배우, 감독'
    , '1983-08-04'
    , '미국'
    , 'resources/upfiles/20230309120522_10111.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '시얼샤 로넌'
    , '배우'
    , '1994-04-12'
    , '미국'
    , 'resources/upfiles/20230309120522_10112.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '엠마 왓슨'
    , '배우'
    , '1990-04-15'
    , '프랑스'
    , 'resources/upfiles/20230309120522_10113.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '엘리자 스캔런'
    , '배우'
    , '1999-01-06'
    , '오스트레일리아'
    , 'resources/upfiles/20230309120522_10114.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '우민호'
    , '감독'
    , '1971-00-00'
    , '한국'
    , 'resources/upfiles/20230309120523_65487.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '이병헌'
    , '배우'
    , '1970-07-12'
    , '한국'
    , 'resources/upfiles/20230309120523_65489.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '곽도원'
    , '배우'
    , '1973-05-17'
    , '한국'
    , 'resources/upfiles/20230309120523_65490.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '이희준'
    , '배우'
    , '1979-06-29'
    , '한국'
    , 'resources/upfiles/20230309120523_65491.jpg'
    , DEFAULT
);
INSERT INTO PERSON
VALUES (
    SEQ_PERSON_NO.NEXTVAL
    , '김소진'
    , '배우'
    , '1979-12-12'
    , '한국'
    , 'resources/upfiles/20230309120523_65492.jpg'
    , DEFAULT
);

------------------ CASTING 데이터 추가
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 28
    , 1
);

INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '제임스 도노반 할리데이'
    , 28
    , 2
);

INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '오르젠 모로우'
    , 28
    , 3
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '사만다 에벌린 쿡'
    , 28
    , 4
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '웨이드 오웬 와츠'
    , 28
    , 5
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 1
    , 6
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '김상덕'
    , 1
    , 7
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '이화림'
    , 1
    , 8
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '고영근'
    , 1
    , 9
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '윤봉길'
    , 1
    , 10
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 2
    , 11
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '이와토 스즈메'
    , 2
    , 12
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '무나카타 소타'
    , 2
    , 13
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '이와토 타마키'
    , 2
    , 14
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 4
    , 15
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '전두광'
    , 4
    , 16
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '이태신'
    , 4
    , 17
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '정상호'
    , 4
    , 18
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '노태건'
    , 4
    , 19
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 5
    , 20
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '마석도'
    , 5
    , 21
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '주성철'
    , 5
    , 22
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '리키'
    , 5
    , 23
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '장태수'
    , 5
    , 24
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 6
    , 20
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '마석도'
    , 6
    , 21
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '강해상'
    , 6
    , 24
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '전일만'
    , 6
    , 25
);

INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 7
    , 26
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '이순신'
    , 7
    , 27
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '와키자카 야스하루'
    , 7
    , 28
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '어영담'
    , 7
    , 29
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '원균'
    , 7
    , 30
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 8
    , 31
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '림철령'
    , 8
    , 32
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '강진태'
    , 8
    , 9
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '박민영'
    , 8
    , 33
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '잭'
    , 8
    , 34
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 9
    , 35
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '박평호'
    , 9
    , 35
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '김정도'
    , 9
    , 17
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '방주경'
    , 9
    , 36
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '장철성'
    , 9
    , 37
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 10
    , 38
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '천경수'
    , 10
    , 39
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '인조'
    , 10
    , 9
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 11
    , 41
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '피터 파커'
    , 11
    , 26
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , 'MJ'
    , 11
    , 42
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '닥터 스트레인지'
    , 11
    , 43
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 12
    , 44
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '한신성'
    , 12
    , 45
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '강대진'
    , 12
    , 46
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '림용수'
    , 12
    , 47
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 13
    , 48
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '나타샤 로마노프'
    , 13
    , 49
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '옐레나 벨로바'
    , 13
    , 50
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '멜리나 보스토코프'
    , 13
    , 51
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 14
    , 52
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '도미닉 토레토'
    , 14
    , 53
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '제이콥 토레토'
    , 14
    , 54
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 15
    , 55
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '조 가드너'
    , 15
    , 56
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 16
    , 57
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '닥터 두리틀'
    , 16
    , 58
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '지프'
    , 16
    , 26
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '치치'
    , 16
    , 59
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 23
    , 60
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 23
    , 61
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '토니 스타크'
    , 23
    , 58
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '스티브 로저스'
    , 23
    , 62
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '토르'
    , 23
    , 63
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '브루스 배너'
    , 23
    , 64
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '나타샤 로마노프'
    , 23
    , 49
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '클린트 바튼'
    , 23
    , 65
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '스캇 랭'
    , 23
    , 66
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '제임스 로즈'
    , 23
    , 67
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '캐럴 댄버스'
    , 23
    , 68
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 38
    , 69
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '폴'
    , 38
    , 70
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '챠니'
    , 38
    , 42
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '레이디 제시카'
    , 38
    , 71
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 19
    , 72
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '조 마치'
    , 19
    , 73
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '멕 마치'
    , 19
    , 74
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '에이미 마치'
    , 19
    , 50
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '베스 마치'
    , 19
    , 75
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '로리 로렌스'
    , 19
    , 70
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 33
    , 76
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '김규평'
    , 33
    , 77
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '박통'
    , 33
    , 18
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '박용각'
    , 33
    , 78
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '곽상천'
    , 33
    , 79
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '데보라 심'
    , 33
    , 80
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 29
    , 60
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '감독'
    , 29
    , 61
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '토니 스타크'
    , 29
    , 58
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '스티브 로저스'
    , 29
    , 62
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '토르'
    , 29
    , 63
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '브루스 배너'
    , 29
    , 64
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '나타샤 로마노프'
    , 29
    , 49
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '클린트 바튼'
    , 29
    , 65
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '스캇 랭'
    , 29
    , 66
);
INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '제임스 로즈'
    , 29
    , 67
);

INSERT INTO CASTING
VALUES (
    SEQ_CASTING_NO.NEXTVAL
    , '닥터 스트레인지'
    , 29
    , 43
);

-- 없는영화신청 테이블에 샘플데이터 삽입 (김지우)
INSERT INTO NO_MOVIE_ENROLL
VALUES (
            SEQ_NO_MOVIE_ENROLL_NO.NEXTVAL
          , '굿 윌 헌팅'
          , '수학, 법학, 역사학 등 모든 분야에 재능이 있는 ‘윌’(맷 데이먼)은 천재적인 두뇌를 가지고 있지만 어린 시절 받은 상처로 인해 세상에 마음을 열지 못하는 불우한 반항아. 절친인 ‘처키’(벤 애플렉)와 어울리던 ‘윌’의 재능을 알아본 MIT 수학과 ‘램보’ 교수는 대학 동기인 심리학 교수 ‘숀’(로빈 윌리엄스)에게 그를 부탁하게 되고 거칠기만 하던 ‘윌’은 ‘숀’과 함께 시간을 보낼수록 상처를 위로 받으며 조금씩 변화하기 시작하는데…'
          , '1998-03-21'
          , '126분'
          , '배우에 하정우를 추가해주세요'
          , 'Y'
          , 'D'
          , '2'
          , '3'
          , '2024-03-11'
          , NULL
          , 30
          , NULL
          , 'resources/upfiles/19980321122025_13532.png'
          , 'resources/upfiles/19980321122026_54893.mp4'
);

INSERT INTO NO_MOVIE_ENROLL
VALUES (
            SEQ_NO_MOVIE_ENROLL_NO.NEXTVAL
          , '타이타닉'
          , '"내 인생의 가장 큰 행운은 당신을 만난 거야" 우연한 기회로 티켓을 구해 타이타닉호에 올라탄 자유로운 영혼을 가진 화가 ‘잭’(레오나르도 디카프리오)은 막강한 재력의 약혼자와 함께 1등실에 승선한 ‘로즈’(케이트 윈슬렛)에게 한눈에 반한다. 진실한 사랑을 꿈꾸던 ‘로즈’ 또한 생애 처음 황홀한 감정에 휩싸이고, 둘은 운명 같은 사랑에 빠지는데… 가장 차가운 곳에서 피어난 뜨거운 사랑! 영원히 가라앉지 않는 세기의 사랑이 펼쳐진다!'
          , '1998-02-20'
          , '195분'
          , '프란시스 피셔 배우를 추가해주세요'
          , 'Y'
          , 'Y'
          , '2'
          , '3'
          , '2024-03-22'
          , NULL
          , 29
          , NULL
          , 'resources/upfiles/20240322131811_45733.png'
          , 'resources/upfiles/20240322131812_15674.mp4'
);

INSERT INTO NO_MOVIE_ENROLL
VALUES (
            SEQ_NO_MOVIE_ENROLL_NO.NEXTVAL
          , '엑시트'
          , '대학교 산악 동아리 에이스 출신이지만 졸업 후 몇 년째 취업 실패로 눈칫밥만 먹는 용남은 온 가족이 참석한 어머니의 칠순 잔치에서 연회장 직원으로 취업한 동아리 후배 의주를 만난다 어색한 재회도 잠시, 칠순 잔치가 무르익던 중 의문의 연기가 빌딩에서 피어 오르며 피할 새도 없이 순식간에 도심 전체는 유독가스로 뒤덮여 일대혼란에 휩싸이게 된다. 용남과 의주는 산악 동아리 시절 쌓아 뒀던 모든 체력과 스킬을 동원해 탈출을 향한 기지를 발휘하기 시작하는데…'
          , '2019-07-31'
          , '103분'
          , '황효은 배우를 추가해주세요'
          , 'Y'
          , 'N'
          , '1'
          , '2'
          , '2024-03-22'
          , NULL
          , 28
          , NULL
          , 'resources/upfiles/20240322141812_43653.png'
          , 'resources/upfiles/20240322141813_70152.mp4'
);

-- 첨부파일 테이블에 굿윌헌팅 영화 포스터 이미지, 예고편 영상 샘플데이터 넣음 (김지우)
INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '굿윌헌팅_포스터.png', '19980321122025_13532.png', SYSDATE, 1, 'resources/upfiles/', 1, DEFAULT, 1, 38);
INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '굿윌헌팅_예고편.mp4', '19980321122026_54893.mp4', SYSDATE, 2, 'resources/upfiles/', 1, DEFAULT, 2, 38);

INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '타이타닉_포스터.png', '20240322131811_45733.png', SYSDATE, 1, 'resources/upfiles/', 1, DEFAULT, 1, 42);
INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '타이타닉_예고편.mp4', '20240322131812_15674.mp4', SYSDATE, 2, 'resources/upfiles/', 1, DEFAULT, 2, 42);

INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '엑시트_포스터.png', '20240322141812_43653.png', SYSDATE, 1, 'resources/upfiles/', 1, DEFAULT, 1, 43);
INSERT INTO ATTACHMENT VALUES(SEQ_ATTACHMENT_NO.NEXTVAL, '엑시트_예고편.mp4', '20240322141813_70152.mp4', SYSDATE, 2, 'resources/upfiles/', 1, DEFAULT, 2, 43);

-- 탈퇴회원 테이블 INSERT 구문 (김지우)
INSERT INTO CANCELED_MEM VALUES(1, 2, '2023-03-22');
INSERT INTO CANCELED_MEM VALUES(3, 1, '2023-09-10');
INSERT INTO CANCELED_MEM VALUES(5, 1, '2023-08-22');
INSERT INTO CANCELED_MEM VALUES(7, 2, '2024-01-11');
INSERT INTO CANCELED_MEM VALUES(9, 1, '2023-10-15');
INSERT INTO CANCELED_MEM VALUES(11, 2, '2021-11-21');
INSERT INTO CANCELED_MEM VALUES(13, 1, '2023-10-09');
INSERT INTO CANCELED_MEM VALUES(15, 2, '2020-10-29');
INSERT INTO CANCELED_MEM VALUES(17, 1, '2021-08-17');
INSERT INTO CANCELED_MEM VALUES(19, 2, '2018-09-22');
INSERT INTO CANCELED_MEM VALUES(21, 2, '2021-11-30');
INSERT INTO CANCELED_MEM VALUES(23, 2, '2021-12-19');

-- 신고 테이블 샘플데이터 (김지우)
INSERT INTO REPORT VALUES(SEQ_REPORT_NO.NEXTVAL, '1', '게시판에 욕설 남김', '2024-03-22', 1, 2, '1', 1);
INSERT INTO REPORT VALUES(SEQ_REPORT_NO.NEXTVAL, '2', '게시판에 도배함', '2024-03-22', 3, 4, '1', 1);
INSERT INTO REPORT VALUES(SEQ_REPORT_NO.NEXTVAL, '1', '게시판에 욕설 남김', '2024-03-22', 1, 2, '1', 1);
INSERT INTO REPORT VALUES(SEQ_REPORT_NO.NEXTVAL, '2', '게시판에 도배함', '2024-03-22', 3, 4, '1', 1);
INSERT INTO REPORT VALUES(SEQ_REPORT_NO.NEXTVAL, '1', '게시판에 도배함', '2024-03-22', 3, 4, '1', 2);
INSERT INTO REPORT VALUES(SEQ_REPORT_NO.NEXTVAL, '3', '선정성 게시물 작성', '2024-03-22', 3, 4, '1', 2);
INSERT INTO REPORT VALUES(SEQ_REPORT_NO.NEXTVAL, '2', '선정성 게시물 도배', '2024-03-22', 5, 6, '2', 3);
INSERT INTO REPORT VALUES(SEQ_REPORT_NO.NEXTVAL, '2', '댓글 도배', '2024-03-22', 5, 6, '2', 3);


-- 문의 테이블 샘플데이터 (김지우)
INSERT INTO INQUIRY VALUES(SEQ_INQUIRY_NO.NEXTVAL, '회원가입 관련 문제', '분명히 회원가입을 했는데 로그인이 되지 않습니다. 확인 후 답변 부탁드리겠습니다.', '2024-03-21', 'N', 30, 1, NULL, NULL);
INSERT INTO INQUIRY VALUES(SEQ_INQUIRY_NO.NEXTVAL, '홈페이지 사용법 관련 문제', '홈페이지 사용법 관련한 매뉴얼이 따로 있을까요?', '2024-03-19', 'Y', 29, 1, '아직 없지만 곧 만들어서 배포할 계획입니다.', '2024-03-20');

-- 활동제한 테이블 강제탈퇴인지 활동제한인지 여부에 대한 컬럼 추가 (김지우)
ALTER TABLE REPORTED_MEM ADD(ACTIVITY_STATUS CHAR(1));

-- 활동제한 테이블 샘플데이터 (김지우)
ALTER TABLE REPORTED_MEM MODIFY(END_DATE NULL);

INSERT INTO REPORTED_MEM VALUES(6, 1, '욕설', '2024-03-21', '2024-03-23', 'S');
INSERT INTO REPORTED_MEM VALUES(4, 1, '욕설 및 도배로 인해 영구정지', '2024-02-22', NULL, 'B');

-- -- 문의 테이블 샘플데이터 (김지우)
INSERT INTO INQUIRY VALUES(SEQ_INQUIRY_NO.NEXTVAL, '회원탈퇴 관련 문제', '분명히 회원탈퇴을 했는데 로그인이 되지 않습니다. 확인 후 답변 부탁드리겠습니다.', '2024-03-20', 'N', 27, 1, NULL, NULL);
INSERT INTO INQUIRY VALUES(SEQ_INQUIRY_NO.NEXTVAL, '홈페이지 사용법 관련 문제', '홈페이지 사용법 관련한 매뉴얼이 따로 있을까요?', '2024-03-19', 'N', 28, 1, NULL, NULL);

-- 없는영화 신청 테이블 거절 사유 UPDATE (김지우)
UPDATE NO_MOVIE_ENROLL
SET NM_REFUSE_REASON = '정보 누락'
WHERE NM_TITLE = '타이타닉';

commit;