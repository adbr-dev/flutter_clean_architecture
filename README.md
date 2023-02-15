# flutter_clean_architecture

clean architecture를 따라 프로젝트를 생성합니다.

Refactoring -> Design Pattern -> Clean Architecture 순으로 학습하고 개선되길 바라며, 부족한 점이 있다면 언제든 PR 또는 코멘트로 알려주세요 🙇🏻‍♀️

</br></br>

### 기능별 설명

| Action | Plugin | Description |
| :---         |     :---:      |          ---: |
| call API   | `http` | data 레이어 안 sources 부분에서 ApiClient를 따로 만들어 관리합니다.  |
| debounce   | `easy_debounce`     | 검색창에 onChanged로 할 경우 짧은 시간 내 많은 호출이 일어날 수 있으니, 해당 플러그인을 사용하여 1초간 검색 타이핑이 멈출 경우 함수가 호출 되도록 했습니다.
| state management   |  -  | 기본 foundation에 내장 된 [ChangeNotifier](https://api.flutter.dev/flutter/foundation/ChangeNotifier-class.html)를 사용합니다.

</br></br>

### 특징
- Clean architecture 3가지 레이어로 나누어 바라봅니다.  
`Data` - `Domain` - `App(Presentation)`
  - `Data`: Repositories, source(call API) [데이터 처리]
  - `Domain`: Repositories(interface), usecases, entities [비지니스 로직 (캡슐화)]
  - `Presentation`: pages, state(model) ←→ presenter(controller)
  
  </br>

  > 폴더 구조
  >  ```
  >  /data
  >      /models
  >      /repositories
  >      /sources
  >  /domain
  >      /repositories
  >      /usecases
  >  /presentation
  >      /features
  >      /utils
  >  main.dart
  >  ```

<br>

- **Presentation** 개인 규칙

  > **💡중요:** 화면에 대한 변경점은 화면 내에서 처리하고  
  비지니스 로직 처리가 필요한 경우 컨틀롤러에서 수행될 수 있도록  
  로직 분리를 원칙으로 합니다.
  > - `부모 -> 자식`에게 값을 전달
  > -  `자식 -> 부모`에게 이벤트를 전달  

  - `~Page`: 전체 화면
  
  - `~Screen`: 화면 중 일부

<br>

- **Domain Layer** 역할
  - Data와 Presentation 레이어에 반해 optional한 요소
  - 복잡한 처리 또는 재사용성을 선호하는 경우 도메인 레이어 사용
  - 이점: `코드 중복 방지`, `테스트 용이`, `책임 분할`
  - 중점: 변경 가능한 데이터를 포함 하지 않고, 하나의 기능만 담당하도록 합니다.
  - UseCase 명명 규칙
    
    : 현재 시제의 동사 + 명사/대상(선택사항) + UseCase.
    
    (e.g. FormatDateUseCase, LogOutUserUseCase, GetLatestNewsWithAuthorsUseCase, MakeLoginRequestUseCase)  


- useCase의 비지니스 로직 vs 프리젠터의 로직
  - Q. 비개발팀의 팀원분들도 알아야 하는 로직인가? 
  - A. 알아야 하는 로직이라면, 비지니스 로직으로 담자  
  (비지니스 로직 = 앱 업무 요구사항을 담는 것)  