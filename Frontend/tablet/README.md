# Smart Factory - Tablet Application 개발 프로젝트

Tablet 등 대형 디바이스를 이용하여 사용자가 결함 이미지 데이터를 관리 및 비교하는 것을 도와주는 Application 개발 프로젝트 입니다.

<br>

## 요약

> 1. Flutter 를 이용하여 Application 제작
> 2. JPA 를 통한 Mysql DB 와의 데이터 조회
> 3. 시연 영상

<br>

## 목차 (이동)

[1. Application 소개](#1-application-소개)

[2. Why Flutter](#2-왜-flutter를-사용하였는가)

[3. 사용 방법](#3-사용-방법)

[4. Contributor & 참고 자료](#4-contributor-및-참고-자료)

[5. License](#5-license)

<br>

## 1. Application 소개

본 Application 은 'Smart Factory Project' 에서 사용자가 DB의 데이터의 조회와 관리를 도와주는 Application 입니다.

### 아래의 기능을 제공 합니다.
1. 원하는 기간, 결함 유무, 특정 Label에 따른 데이터를 조회
2. 원본 이미지와 결함 부위가 표시된 이미지를 동시에 화면에 띄움
3. 결함 부위가 표시된 이미지를 확대 가능
4. Column Graph 를 사용하여 데이터를 시각적으로 표현

### 폴더 구조
```bash
lib
│  main.dart
│
├─constants: __API 주소 및 개인정보__
│      classified.dart(ignore)
│
├─data: __const 데이터__
│      chart_setting.dart
│      data.dart
│      sliver_gride_setting_data.dart
│      theme_data.dart
│
├─models: __API 호출 형식 클래스(DTO)__
│      dash_board_image_model.dart
│      dash_board_request_model.dart
│      dash_board_response_model.dart
│      graph_bar_model.dart
│      graph_request_model.dart
│      graph_response_model.dart
│      steel_model.dart
│
├─old_screens: __초기 화면(사용 X)__
│      dashboard_screen.dart
│      data_by_date_detail_page.dart
│      data_by_date_page.dart
│      home_page.dart
│      real_time_image_page.dart
│      real_time_page.dart
│
├─resources: __주요 기능 메소드__
│      http_method.dart
│
├─routers: __화면 전환 담당__
│      main_page.dart
│
├─screens: __사용자에게 보이는 화면__
│      dashboard_mode_screen.dart
│      graph_mode_screen.dart
│      login_page.dart
│
├─setting: __특수 기능__
│      show_custom_date_picker.dart
│      show_loading_bar.dart
│      show_snack_bar.dart
│
└─widget: __Stateless Widget__
        custom_dropdown_button.dart
        steel_data_big_widget.dart
        steel_image_big_widget.dart
        steel_image_preview_widget.dart
        steel_preview_widget.dart
```

<br>

## 2. 왜 Flutter를 사용하였는가?

> Flutter는 현재 Android, IOS, Web, Embedded 등 6 개의 다른 플랫폼에서의 Front-End 기능을 하나의 프레임워크에서 모두 제공함.

1. 이는 배포시 플랫폼에 맞춰 매번 다르게 작성해야하는 문제점을 없앰.
2. 개발 기간이 누적되면서 Flutter와 관련된 라이브러리가 많아져 현재 시점에서 사용하는 것에 무리가 없을 것이라 판단함.
3. Flutter 3.0 버전 이후 각종 대기업에서도 Flutter를 활용해 Application을 제작하고 있으므로 
이 프레임워크 사용에 익숙해질 경우 취업에 유리한 위치를 선점할 수 있을 것으로 예상됨.


<br>

## 3. 사용 방법

### 시연 영상 - Dashboard Mode

### 시연 영상 - Graph Mode

<br>

## 4. Contributor 및 참고 자료

### Contributor

<table>
  <tbody>
    <tr>
      <td align="center"><a href="https://github.com/June222"><img src="https://github.com/pnucse-capstone/capstone-2023-1-02/assets/76769044/e8eba3b2-7097-42fc-bb5a-61bfc2872998" width="200px;" alt=""/><br /><sub><b>FE, BE 팀장 : 강준우</b>(github)</sub></a><br /><sub><b>jangtai4@pusan.ac.kr</b></sub></a><br /></td>
  </tbody>
</table>

### 참고 자료

1. [pub.dev - riverpod](https://pub.dev/packages/flutter_riverpod)
2. [pub.dev - syncfusion_flutter_charts](https://pub.dev/packages/syncfusion_flutter_charts)
3. [pub.dev - http](https://pub.dev/packages/http)
4. [Flutter Awesome](https://flutterawesome.com/)
5. [No Crime Application](https://github.com/June222/No-Crime-App)
6. [Matzip Application](https://github.com/June222/matzip)

<br>

## 5. License

```
MIT License
Copyright (c) <year> <copyright holders>

Permission is hereby granted, free of charge, to any person obtaining a copy
of this software and associated documentation files (the "Software"), to deal
in the Software without restriction, including without limitation the rights
to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
copies of the Software, and to permit persons to whom the Software is
furnished to do so, subject to the following conditions:

The above copyright notice and this permission notice shall be included in all
copies or substantial portions of the Software.

THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
SOFTWARE.
```
