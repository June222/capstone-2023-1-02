## 1. 프로젝트 소개
# _Steel See_
💡 _Steel See_ 는 철강 이미지에서 불량 부분을 검출하는 서비스 입니다.<br>
💡 자체적으로 개발한 불량 검출 인공지능 모델을 사용하여 앱 서비스 형태로 배포하였습니다.<br>

<br> 

## 2. 팀 소개
|강준우|김태경|여지수|
|:---|:------|:------|
|<img width="200" alt="스크린샷 2023-10-24 오후 2 28 02" src="https://github.com/pnucse-capstone/capstone-2023-1-02/assets/76769044/e8eba3b2-7097-42fc-bb5a-61bfc2872998">|<img width="200" alt="스크린샷 2023-10-24 오후 2 26 32" src="https://github.com/pnucse-capstone/capstone-2023-1-02/assets/76769044/ffdb114c-06e0-45fb-8fe6-9a3f06ee19d0"/>|<img width="200" alt="스크린샷 2023-10-24 오후 2 30 54" src="https://github.com/pnucse-capstone/capstone-2023-1-02/assets/76769044/0cf44abf-47ae-415f-a02b-a3507e564035">|
|• 촬영용 어플리케이션 제작(Flutter)<br>• 테블릿용 어플리케이션 제작(Flutter) <br>• DBMS(mysql) 서버 구축<br>• DB 연동 Rest API(Spring JPA) 개발| • 데이터 분석 및 전처리<br>• 이미지 증강 모델(DCGAN, PGGAN) 연구<br>• 이미지 세그멘테이션 모델(U-Net) 연구<br>• 모델 학습을 위한 쿠버네티스 도커 환경 연구<br>• DBMS(mysql) 서버 구축 <br>• DB 연동 Rest API(Spring JPA) 개발|• 데이터 분석 및 전처리<br>• 이미지 분류 모델(CNN, ResNet, EfficientNet) 연구<br>• 이미지 세그멘테이션 모델(U-Net) 연구<br>• 이미지 증강 모델 (DCGAN) 연구<br>• 모델 서빙 Rest API(Flask) 개발<br>• figma를 활용하여 UI 및 UX 디자인<br>• 아이패드용 어플리케이션 제작(Flutter)|
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




## 4. 동작 과정

### 1) 소개

> App을 사용하는 User가 사용하기 편리한 App, 데이터를 관찰 및 관리하기 쉬운 App을 목표로 진행하였습니다.

<br>

### 1.1) 역할

- 촬영용
  - 표면 이미지의 촬영
  - 실시간 확인
  - 데이터 베이스로 전송
- 태블릿용
  - 데이터베이스로부터 load
  - 그래프 모드 

<br>

### 2) 동작 영상

- #### 촬영용 App

![촬영 작동 1](https://github.com/pnucse-capstone/capstone-2023-1-02/assets/38900003/50a9d5a9-b219-4995-940f-19c0660757ae)

<br>

- #### 태블릿 App
  
![작동 리드미 영상](https://github.com/pnucse-capstone/capstone-2023-1-02/assets/38900003/813c7099-fd52-49a1-9464-e0a1de18b792)

<br> 


![그래프 모드 작동](https://github.com/pnucse-capstone/capstone-2023-1-02/assets/38900003/104cf387-dede-489e-bb4a-b0169a3270d1)

- #### 아이패드 App

![stylegan2](https://github.com/pnucse-capstone/capstone-2023-1-02/assets/76769044/3b4ed375-9044-46f4-ad2e-78410632df21)
![철강이미지](https://github.com/pnucse-capstone/capstone-2023-1-02/assets/76769044/3d7006ab-ec1c-495f-9d5e-35580a1dc5f2)

## 5. 사용법
사용법

- 촬영용 App

1. 사용자의 이름을 입력한다. (파일이름으로 저장됨 => 추후에 누가 관리하고 있는 시점이였는가를 확인)
2. 입력 버튼을 누른다.
3. 미리보기 화면으로 사진 위치를 잘 확인한 다음 촬영 버튼을 누른다.
4. 편집을 한다.
5. 다시 편집이 필요한 경우 편집 버튼을 누른다.
6. 전송 버튼을 누른 뒤 기다린다.

- 태블릿 App

> 대쉬보드 모드

1. 조회하고 싶은 날짜를 달력 모양 아이콘을 눌러 설정한다.
2. 결함 유무 및 Label 2개의 조회 필터를 설정한다.
3. 조회 버튼을 누른다.
4. 원하는 이미지를 클릭한다.
5. 오른쪽에서 확대하여 자세히 본다.

> 그래프 모드

1. 대쉬보드 모드에서 우측 상단 그래프 모드 버튼을 눌러 화면을 전환한다.
2. 조회하고 싶은 날짜를 달력 모양 아이콘을 눌러 설정한다.
3. 막대를 눌러 날짜별 결함의 수만을 비교해 본다.


- 아이패드 App
> tech week 시연 때 연구에 대한 이해를 돕기 위해 제작한 앱이다.
1. 결함 이미지 생성 모델을 통해 생성된 진짜 이미지와 가짜 이미지를 확인한다.
2. 데이터 전처리와 결함 분류 모델의 흐름을 확인한다.
3. 스크롤하여 나오는 철강 이미지들을 촬영용 App으로 찍어서 결과를 태블릿 App으로 확인한다.

https://www.youtube.com/watch?v=neZY_eSCWkQ&t=45s


## 6. 시연 소개 영상 

[![Video Label](https://user-images.githubusercontent.com/76769044/280241586-c29d795f-caa5-4af7-b6ef-e2f0e92deb86.png)](https://youtu.be/neZY_eSCWkQ&t=45s)
