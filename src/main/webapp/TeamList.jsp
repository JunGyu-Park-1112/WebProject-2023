<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <title>TeamList</title>
    <link rel="stylesheet" href="./assest/css/style.css" />
    <script src="./jquery.js"></script>
  </head>
<body>
    <div class="main">
      <div class="imgColumn">
        <img class="logoImg" src="img/logo.jpg" />
        <div class="gradient"></div>
      </div>
      <div class="firstColumn">
        <div class="TL_title">
          <i class="fa-solid fa-layer-group"> 팀 구성 현황</i>
        </div>
        <form action="" class="TL_checkbox_Form">
          완성된 팀 제외<input type="checkbox" class="TL_checkbox" />
        </form>
        <form class="TL_SearchTeam" method="get" action="">
          <input
            class="RoundInput"
            type="text"
            name="team_name"
            value=""
            placeholder="팀명을 입력해주세요..."
          />
          <button>
            <i class="fa-solid fa-magnifying-glass fa-lg"></i>
          </button>
        </form>

        <div class="TL_list_box">
          <div class="TL_list">
            <div class="TL_list_status">
              <div class="TL_list_number">1조</div>
              <div class="TL_list_Leader">조장 : 박준규</div>
              <div class="TL_list_extra">여분 : 1/2</div>
            </div>
            <hr color="grey" width="100%" />
            <div class="TL_list_content">comment...</div>
          </div>
          <div class="TL_list">
            <div class="TL_list_status">
              <div class="TL_list_number">2조</div>
              <div class="TL_list_Leader">조장 : 이태환</div>
              <div class="TL_list_extra">여분 : 1/2</div>
            </div>
            <hr color="grey" width="100%" />
            <div class="TL_list_content"></div>
          </div>
          <div class="TL_list">
            <div class="TL_list_status">
              <div class="TL_list_number">3조</div>
              <div class="TL_list_Leader">조장 : 진명훈</div>
              <div class="TL_list_extra">여분 : 1/2</div>
            </div>
            <hr color="grey" width="100%" />
            <div class="TL_list_content"></div>
          </div>
          <div class="TL_list">
            <div class="TL_list_status">
              <div class="TL_list_number">4조</div>
              <div class="TL_list_Leader">조장 : 000</div>
              <div class="TL_list_extra">여분 : 1/2</div>
            </div>
            <hr color="grey" width="100%" />
            <div class="TL_list_content"></div>
          </div>
          <div class="TL_list">
            <div class="TL_list_status">
              <div class="TL_list_number">5조</div>
              <div class="TL_list_Leader">조장 : 000</div>
              <div class="TL_list_extra">여분 : 1/2</div>
            </div>
            <hr color="grey" width="100%" />
            <div class="TL_list_content"></div>
          </div>
          <div class="TL_list">
            <div class="TL_list_status">
              <div class="TL_list_number">6조</div>
              <div class="TL_list_Leader">조장 : 000</div>
              <div class="TL_list_extra">여분 : 1/2</div>
            </div>
            <hr color="grey" width="100%" />
            <div class="TL_list_content"></div>
          </div>
          <div class="TL_list">
            <div class="TL_list_status">
              <div class="TL_list_number">7조</div>
              <div class="TL_list_Leader">조장 : 000</div>
              <div class="TL_list_extra">여분 : 1/2</div>
            </div>
            <hr color="grey" width="100%" />
            <div class="TL_list_content"></div>
          </div>
        </div>
      </div>
      <div class="secondColumn"></div>
    </div>
    <script src="./assest/js/mainPage.js"></script>
    <script
      src="https://kit.fontawesome.com/cacb8915e2.js"
      crossorigin="anonymous"
    ></script>
  </body>
</html>