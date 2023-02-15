# flutter_clean_architecture

clean architecture를 따라 프로젝트를 생성합니다.

Refactoring -> Design Pattern -> Clean Architecture 순으로 학습하고 개선되길 바라며, 부족한 점이 있다면 언제든 PR 또는 코멘트로 알려주세요 🙇🏻‍♀️

### 특징
- Clean architecture 3가지 레이어로 나누어 바라봅니다. </br> `Data` - `Domain` - `App(Presentation)`
  - `Data`: Repositories, source(call API) 데이터 처리
  - `Domain`: Repositories(interface), usecases, entities 비지니스 로직
  - `Presentation`: pages, state(model) ←→ presenter(controller)
  
  </br>

  > 폴더 구조
    ```
    /data
        /models
        /repositories
        /sources
    /domain
        /repositories
        /usecases
    /presentation
        /features
        /utils
    main.dart
    ```
- Presentation 개인 규칙
  - `~Page`: 전체 화면
  - `~Screen`: 화면 중 일부