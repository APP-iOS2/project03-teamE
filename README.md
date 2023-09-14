# Coupang Eats

쿠팡이츠 클론코딩을 통해 소비자의 주문 기능과 판매자의 기능을 구현하고, 관리자 앱은 사용자로부터의 피드백과 시스템 관리를 용이하게 함


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
- 여훈님 하셨던거 찾아서 넣기
