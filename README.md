# 🛒 쇼핑물회원관리

### 쇼핑몰 회원관리를 JSP를 사용하여 만들었습니다.
> 정리한 노션 : <a href="https://dlclfh.notion.site/Web-40fe683275c049688396404c35041937?pvs=4">Notion</a>

Oracle DB를 연동한 웹프로그래밍

<게시물 제작 순서>
1. 프로젝트 준비 - 환경세팅
(encoding - UTF-8)(톰캣연결)(Oracle 연결)(ojdbc6.jar import)
1. Dynamic Web Project 생성(톰캣연결 확인)
2. layout(header, nav, footer, db_connect) 파일과 css(style) 파일을 만든다.
3. header, nav, footer를 만든후 index.jsp를 만든 후
4. join.jsp를 만들고 가입을 하기위해 join_p.jsp를 만듭니다.
5. 그 후 회원 목록을 조회하는 member_list.jsp를 만들고
6. 만든 후에 수정할 부분을 update.jsp폼을 이용하여 만들고 실제 업데이트 부분은 update_p.jsp를 사용하여 수정합니다.
7. 삭제를 하기위한 delete.jsp를 만들고
8. 회원매출 조회를 위해 sales_list.jsp를 만들고 회원 정보조회를 위하여 z_input.jsp를 만든 후 회원 정보가 있으면 화면에 보여주는
z_inquiry.jsp를 만듭니다.
