#  🎞 FilmPick
***

## :sparkles: [ Summary ]
> 영화의 정보를 소개하고 공유하는 커뮤니티 <br>
> 영화에 대한 리뷰를 남기고 공통 관심사를 통해 사용자들 간의 소통이 가능하도록 구현한 사이트

## :date: [ Develop Date ]
> <p>$\large{2024.02.14\ ~ \ 2024.03.28}$</p>
> 1주 차 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 프로젝트 기 <br>
> 2주 차 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: 기능 분석 및 UI설계 <br>
> 3주 차 &nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;: DB설계       <br>
> 4 ~ 6주 차 : 기능 구현                <br>


## 🧑🏻‍💻 [ Contribute ]
> - <p>$\bf{\color{#5882FA}한수민 : 관리자 → 영화관리, 커뮤니티}$</p>
> - 김지우 : 관리자 → 회원관리, 고객센터 <br>
> - 이용훈 : 사용자 → 메인페이지, 탐색 <br>
> - 정은정 : 사용자 → 로그인, 마이페이지 <br>
> - 배기웅 : 사용자 → 검색, 영화 상세 조회 <br>
> - 김호용 : 사용자 → 커뮤니티, 공지사항, 고객센터 <br>


## :four_leaf_clover: [ Stack ]
<div>
  <img src="https://img.shields.io/badge/HTML5-E34F26?logo=html5&logoColor=white" height="30px"> 			&nbsp;
  <img src="https://img.shields.io/badge/CSS3-1572B6?logo=css3&logoColor=white" height="30px"> 				&nbsp;
  <img src="https://img.shields.io/badge/JavaScript-F7DF1E?logo=javascript&logoColor=black" height="30px"> 		&nbsp;
  <img src="https://img.shields.io/badge/jQuery-0769AD?logo=jquery&logoColor=white" height="30px"> 			<br><br>
  <img src="https://img.shields.io/badge/Java11-007396?logo=OpenJDK&logoColor=white" height="30px"> 			&nbsp;
  <img src="https://img.shields.io/badge/Oracle-F80000?logo=oracle&logoColor=white" height="30px"> 			<br><br> 
  <img src="https://img.shields.io/badge/VScode-007ACC?logo=visualstudiocode&logoColor=white" height="30px">  &nbsp;
  <img src="https://img.shields.io/badge/github-181717?logo=github&logoColor=white" height="30px"> 			&nbsp;	<br><br> 
  <img src="https://img.shields.io/badge/bootstrap5-7952B3?logo=bootstrap&logoColor=black" height="30px"> 		&nbsp;
</div>

***


## ⚙️ [ Functions ]

### 1. [ 관리자_영화관리 ]

#### 1-1. 신규영화 등록
> 관리자 페이지로 진입하여 로그인 후 영화 관리 탭에서 신규 영화를 등록할 수 있습니다. <br>
> 영화 제목, 관람 등급, 영화 줄거리 등의 필수 입력 정보를 작성해야지만 등록이 가능하도록 required 속성을 주었습니다. <br>
> 등장인물 및 감독은 인물검색 버튼을 클릭하여 모달창에서 선택하여 등록이 가능합니다. <br>
> 첨부파일은 메인 포스터, 메인 동영상은 필수, 그 이외의 파일도 추가로 다중 등록이 가능합니다. <br>


#### 1-2. 등록된 영화 조회
> 등록된 영화 조회 페이지에서 최신 등록된 영화 순서대로 10개씩 보여집니다. <br>
> 관리와 삭제 버튼을 클릭하여 영화 상세 조회 및 삭제가 가능합니다. <br>
> 삭제 버튼 클릭 시 바로 삭제되지 않도록 삭제라는 글을 한번 더 입력하여 기능이 실행 되도록 하였습니다. <br>
> 글자가 불일치 할 경우 삭제가 되지 않습니다. <br>
> 영화 상세 조회에서 등록된 내용을 확인 가능하며, 아래의 수정 버튼을 통해 내용 수정이 가능합니다. <br>

#### 1-3. 영화 카테고리 관리
> 현재 등록된 장르를 확인 할 수 있으며 해당 장르는 영화 등록, 메인페이지의 카테고리에도 적용이 됩니다. <br>
> 추가 버튼을 통해 장르 추가가 가능하며 체크박스로 체크 후 수정 및 삭제가 가능합니다. <br>

#### 1-4. 인물관리
> 인물을 이름으로 검색이 가능하며 최신 등록된 순서대로 인물이 보여집니다. <br>
> 신규등록 버튼을 통하여 인물 추가 페이지로 이동이 가능합니다. <br>
> 배우, 감독 필터로 조회가 가능합니다. <br>
> 수정 버튼 클릭 시 모달창으로 등록된 인물 정보를 불러와서 내용을 수정 할 수 있습니다. <br>
> 삭제 버튼의 기능은 앞의 기능과 동일합니다. <br>

### 2. [ 관지라_커뮤니티 ]
#### 2-1. 공지사항
> 등록되어있는 공지사항 목록을 10개씩 조회가 가능합니다. <br>
> 신규등록 버튼을 통해서 공지사항 작성 페이지로 이동이 가능합니다. <br>
> 신규등록에서는 제목, 공지내용 첨부파일 등 입력이 가능하며 구분을 통해서 일반인지, 이벤트인지 select option을 주었으며 하단에는 상단 고정 체크박스를 두어 체크 시 사용자 페이지에서 상단에 고정될 수 있도록 구현하였습니다. <br>
> 공지사항 수정과 삭제는 인물관리와 유사하게 모달창으로 구현하였습니다. <br>

#### 2-2. 블라인드 게시글 관리
#### 2-3. 신고된 게시글 관리
#### 2-4. 신고된 댓글 관리


***
####  GIF



### ❔ Retrospect
- 기능	<br>
> ▷ 
> ▷
      
- 협업에서 부족한 부분		<br>
> ▷ 
> ▷ 




