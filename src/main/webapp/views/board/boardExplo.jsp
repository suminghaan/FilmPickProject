<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>explorationPage</title>
<style>

    #wrap, #wrap *{
    	box-sizing: border-box;
    }
    #wrap{
        border: 1px solid black;
        background-color: black;
        display: flex;
        flex-direction: column;
        width: 100%;
        max-width: 1300px;
        margin: auto;
    }
    select>option{
        color: black;
    }
    #category{
        border: 1px solid black;
        background-color: #5E5E5E;
        height: 65px;
        display: flex;
        justify-content: space-evenly;
        margin-top: 100px;
        margin-bottom: 20px;
    }
    #category select{
        margin: 12px;
    }
    #content{
        margin: auto;
        border: 1px solid black;    
        background-color: #272727;
        width: 95%;
        min-height: 800px;
    }
    #filter{
        display: flex;
        justify-content: right;
        margin-top: 5px;
        margin-right: 15px;
        margin-bottom: 20px;
    }
    .movie {
        grid-template-columns: repeat(4, minmax(0, 1fr));
    }
    .post{
        width: 95%;
        height: 95%;
        position: relative;
        display: inline-block;
    }
    .box_post{
        display: flex;
        justify-content: center;
        height: 300px;
        margin: 10px;
        overflow: hidden;
    }
    .post:hover{
        filter: brightness(1.03);
    }
    .post:hover>div{
        display: block;
    }
    .box_context{
        width: 230px;
        height: 80px;
        background-color: rgba(148, 148, 148, 0.4);
        display: none;
        position: absolute;
        top: 191px;
        padding: 5px;
        
    }
    .post_context{
        width: 210px;
        color: white;
        text-overflow: ellipsis;
        white-space: nowrap;
        overflow: hidden;
    }
    
</style>
</head>
<body>

<header>

	<%@ include file="/views/common/header.jsp" %>
	
</header>
<section>

    <div id="wrap">
        <div id="category">
            
            <select class="btn" style="background-color: whitesmoke; color: black;">
                <option value="Y">현재상영중인영화</option>
                <option value="N">개봉예정영화</option>
            </select>

            <select class="btn" style="background-color: whitesmoke; color: black;">
                <option value="Y" style="color: black;">장르별</option>
                <option value="N">SF</option>
                <option value="N">스릴러</option>
                <option value="N">로맨스</option>
                <option value="N">액션</option>
                <option value="N">판타지</option>
                <option value="N">코미디</option>
                <option value="N">에로</option>
                <option value="N">범죄</option>
                <option value="N">애니메이션</option>
                <option value="N">느와르</option>
            </select>

            <select class="btn" style="background-color: whitesmoke; color: black;">
                <option value="Y">등급별</option>
                <option value="N">전체관람가</option>
                <option value="N">12세 이상</option>
                <option value="N">15세 이상</option>
                <option value="N">청소년 관람불가</option>
            </select>

            <select class="btn" style="background-color: whitesmoke; color: black;">
                <option value="Y">연대별</option>
                <option value="N">올해개봉작</option>
                <option value="N">2020년대</option>
                <option value="N">2010년대</option>
                <option value="N">2000년대</option>
                <option value="N">1990년대</option>
                <option value="N">1980년대이전</option>
            </select>

            <select class="btn" style="background-color: whitesmoke; color: black;">
                <option value="Y">국가별</option>
                <option value="N">국내영화</option>
                <option value="N">해외영화</option>
            </select>

        </div>
        <div id="content">
            <div id="filter">
                <select class="btn btn-outline" style="color: #b4b4b4;">
                    <option value="Y">인기순</option>
                    <option value="N">최신순</option>
                    <option value="N">가나다순</option>
                    <option value="N">리뷰순</option>
                </select>
            </div>
            <div class="movie">
                <div>
                    <div class="box_post"> <!-- 이렇게 a로하지말고 하지말고 각 div로 만들어야함 그래야 순위가 바뀔거같음 -->
                        <a class="post" href=""><img class="post" src="../../resources/img/파묘.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">가나다가가나나아자차카타파하가</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div>  
                            </div>
                        </a>
                        <a class="post" href=""><img class="post" src="../../resources/img/듄2.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">듄2</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div> 
                            </div>
                        </a>
                        <a class="post" href=""><img class="post" src="../../resources/img/건국전쟁.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">건국전쟁</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div> 
                            </div>
                        </a>
                        <a class="post" href=""><img class="post" src="../../resources/img/웡카.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">웡카</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div> 
                            </div>
                        </a>
                        <a class="post" href=""><img class="post" src="../../resources/img/가여운것들.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">가여운것들</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div> 
                            </div>
                        </a>
                    </div>

                    <div class="box_post">
                        <a class="post" href=""><img class="post" src="../../resources/img/파묘.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">가나다가가나나아자차카타파하가</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div>  
                            </div>
                        </a>
                        <a class="post" href=""><img class="post" src="../../resources/img/듄2.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">듄2</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div> 
                            </div>
                        </a>
                        <a class="post" href=""><img class="post" src="../../resources/img/건국전쟁.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">건국전쟁</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div> 
                            </div>
                        </a>
                        <a class="post" href=""><img class="post" src="../../resources/img/웡카.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">웡카</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div> 
                            </div>
                        </a>
                        <a class="post" href=""><img class="post" src="../../resources/img/가여운것들.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">가여운것들</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div> 
                            </div>
                        </a>
                    </div>

                    <div class="box_post">
                        <a class="post" href=""><img class="post" src="../../resources/img/파묘.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">가나다가가나나아자차카타파하가</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div>  
                            </div>
                        </a>
                        <a class="post" href=""><img class="post" src="../../resources/img/듄2.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">듄2</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div> 
                            </div>
                        </a>
                        <a class="post" href=""><img class="post" src="../../resources/img/건국전쟁.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">건국전쟁</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div> 
                            </div>
                        </a>
                        <a class="post" href=""><img class="post" src="../../resources/img/웡카.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">웡카</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div> 
                            </div>
                        </a>
                        <a class="post" href=""><img class="post" src="../../resources/img/가여운것들.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">가여운것들</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div> 
                            </div>
                        </a>
                    </div>

                    <div class="box_post">
                        <a class="post" href=""><img class="post" src="../../resources/img/파묘.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">가나다가가나나아자차카타파하가</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div>  
                            </div>
                        </a>
                        <a class="post" href=""><img class="post" src="../../resources/img/듄2.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">듄2</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div> 
                            </div>
                        </a>
                        <a class="post" href=""><img class="post" src="../../resources/img/건국전쟁.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">건국전쟁</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div> 
                            </div>
                        </a>
                        <a class="post" href=""><img class="post" src="../../resources/img/웡카.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">웡카</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div> 
                            </div>
                        </a>
                        <a class="post" href=""><img class="post" src="../../resources/img/가여운것들.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">가여운것들</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div> 
                            </div>
                        </a>
                    </div>

                    <div class="box_post">
                        <a class="post" href=""><img class="post" src="../../resources/img/파묘.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">가나다가가나나아자차카타파하가</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div>  
                            </div>
                        </a>
                        <a class="post" href=""><img class="post" src="../../resources/img/듄2.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">듄2</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div> 
                            </div>
                        </a>
                        <a class="post" href=""><img class="post" src="../../resources/img/건국전쟁.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">건국전쟁</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div> 
                            </div>
                        </a>
                        <a class="post" href=""><img class="post" src="../../resources/img/웡카.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">웡카</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div> 
                            </div>
                        </a>
                        <a class="post" href=""><img class="post" src="../../resources/img/가여운것들.jpeg" alt="">
                            <div class="box_context">
                                <div class="post_context">가여운것들</div>
                                <div class="post_context">별점</div>
                                <div class="post_context">개봉연도,국가</div> 
                            </div>
                        </a>
                    </div>
                </div>
            </div>
        </div>
    </div>
    
</section>
<footer>
	
	<%@ include file="/views/common/footer.jsp" %>
	
</footer>

</body>
</html>