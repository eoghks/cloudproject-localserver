# 클라우드 앱 서비스 프로젝트 (localhost버전)

내용
고객이 선택한 콘텐츠(PDF)를 서버에서 전송시켜준다.

db폴더
par1,part2,part3으로 나뉘어져있어 순서대로 실행하여 테이블 및 db 함수 생성

cloud-app-front 폴더
front 코드가 들어있는 폴더이다.

baceknd 폴더
backend 코드가 들어있는 폴더이다.
db.js : db 설정에 관련된 파일로 user, password입력이 필요하다.

PDF폴더
고객에게 전달하는 콘텐츠(PDF)가 존재한다.


실행방법(visual code 기준)
1. df폴더의 part1,2,3을 실행하여 테이블생성
2. backend의 db.js에 user, password 입력
3. visual code의 터미널을 backend폴더로 이동한다음 npm start를 이용하여 프로그램 실행
4. localhost:3000/home으로 접속
