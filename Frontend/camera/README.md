# Smart Factory-Camera Application 개발 프로젝트

<img src="https://img.shields.io/badge/Flutter-blue?style=for-the-badge&logo=flutter&logoColor=white">
<img src="https://img.shields.io/badge/dart-blue?style=for-the-badge&logo=dart&logoColor=white">

Flutter를 이용하여 철강 표면 사진을 촬영하고 검출 모델로 전송 및 DB에 저장을 수행하는 Application 개발

<br>

## 요약

> 1. 휴대폰의 내장 카메라를 이용하여 철강 표면 이미지를 촬영
> 2. 팀원이 작성한 REST API를 호출하여 Detection이 완료된 이미지 다운로드
> 3. DBMS에 데이터를 업로드

<br>

## 목차 (이동)

[1. Application 소개](#1-application-소개)

[2. Why Flutter?](#2-왜-flutter를-사용하였는가)

[3. App 사용 방법](#3-사용-방법)

[4. Contributor & 참고 자료](#4-contributor-및-참고-자료)

[5. License](#5-license)

[6. Dependency](#6-dependency)

<br>

## 1. Application 소개

본 Application 은 'Smart Factory Project'의 **시연을 위해 제작된 촬영용 Application** 입니다.
 
아래 기능을 제공합니다.

1. 내장 카메라를 이용하여 철강 표면 이미지를 촬영 
2. 검출 확인  
3. DB에 업로드

### 폴더 구조

```bash
lib
│  firebase_options.dart(ignore)
│  main.dart
│  my_app.dart
│
├─constants: __const 값__
│      color_constant.dart
│      res.dart
│      storage_constants.dart(ignore)
│
├─manager: __카테고리별 메소드__
│      camera_manager.dart
│      image_manager.dart
│
├─model: __HTTP DTO(Data Transfer Obejct)__
│      detection_image_model.dart
│      mysql_request_model.dart
│      mysql_response_model.dart
│
├─resources: __중요 기능 메소드__
│      firestore_method.dart
│      http_method.dart
│      storage_method.dart
│
├─screens: __유저에게 보이는 화면__
│      input_name_screen.dart
│      take_photo_screen.dart
│
└─setting: __부가 기능들__
        show_loading_bar.dart
        show_snack_bar.dart
        show_text_dialog.dart
```

<br>

## 2. 왜 Flutter를 사용하였는가?

1. Flutter에서 내장 카메라로 접근하여 촬영할 수 있는 기능을 제공한다.
2. 이를 통해 삼성 기본 카메라에서 제공하는 스캔 및 편집 기능을 사용하고자 하였다.
3. 촬영을 위한 임베디드 시스템 개발에 익숙한 팀원이 없었다.


> 하지만 아쉽게도 사용하고자 했던 삼성 카메라의 스캔 및 편집 기능은 **다른 어플을 통해 카메라로 접근하는 경우 사용할 수 없었다.**
> 
> 이는 프로젝트 개발 중반에 발견되었고 **편집 기능을 제공하는 라이브러리**를 사용하여 이 문제를 **해결**하였다.

<br>

## 3. 사용 방법


### 시연 영상

![촬영 작동 1](https://github.com/pnucse-capstone/capstone-2023-1-02/assets/38900003/50a9d5a9-b219-4995-940f-19c0660757ae)


### 사용 방법

1. 사용자의 이름을 입력한다.
2. 이름 입력 버튼을 누른다.
3. 철강 표면 이미지를 촬영한다.
4. 검출이 올바르게 될 수 있도록 편집한다.
5. 전송한다.
6. Detection이 완료된 이미지를 확인한다.
7. 이미지 창에서 벗어난다.
8. 전송이 완료되었음을 확인한다.


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

1. [pub.dev - Camera Library](https://pub.dev/packages/camera)
2. [pub.dev - Image Cropper](https://pub.dev/packages/image_cropper)
3. [pub.dev - imagePicker](https://pub.dev/packages/image_picker)
4. [pub.dev - HTTP](https://pub.dev/packages/http)
5. [pub.dev - firebaseCore](https://pub.dev/packages/firebase_core/example)
6. [pub.dev - firestore](https://pub.dev/packages/cloud_firestore/example)
7. [pub.dev - firebaseStorage](https://pub.dev/packages/firebase_storage)
8. [pub.dev - cloudFirestore](https://pub.dev/packages/cloud_firestore)
9. [pub.dev - firebaseAppInstallation](https://pub.dev/packages/firebase_app_installations)

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

## 6. Dependency

#### pubspec.yaml
```dart
# 필수 라이브러리 

dependencies:
  flutter:
    sdk: flutter
  ...
  camera: ^0.10.5+5
  image_picker: ^1.0.4
  image_cropper: ^4.0.1
  firebase_storage: ^11.3.1
  cloud_firestore: ^4.11.0
  firebase_core: ^2.19.0
  firebase_app_installations: ^0.2.4+1
  ...
```

#### AndroidManifest.xml
```
# 위치: Android/app/src/main/AndroidManifest.xml
# 카메라, 인터넷 접근 허용

<manifest
    <uses-permission android:name="android.permission.CAMERA"/>
    <uses-permission android:name="android.permission.INTERNET"/>
    ...
/manifest>    
```

#### build.gradle
```
# 위치: Android/app/src/build.gradle
# 카메라에 접근하려면 버전이 21 이상이여야함

android {
    ...
    defaultConfig {
        ...
        minSdkVersion 30     # <- 21 이상으로 설정
        targetSdkVersion 30  # <- 21 이상으로 설정
        ...
    }
    ...
```