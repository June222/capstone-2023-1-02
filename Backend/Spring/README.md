# SpringBoot DB(AWS) JPA

<img src="https://img.shields.io/badge/Spring-yellow?style=for-the-badge&logo=spring&logoColor=white">
<img src="https://img.shields.io/badge/SpringBoot-yellow?style=for-the-badge&logo=springboot&logoColor=white">
<img src="https://img.shields.io/badge/JAVA-black?style=for-the-badge&logo=java&logoColor=white">

aws mysql DB와 연동하여 Image 데이터들을 관리하는 API <br>


## 요약

프로젝트를 진행하며 아래 내용 등을 깨달을 수 있는 좋은 기회가 되었다.

> 1. 서버 측에서 데이터를 관리하는 방법
> 2. 서버 측과의 커뮤니케이션 능력의 중요성
> 3. API 생성 및 호출 시에 주의할 점

## 목차 (이동)

[1. 프로젝트 설명](#1-프로젝트-설명)

[2. 스프링을 쓴 이유](#2-spring을-왜-사용하였는가)

[3. 사용 방법](#3-사용-방법-배포-예정)

[4. 팀원 소개 및 참고 자료](#4-팀원-및-참고-자료)

[5. 라이센스](#5-라이센스)
<br>

## 1. 프로젝트 설명


![JPA 구조도](https://img1.daumcdn.net/thumb/R1280x0/?scode=mtistory2&fname=https%3A%2F%2Fblog.kakaocdn.net%2Fdn%2FrnHpB%2Fbtq0XQbWnhR%2FGR7kMPOkxGEuuw2qzrkcK0%2Fimg.png)

<center>출처: https://ultrakain.gitbooks.io/jpa/content/chapter1/chapter1.3.html</center>

<br>

> 반복적인 CRUD SQL을 작성하고 객체를 SQL에 매핑하는데 이미 많은 자바 개발자들이 오랫동안 비슷한 고민을 해왔고 문제를 해결하려고 많은 노력을 기울여왔다. 그리고 그 노력의 결정체가 바로 JPA다.
> 
> 귀찮은 문제들은 이제 JPA에게 맡기고 더 좋은 객체 모델링과 더 많은 테스트를 작성하는데 우리의 시간을 보내자.
>
> 개발자는 SQL Mapper가 아니다.

*<div style="text-align:right"> -출처: 자바 ORM 표준 JPA 프로그래밍 / 저자: 김영한 - </div>* <br>

## 2. Spring을 왜 사용하였는가?


- 배포되는 것을 가정할 때, 유지보수 측면에서 엄청난 이점을 지닌다. 구체적으로 select문을 변경하거나 기능을 추가하는 경우 Application Interface는 변경하지 않고, JPA 측 코드 변경만으로 기능을 추가 및 변경할 수 있다.


> 촬영용 device에서 mysql에 **데이터를 저장**하고, 
> 
> 태블릿 device에서 **데이터를 조회**하는 것 **모두 jpa를 통해 진행**이 된다. <br>

<br>

## 3. 사용 방법 (배포 예정)


## 중요 - json 데이터 형식
- dateTime의 형식은 "YYYY-MM-DD hh:mm:ss" 이다. 
- status: 데이터는 {"ALL","DEFECT","NORMAL"}이 있다. 
- label: 데이터는 {"ALL","A","B","C","D"}가 있다. 
- Response 데이터의 url은 다운로드 가능한 url이 저장되어 있다.

## 방법

1. localDateTimeStart 는 원하는 조회 시작 날짜를 넣는다.
2. localDateTimeEnd 는 원하는 조회 종료 날짜를 넣는다. 
3. status 는 데이터의 결함 유무를 넣는다.
4. label 은 결함 데이터의 label을 넣는다.

<br>

### POST Request DTO 대표 예시

```json
{
  "localDateTimeStart":"2023-10-25 00:00:00",
  "localDateTimeEnd":"2023-10-25 23:59:59",
  "status": "NORMAL",
  "label": "B"
}
```

### POST Response DTO 대표 예시

```json
{
    "code": 1,
    "msg": "성공 했습니다.",
    "data": [
        {
            "fileName": "f2",
            "originImgUrl": "origin_img_url",
            "detectedImgUrl": "detected_img_url",
            "labelList": [2],
            "date": "2023-10-25",
            "second": "00:00:00"
        },
        {
            "fileName": "f7",
            "originImgUrl": "origin_img_url",
            "detectedImgUrl": "detected_img_url",
            "labelList": [2,3],
            "date": "2023-10-28",
            "second": "00:00:00"
        }
    ]
}
```

<br>

## 4. 팀원 및 참고 자료


### 기여한 팀원

<table>
  <tbody>
    <tr>
      <td align="center"><a href="https://github.com/June222"><img src="https://github.com/pnucse-capstone/capstone-2023-1-02/assets/76769044/e8eba3b2-7097-42fc-bb5a-61bfc2872998" width="200px;" alt=""/><br /><sub><b>BE 팀장 : 강준우</b></sub></a><br /><sub><b>jangtai4@pusan.ac.kr</b></sub></a><br /></td>
      <td align="center"><a href="https://github.com/Tigerfriend1"><img src="https://github.com/pnucse-capstone/capstone-2023-1-02/assets/76769044/ffdb114c-06e0-45fb-8fe6-9a3f06ee19d0" width="200px;" alt=""/><br /><sub><b>BE 팀원 : 김태경</b></sub></a><br /><sub><b>kimtg1997@pusan.ac.kr</b></sub></td>
  </tbody>
</table>

### 참고 자료

<a href="https://cse.pusan.ac.kr/cse/14651/subview.do?enc=Zm5jdDF8QEB8JTJGYmJzJTJGY3NlJTJGMjYwNSUyRjEyMTgyOTIlMkZhcnRjbFZpZXcuZG8lM0Y%3D">부산대 백엔드 미니 부트캠프(Mini-Bootcamp) <br>

https://github.com/codingspecialist/junit-bank-class

<br>

## 5. 라이센스


MIT License
