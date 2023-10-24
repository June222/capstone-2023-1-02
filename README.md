## 1. 프로젝트 소개
# _Steel See_
💡 _Steel See_ 는 철강 이미지에서 불량 부분을 검출하는 서비스 입니다.<br>
💡 자체적으로 개발한 불량 검출 인공지능 모델을 사용하여 앱 서비스 형태로 배포하였습니다.<br>

<br> 

## 2. 팀 소개
|강준우|김태경|여지수|
|:---|:---|:---|
|<img width="200" alt="스크린샷 2023-10-24 오후 2 28 02" src="https://github.com/pnucse-capstone/capstone-2023-1-02/assets/76769044/e8eba3b2-7097-42fc-bb5a-61bfc2872998">|<img width="200" alt="스크린샷 2023-10-24 오후 2 26 32" src="https://github.com/pnucse-capstone/capstone-2023-1-02/assets/76769044/ffdb114c-06e0-45fb-8fe6-9a3f06ee19d0"/>|<img width="200" alt="스크린샷 2023-10-24 오후 2 30 54" src="https://github.com/pnucse-capstone/capstone-2023-1-02/assets/76769044/0cf44abf-47ae-415f-a02b-a3507e564035">|
|• 어플리케이션 제작(Flutter) <br>• DBMS(mysql) 서버 구축<br>• DB 연동 Rest API(Spring JPA) 개발| • 데이터 분석 및 전처리<br>• 이미지 증강 모델(DCGAN, PGGAN) 연구<br>• 이미지 세그멘테이션 모델(U-Net) 연구<br>• 모델 학습을 위한 쿠버네티스 도커 환경 연구<br>• DBMS(mysql) 서버 구축 <br>• DB 연동 Rest API(Spring JPA) 개발|• 데이터 분석 및 전처리<br>• 이미지 분류 모델(CNN, ResNet, EfficientNet) 연구<br>• 이미지 세그멘테이션 모델(U-Net) 연구<br>• 이미지 증강 모델 (DCGAN) 연구<br>• 모델 서빙 Rest API(Flask) 개발<br>• figma를 활용하여 UI 및 UX 디자인|
| jangtai4@pusan.ac.kr| kimtg1997@pusan.ac.kr| duwltn1301@pusan.ac.kr|

<br> 

## 3. 구성도
<img width="800" alt="스크린샷 2023-10-24 오후 2 51 21" src="https://github.com/pnucse-capstone/capstone-2023-1-02/assets/76769044/5e275e2d-a241-40e2-a7cf-04aa63595adb">
<br><br>

#### 촬영용 App
🐥 먼저 사용자는 촬영용 app에서 철강 사진을 촬영하여 업로드합니다. <br>
🐥 해당 사진은 웹 서버에 올라간 Flask 기반 REST API로 전달됩니다. <br>
🐥 API는 학습 모델에 사용자의 사진을 넣어 예측을 한 후, 결함이 검출 및 분류된 데이터들을 DB에 저장합니다. <br>

#### 테블릿 App
🐥 사용자는 태블릿용 어플리케이션에서 자신이 업로드했던 사진을 조회합니다. <br>
🐥 이때 Spring 기반 REST API가 데이터베이스에 저장된 데이터들을 가져옵니다. <br>
🐥 해당 데이터들은 태블릿용 어플리케이션 화면상에서 보여지게 됩니다. <br>
🐥 사용자는 자신이 올린 철강 사진에 대한 결함 정보를 얻을 수 있게 됩니다.<br>

<br> 


## 4. 소개 및 시연 영상
시연영상


<br> 


## 5. 사용법
사용법
