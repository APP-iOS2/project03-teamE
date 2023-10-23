# Coupang Eats

쿠팡이츠 클론코딩을 통해 소비자의 주문 기능과 판매자의 기능을 구현하고, 관리자 앱은 사용자로부터의 피드백과 시스템 관리를 용이하게 하고
앱의 주된 특징은 앱 간의 상호작용입니다.

---
## 📚 실행 가이드 및 설치 방법(How to build)

### 설치/실행 방법
* ❗️❗️아래 1가지 파일은 필수 파일임으로 실행이 필요할 시 arpa99@naver.com을 통해 파일을 요청해주세요.
```
- GoogleService-Info.plist
```

```
파이어베이스 콘솔 세팅
- CEats 번들 ID: com.time5607.CEats
- CEats Seller 번들 ID: com.time5607.CEatSeller
- CEats Manager 번들 ID: com.time5607.CEatsManager
```

## 🔎Detail
| 주소 설정<br>(소비자앱) | 주문하기<br>(소비자앱) | 주문확인<br>(소비자앱) |
|:--:|:--:|:--:|
|![CEats_SettingAddress](https://github.com/isakatty/TIL/assets/133845468/459505fa-ed83-409e-a9a6-3678add84586)|![CEats_Ordering](https://github.com/isakatty/TIL/assets/133845468/d555db8f-246b-444c-9a12-bb41f4b5dde4)|![CEats_DeliveringAccept](https://github.com/isakatty/TIL/assets/133845468/7e3be8ac-2e02-499f-b456-3732410c7ecb)|

| 주문수락<br>(판매자앱) | 리뷰삭제<br>(관리자앱)|
|:--:|:--:|
|![CEats_Seller_Accepting](https://github.com/isakatty/TIL/assets/133845468/d22583a0-bf03-4250-ab46-05228a9c0517)|![CEats_Manager](https://github.com/isakatty/TIL/assets/133845468/eb13829d-a340-44b8-a1f8-3242a4aa54b0)|
## 활용기술

#### Platforms
<img src="https://img.shields.io/badge/iOS-5A29E4?style=flat&logo=iOS&logoColor=white"/>  
    
#### Language & Tools
<img src="https://img.shields.io/badge/Xcode-147EFB?style=flat&logo=Xcode&logoColor=white"/> <img src="https://img.shields.io/badge/SwiftUI-2396F3?style=flat&logo=Swift&logoColor=white"/> <img src="https://img.shields.io/badge/Swift-F05138?style=flat&logo=swift&logoColor=white"/> <img src="https://img.shields.io/badge/Firebase-FFCA28?style=flat&logo=Firebase&logoColor=white"/> <img src="https://img.shields.io/badge/Figma-F24E1E?style=flat&logo=Figma&logoColor=white"/>

<br>

## 👥 Team Members
|**박범수**|**김건섭**|**변상우**|**봉주헌**|**유하은**|**장여훈**|**함지수**|
|:--:|:--:|:--:|:--:|:--:|:--:|:--:|
|[@Time5607](https://github.com/Time5607)|[@gnksbm](https://github.com/gnksbm)|[@boogios](https://github.com/boogios)|[@Bongjooheon](https://github.com/Bongjooheon)|[@yuhaeun-la](https://github.com/yuhaeun-la)|[@jangyeohoon](https://github.com/jangyeohoon)|[@isakatty](https://github.com/isakatty)|

## Git 컨벤션
```
- [Feat] 새로운 기능 구현
- [Add] Feat 이외의 부수적인 코드 추가, 라이브러리 추가, 애셋(사진, 컬러) 추가
- [Create] 새로운 파일 생성
- [Design] UI 수정사항
- [Fix] 코드 수정, 내부 파일 수정, 주석
- [Handle] 버그, 오류 해결
- [Delete] 쓸모없는 코드 삭제
- [Move] 파일 이름/위치 변경 
- [Update] 버전 업데이트
```


## 폴더 컨벤션

```
📦 CoupangEats_Customer [소비자용앱]
│
+ 🗂 Sources
|
+------🗂 FireBase
|
+------🗂 Extension
|
+------🗂 ViewModel
|
+------🗂 Models
│
+------🗂 Views
        |
        +------🗂 Home
                │
                +------🗂 Map
                │
                +------🗂 Restaurant
                │
                +------🗂 HomeSub
                        │
                        +------🗂 Search
                
                +------🗂 FoodStore

        +------🗂 MyPage
 
        +------🗂 OrderedList
 
        +------🗂 Favorite
```
```
📦 CoupangEats_Seller [판매자용앱]
│
+ 🗂 Sources
|
+------🗂 Extension
|
+------🗂 FireBase
|
+------🗂 ViewModel
|
+------🗂 Models
│
+------🗂 Views
        |
        +------🗂 Home
                │
                +------🗂 ManagingMenu
                │
                +------🗂 ManagingReview
                │
                +------🗂 BusinessHour
                │
                +------🗂 Preview

        +------🗂 Order
 
        +------🗂 Work
 
        +------🗂 Favorite

```
```
📦 CoupangEats_Manager [관리자용앱]
│
+ 🗂 Sources
|
+------🗂 Extension
|
+------🗂 FireBase
|
+------🗂 ViewModel
|
+------🗂 Models
│
+------🗂 Views
```
## Libraries
- [Firebase](https://github.com/firebase/firebase-ios-sdk/blob/master/LICENSE)
- [ScalingHeaderScrollView](https://github.com/exyte/ScalingHeaderScrollView)

