-- 메인기능: 공지사항, 자료실, 자유게시판, 강의별 댓글, 교재od와 시범강의
-- 부가기능: 파일업로드, 채팅, 타계정 또는 SNS로그인, 수강평, 달력,
-- 가입시 축하 이메일 보내기, 비밀번호 변경시 이메일 보내기, 온라인 평가, 진도관리, 학습 스케쥴러, 나의 강의실  등
CREATE DATABASE haebeop;
DROP DATABASE haebeop;
USE haebeop;

CREATE TABLE test(
	num INT AUTO_INCREMENT PRIMARY key,
	title VARCHAR(200));
	
INSERT INTO test VALUES (DEFAULT, '테스트제목1');
INSERT INTO test VALUES (DEFAULT, '테스트제목2');
INSERT INTO test VALUES (DEFAULT, '테스트제목3');
INSERT INTO test VALUES (DEFAULT, '테스트제목4');
INSERT INTO test VALUES (DEFAULT, '테스트제목5');

DESC test;

SELECT * FROM emp;

CREATE TABLE user(
  id VARCHAR(20) PRIMARY KEY NOT NULL,
  pw VARCHAR(300) NOT NULL,
  NAME VARCHAR(50),
  email VARCHAR(100) NOT NULL,
  tel VARCHAR(20) NOT NULL,
  addr1 VARCHAR(200),
  addr2 VARCHAR(100),
  postcode VARCHAR(10),
  regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
  birth DATE,
  pt INT(11) DEFAULT 0,
  visited INT(11) DEFAULT 0,
  isStudy BOOLEAN DEFAULT false);
	
INSERT INTO USER VALUES('admin','1234','관리자','admin@edu.com','010-1111-1111', DEFAULT, DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT, default);
INSERT INTO USER VALUES('kimbk','1234','김보경','kimbk@edu.com','010-1111-1111',DEFAULT, DEFAULT, DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT,DEFAULT);

UPDATE user SET pw='$2a$10$kPyzPosvAionjkkLB2gGp.0HaSQvSeqvjIAszXrkrauzf2fa330s6' WHERE pw='1234';

SELECT * FROM user;

DROP TABLE USER;

-- 공지사항(순번, 제목, 내용, 작성일, 읽은횟수)
CREATE TABLE notice(
	seq INT PRIMARY KEY AUTO_INCREMENT,
	title	VARCHAR(100) NOT NULL,
	content VARCHAR(1000),
	regdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
	visited INT default 0);
	
INSERT INTO notice VALUES (DEFAULT,'공지사항1','내용1',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'공지사항2','내용2',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'공지사항3','내용3',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'공지사항4','내용4',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'공지사항5','내용5',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'공지사항6','내용6',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'공지사항7','내용7',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'공지사항8','내용8',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'공지사항9','내용9',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'공지사항10','내용10',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'공지사항11','내용11',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'공지사항12','내용12',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'공지사항13','내용13',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'공지사항14','내용14',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'공지사항15','내용15',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'공지사항16','내용16',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'공지사항17','내용17',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'공지사항18','내용18',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'공지사항19','내용19',DEFAULT, DEFAULT);
INSERT INTO notice VALUES (DEFAULT,'공지사항20','내용20',DEFAULT, DEFAULT);
	
-- 자료
CREATE TABLE fileInfo(
	no int NOT NULL AUTO_INCREMENT PRIMARY KEY,
	articleno INT,
	saveFolder VARCHAR(300) NOT NULL,
	originFile VARCHAR(300) NOT NULL,
	saveFile VARCHAR(300) NOT NULL);
                         
-- 자료실 테이블 생성
CREATE TABLE fileboard (
   articleno int NOT NULL AUTO_INCREMENT PRIMARY KEY,
   id varchar(16) NOT NULL,
   title varchar(100) NOT NULL,
   content varchar(2000) NOT NULL,
   regdate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	visited INT DEFAULT 0,
	rec INT DEFAULT 0);
	
INSERT INTO fileboard VALUES(DEFAULT, 'admin', '자료실1','자료실1내용', DEFAULT, DEFAULT, DEFAULT);
SELECT * FROM fileboard;
SELECT * FROM fileinfo;

-- 커뮤니티 카테고리 테이블 생성
CREATE TABLE category(
   cate VARCHAR(5) PRIMARY KEY NOT NULL,
   cateName VARCHAR(100) NOT NULL);

-- 카테고리 테이블 데이터
INSERT INTO category VALUES('A', '자유게시판');
INSERT INTO category VALUES('B', '강의 정보');
INSERT INTO category VALUES('C', '교재 추천');
INSERT INTO category VALUES('D', '진로상담');

-- 커뮤니티 게시판 테이블 생성
CREATE TABLE community(
  cno INT PRIMARY KEY AUTO_INCREMENT,
  cate VARCHAR(5) NOT NULL,
  title VARCHAR(200) NOT NULL,
  content VARCHAR(1000),
  author VARCHAR(20),
  resdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
  cnt INT DEFAULT 0,
  FOREIGN KEY(cate) REFERENCES category(cate) ON DELETE CascADE,
  FOREIGN KEY(author) REFERENCES user(id) ON DELETE CascADE);

/* 자유게시판 더미데이터 */
INSERT INTO community(cate, title, content, author)
VALUES ('A', '요즘 나만 느끼는 일상 이야기 🌼', '안녕하세요! 요즘 일상에서 느끼는 이런 저런 생각들을 나눌 수 있는 자리가 필요해서 이렇게 글을 써봅니다. 평범한 일상에서 느껴지는 작은 기쁨부터 고민, 궁금증까지 다양한 이야기들을 나눠봐요. 함께 이야기 나누면서 조금 더 나를 알아가고 싶어요. 여러분의 이야기도 기대해요! 🌸', 'admin');
INSERT INTO community(cate, title, content, author)
VALUES ('A', '먹는 즐거움, 나만의 맛 여행 🍜', '안녕하세요, 맛집 탐험가로 떠나는 나만의 맛 여행 이야기를 공유하려고 합니다! 맛있는 음식을 찾아 나날이 다양한 식도락을 즐기며, 그 맛에 빠져보는 나만의 여정을 담아봅니다. 맛있는 음식과 함께 나누는 추억, 그 무엇도 대신할 수 없는 행복이에요. 같이 맛있는 이야기 나누어봐요!', 'admin');
INSERT INTO community(cate, title, content, author)
VALUES ('A', '취미를 통한 나만의 작은 행복 💫', ' 안녕하세요! 취미 생활을 통해 나만의 작은 행복을 찾아가는 여정을 나누고 싶어요. 그림 그리기, 음악 연주, 독서, 등산, 무엇이든지 제게 특별한 순간을 선사하는 취미들을 통해 일상의 소소한 기쁨을 느끼고 있어요. 여러분의 취미와 나누고 싶은 경험이 있다면 언제든지 말씀해주세요!', 'admin');
INSERT INTO community(cate, title, content, author)
VALUES ('A', '감성을 담아 풀어내는 나만의 시간 🌌', '안녕하세요, 여기는 감성의 풍부한 이야기들을 나눌 수 있는 공간입니다. 나만의 감정을 시를 통해 표현하고, 일상의 감동을 나누며 마음을 편하게 풀어보려고 합니다. 시를 통해 나만의 감성을 표현하는 순간들을 함께해요. 여러분의 감성적인 이야기도 함께 들려주세요.', 'admin');
INSERT INTO community(cate, title, content, author)
VALUES ('A', '여행이야기, 세상을 누비다 🌏', '안녕하세요! 여행을 통해 세계 각지에서 느낀 감동과 경험을 공유하고 싶어서 글을 씁니다. 다양한 나라와 문화를 경험하며 얻은 인상적인 이야기들을 담아봐요. 여행이 주는 새로운 시야와 경험을 통해 나만의 세계를 만들어나가는 여정을 함께 나누어봐요! 🌍', 'admin');

/* 교육정보 게시판 더미데이터 */
INSERT INTO community(cate, title, content, author)
VALUES ('B', '똑똑해지자! 유용한 학습 정보 공유 📚', '안녕하세요! 이 공간은 학습과 교육에 관한 다양한 정보를 공유하고 함께 성장하는 공간입니다. 학교 공부에서 시작해서 취미로 꾸준히 배우는 것, 또는 현실에서 유용한 기술까지 학습과 관련된 모든 주제를 다룰 예정이에요. 함께 배워가며 더 똑똑해지는 여정에 동참해보세요!', 'admin');
INSERT INTO community(cate, title, content, author)
VALUES ('B', '직업을 위한 교육과 전문 지식 공유 🌟', '안녕하세요! 여기는 다양한 직업을 위한 교육 정보와 전문 지식을 공유하는 공간입니다. 각 분야의 전문가들이 직업과 관련된 유용한 정보, 교육 경로, 취업 준비 팁 등을 나누어드리며, 여러분의 꿈을 향한 첫 걸음을 함께 응원하고 지원해드릴게요. 함께 멋진 직업을 향해 나아가요!', 'admin');
INSERT INTO community(cate, title, content, author)
VALUES ('B', '부모님을 위한 교육 안내 및 조언 🏫', '안녕하세요, 부모님을 위한 교육 관련 정보를 나누는 공간입니다. 자녀의 교육과 관련된 궁금증, 교육 방법, 학교 선택, 학습 도구 소개부터 아이들의 성장과 관련된 다양한 이야기들을 함께 공유하고 상담할 수 있는 공간이에요. 부모님들의 이야기를 기다리고 있어요!', 'admin');
INSERT INTO community(cate, title, content, author)
VALUES ('B', '효과적인 학습 방법과 꿀팁 공유 🎓', '안녕하세요, 학습을 더욱 효과적으로 하는 방법과 유용한 꿀팁들을 나누고자 하는 공간입니다. 학교에서 공부하는 것부터 개인적으로 공부하는 방법, 집중력 향상을 위한 습관 등 학습과 관련된 다양한 정보들을 함께 공유하고 배워가는 시간을 가지고자 합니다. 함께 공부해요!', 'admin');
INSERT INTO community(cate, title, content, author)
VALUES ('B', '학교 생활, 스트레스 극복 팁 공유 🌈', '안녕하세요! 학교 생활에서 느끼는 스트레스를 극복하고 즐겁게 보내기 위한 꿀팁을 공유하는 공간입니다. 공부와 여가를 잘 조절하며, 친구 관계에서의 고민, 시험 스트레스 해소법 등 학교 생활에서 도움이 될만한 다양한 정보를 나누어보려고 해요!', 'admin');

/* 교재/학원 추천 게시판 더미데이터 */
INSERT INTO community(cate, title, content, author)
VALUES ('C', '최고의 교재와 학원 찾아봐요! 📚', '안녕하세요! 이곳은 다양한 학습 교재와 학원을 추천해주고 정보를 공유하는 공간입니다. 어떤 분야든 궁금하신 거라면 언제든 물어보세요. 현직 전문가들이 검증한 교재나 효과적인 학원을 함께 찾아보며, 학습에 필요한 최고의 도구를 찾아보아요. 함께 공부의 즐거움을 느껴봐요!', 'admin');
INSERT INTO community(cate, title, content, author)
VALUES ('C', '꿀팁으로 찾는 당신에게 딱 맞는 학원! 🌟', '안녕하세요! 이곳은 학원 선택에 도움을 주는 꿀팁과 추천 정보를 공유하는 공간입니다. 당신의 목표와 맞는 학원을 찾기 위한 실용적인 조언들을 나누며, 다양한 분야의 교육 기관을 추천해드립니다. 함께 성장하는 학습의 즐거움을 찾아봐요!', 'admin');
INSERT INTO community(cate, title, content, author)
VALUES ('C', '전문가가 추천하는 교재와 학원 모음 📖', '안녕하세요! 이곳에서는 각 분야 전문가들이 추천하는 교재와 학원을 소개해드리고, 그에 대한 리뷰와 효과적인 학습 방법을 공유하고자 합니다. 당신의 학습 목표를 향한 첫걸음을 떼기 위한 좋은 정보들이 기다리고 있어요. 함께 더 나은 미래를 위한 교육을 찾아봐요!', 'admin');
INSERT INTO community(cate, title, content, author)
VALUES ('C', '학습의 길목, 교재와 학원 추천 모음 🌼', '안녕하세요! 학습의 길목에서 가장 중요한 것은 바로 교재와 학원의 선택입니다. 여기에서는 각 분야의 교재와 학원을 공부하는 전문가들의 추천과 의견을 모아봤어요. 당신의 학습에 도움이 될 최고의 도구들을 찾아보며, 함께 좋은 선택을 해나가요!', 'admin');
INSERT INTO community(cate, title, content, author)
VALUES ('C', '나만의 학습 방식에 맞는 교재와 학원 찾기 🚀', '안녕하세요! 각자의 학습 방식과 목표에 따라 적합한 교재와 학원을 찾는 것은 매우 중요합니다. 이곳에서는 당신의 학습 스타일에 맞는 교재와 학원을 추천하고, 다양한 이야기와 경험을 나누며 최적의 선택을 찾아나가는 공간이에요. 함께 나만의 학습 길을 찾아보아요!', 'admin');

/* 진로상담 커뮤니티 더미데이터 */
INSERT INTO community(cate, title, content, author)
VALUES ('D', '미래를 그리는 진로상담 친구들 🚀', '안녕하세요! 이 곳은 당신의 미래를 함께 그리고 상담해주는 공간입니다. 진로에 관한 고민, 궁금증, 희망 등 모든 것을 자유롭게 나누고 고민을 함께 나눌 수 있는 친구들이 여기에 있어요. 함께 당신만의 꿈과 목표를 향해 나아가봐요. 당신의 미래를 응원합니다!', 'admin');
INSERT INTO community(cate, title, content, author)
VALUES ('D', '꿈을 향한 진로탐색 여행 🌠', '안녕하세요! 여기는 당신의 꿈을 찾아가기 위한 진로탐색 여행지입니다. 어떤 진로를 선택해야 할지 망설이고 있다면 함께 여행하며 당신의 강점, 흥미, 가치관을 찾아보아요. 꿈을 향한 여정에서 당신에게 맞는 길을 찾을 수 있도록 도와드릴게요!', 'admin');
INSERT INTO community(cate, title, content, author)
VALUES ('D', '나만의 길을 찾는 진로상담 모임 🌱', '안녕하세요! 이곳은 나만의 길을 찾고자 하는 당신을 위한 진로상담 모임입니다. 다양한 진로에 대한 이야기, 성장하는 과정에서의 고민, 앞으로의 목표를 나누며 함께 더 나은 미래를 향해 나아갈 수 있도록 도움을 드릴게요. 나만의 진로를 찾는 여정, 함께해요!', 'admin');
INSERT INTO community(cate, title, content, author)
VALUES ('D', '청춘의 선택, 진로에 대한 이야기 🌈', '안녕하세요! 청춘의 선택인 진로에 대해 이야기 나누는 공간입니다. 다양한 진로 선택, 진로에 대한 고민, 준비 과정에서의 이슈들을 나누며 함께 당신에게 맞는 길을 찾아가봐요. 우리 모두 함께 꿈을 향해 달려봅시다!', 'admin');
INSERT INTO community(cate, title, content, author)
VALUES ('D', '진로 여행을 떠나는 항해 모임 ⛵', '안녕하세요! 우리는 당신의 진로 여행을 함께 항해할 동료입니다. 함께 세계 여행처럼 다양한 진로를 탐험하며, 당신의 역량과 흥미를 발견해보아요. 진로에 대한 이야기, 정보, 충고 등을 나누며 당신의 항해를 응원하고 지원할 준비가 되어있어요! 함께 떠나볼까요? ⚓', 'admin');

-- 커뮤니티 댓글 테이블 생성
CREATE TABLE COMMENT(
   comNo INT PRIMARY KEY AUTO_INCREMENT,
   cno INT NOT NULL,
   author VARCHAR(20) NOT NULL,
   resdate DATETIME DEFAULT CURRENT_TIMESTAMP(),
   content VARCHAR(1000) NOT NULL,
   FOREIGN KEY(cno) REFERENCES community(cno) ON DELETE CascADE,
   FOREIGN KEY(author) REFERENCES user(id) ON DELETE CascADE
);

-- 과목(과목코드, 과목명)
CREATE TABLE subject(
	scode VARCHAR(10) PRIMARY KEY,
	sname VARCHAR(200) NOT NULL
);

INSERT INTO subject VALUES('ko', '국어');
INSERT INTO subject VALUES('ma', '수학');
INSERT INTO subject VALUES('en', '영어');
INSERT INTO subject VALUES('fo', '외국어');

-- 강사 테이블 (강사코드, 강사명, 연락처, 이메일, 강사소개, 강사 이미지)
CREATE TABLE teacher(
	tcode INT PRIMARY KEY AUTO_INCREMENT,
	tid VARCHAR(20) NOT NULL,
	tname VARCHAR(50) NOT NULL,
	ttel VARCHAR(20) NOT NULL,
	temail VARCHAR(100) NOT NULL,
	tcontent VARCHAR(1000) NOT NULL,
	saveFile VARCHAR(300) NOT NULL
);

-- 교재 테이블 생성(교재코드, 교재이름, 교재소개, 저자, 가격)
CREATE TABLE book (
	bcode VARCHAR(20) primary key NOT NULL ,
	bname VARCHAR(100) NOT NULL,
	content VARCHAR(1000) NOT NULL,
	author VARCHAR(1000) NOT NULL,
	bprice INT(11) NOT NULL
);

-- 강의 테이블 (강의코드, 강의명, 과목코드, 강사코드, 강의 소개, 강의 단가, 수강인원, 강의 썸네일(saveFile), 강의 시작일, 강의 종료일, (오프라인 시)강의 시작시간, 온오프 여부, 강의실)
CREATE TABLE lecture(
	lcode VARCHAR(50) PRIMARY KEY,
	lname VARCHAR(500) NOT NULL,
	scode VARCHAR(10) NOT NULL,
	tcode INT,
	bcode VARCHAR(10),
	lcontent VARCHAR(1000) NOT NULL,
	lprice INT DEFAULT 0,
	maxStudent INT DEFAULT 0,
	saveFile VARCHAR(300) NOT NULL,
	sdate DATE NOT NULL,
	edate DATE NOT NULL,
	stime TIME,
	state VARCHAR(10) CHECK(state IN ('on', 'off', 'close')),
	classroom VARCHAR(10),
	FOREIGN KEY(scode) REFERENCES SUBJECT(scode),
	FOREIGN KEY(tcode) REFERENCES teacher(tcode),
	FOREIGN KEY(bcode) REFERENCES book(bcode)
); 
-- 커리큘럼 (커리큘럼코드, 강의코드, 강좌 제목, 강의 파일, 강의 시간)
CREATE TABLE curriculum(
	ccode INT PRIMARY KEY AUTO_INCREMENT,
	lcode VARCHAR(50) NOT NULL,
	cname VARCHAR(500) NOT NULL,
	cvideo VARCHAR(500),
	FOREIGN KEY(lcode) REFERENCES lecture(lcode) ON DELETE CASCADE
);

-- 강의 리뷰(리뷰코드, 강의코드, 학생아이디, 별점, 리뷰 내용)
CREATE TABLE review(
	rcode INT AUTO_INCREMENT PRIMARY KEY,
	lcode VARCHAR(50) NOT NULL,
	id VARCHAR(20) NOT NULL,
	star INT NOT NULL DEFAULT 0,
	content VARCHAR(1000) NOT NULL,
	FOREIGN KEY (lcode) REFERENCES lecture(lcode) ON DELETE CASCADE
);

-- 수강(수강코드, 강의코드, 학생아이디, 수강총시간, 수강 완료여부)
CREATE TABLE register(
	rcode INT AUTO_INCREMENT PRIMARY KEY,
	lcode VARCHAR(50) NOT NULL,
	id VARCHAR(20) NOT NULL,
	completed BOOLEAN DEFAULT FALSE,
	FOREIGN KEY(id) REFERENCES user(id) ON DELETE CASCADE
);

-- 수강생 강의 수강 정보 테이블
CREATE TABLE studyinfo(
	scode INT AUTO_INCREMENT PRIMARY KEY,
	ccode INT NOT NULL,
	id VARCHAR(20) NOT NULL,
	studyTime DOUBLE DEFAULT 0,
	completed BOOLEAN DEFAULT FALSE,
	FOREIGN KEY(id) REFERENCES user(id) ON DELETE CASCADE,
	FOREIGN KEY(ccode) REFERENCES curriculum(ccode) ON DELETE CASCADE
);

CREATE TABLE lecboard(
  qno int PRIMARY KEY AUTO_INCREMENT,   			-- 번호
  lcode VARCHAR(50) NOT NULL,                   -- 강의코드
  title VARCHAR(100) NOT NULL,   					-- 제목
  content VARCHAR(1000) NOT NULL,   				-- 내용
  author VARCHAR(16),   								-- 작성자
  resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,  -- 등록일
  lev INT DEFAULT 0, 									-- 질문(0), 답변(1)
  par INT DEFAULT 0,													-- 질문(자신 레코드의 qno), 답변(질문의 글번호)
  FOREIGN KEY(author) REFERENCES user(id) ON DELETE CASCADE,
  FOREIGN KEY(lcode) REFERENCES lecture(lcode) ON DELETE CASCADE);
        
-- 배송 테이블 생성(배송번호, 결제번호, 아이디, 주소, 번호, 배송회사, 배송전화번호, 배송상태, 배송시간, 배송예정일자, 배송코드)
create table delivery(
	 dno int primary KEY AUTO_INCREMENT,
	 pno int, 					
	 id varchar(20),				
	 addr VARCHAR(200),	
	 tel varchar(13) not null,				
	 dcom varchar(100),					
	 dtel varchar(13),			
	 dstatus int default 0,				
	 ddate timestamp default CURRENT_TIMESTAMP,
	 edate varchar(13),						
	 dcode varchar(30),
	 FOREIGN KEY (id) REFERENCES user(id) ON DELETE CASCADE				
);


-- 출고 테이블 생성(출고 번호, 배송코드, 출고 가격, 수량, 출고일자)
CREATE TABLE serve(
    sno INT PRIMARY KEY AUTO_INCREMENT,
	 pno INT,							
    bcode VARCHAR(20) NOT NULL,		              
    sprice INT DEFAULT 1000,					 
    amount INT DEFAULT 1,				         	
    resdate TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    FOREIGN KEY (pno) REFERENCES payment(pno) ON DELETE CASCADE,
	 FOREIGN KEY (bcode) REFERENCES book (bcode) ON DELETE CASCADE    
);
-- 결제 테이블 생성(고유번호, 결제제목, 강의코드, 교재코드, 강사코드, 아이디, 결제방법, 결제회사, 결제금액, 배송번호, 계좌번호, 결제일자)
create table payment(
	   pno INT primary KEY AUTO_INCREMENT,
	   title VARCHAR(100) NOT NULL,
		lcode VARCHAR(50) NOT NULL,		
		bcode VARCHAR(20) NOT NULL,
		tcode INT,
	   id varchar(20) not null,	
	   method varchar(100),		
	   com varchar(100),			
	   price int default 1000,
		dno INT,	
	   account varchar(100) NOT NULL,
	   resdate timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP,
	   FOREIGN KEY (lcode) REFERENCES lecture (lcode) ON DELETE CASCADE,
	   FOREIGN KEY (bcode) REFERENCES book (bcode) ON DELETE CASCADE,
	   FOREIGN KEY (tcode) REFERENCES teacher (tcode) ON DELETE CASCADE,
	   FOREIGN KEY (dno) REFERENCES delivery(dno) ON DELETE CASCADE,
		FOREIGN KEY (id) REFERENCES user (id) ON DELETE CASCADE
);


--강의배정이란?(view)
-- 과목, 강사, 교재정보를 강의테이블에 등록하는 행위로 하나의 과목당 여러 강의를 모두 등록하여야한다.

--수강신청이란?(view)
--강의정보를 보고, 학생이 수강신청을 하는 행위를 말하며, 학생별로 모든 강의정보가 등록되어야하며, 만약 수강신청 시 수강인원이 초과될 경우 수강신청을 할 수 없다.