# 35-SOPKATHON-iOS-A3A3
35기 AND SOPT 솝커톤 iOS 3팀 아삼아삼~

# 🍺 SoJu
SoJu는 술자리에서 자신의 주량에 맞게 음주를 할 수 있도록 취기를 확인하며, 자연스럽게 자리에서 빠져나갈 핑계를 제공해 음주 후 다음날에도 현실적이고 계획적인 삶을 유지할 수 있도록 돕는 서비스입니다.

# 🍺 Team SoJu - iOS

<div align=center>
  
<img width="200px" src="https://github.com/Johyerin.png"/> | <img width="200px" src="https://github.com/0gonge.png"/> | <img width="200px" src="https://github.com/ChoiAnYong.png"/> | <img width="200px" src = "https://github.com/yurim830.png"/> | 
|:-----:|:-----:|:-----:|:-----:|
|[조혜린](https://github.com/Johyerin)|[송여경](https://github.com/0gonge)|[최안용](https://github.com/ChoiAnYong)|[김유림](https://github.com/yurim830)
| `스플래쉬, 주량입력` | `성공화면, 실패화면` | `퀴즈 페이지` |  `메인 페이지` |

</div>
<br>

# 아삼아삼 파이팅 🤪

# 🍺 Branch Strategy 

1. 작업할 내용에 대해 이슈를 판다.
2. 내 로컬에서 develop 브랜치가 최신화 되어있는지 확인한다. (develop 브랜치는 항상 pull을 받아 최신화를 시키자)
3. develop 브랜치로부터 새 브랜치를 만든다. 
``` 브랜치 이름: 커밋유형/이슈번호(ex: feat/#3) ```
4. 만든 브랜치에서 작업을 한다 - 절대로 develop 브랜치에서 작업하지 않는다.
5.  커밋 메시지 컨벤션 ```  [Prefix] #이슈번호 - 작업 내용 ```
6.  작업할 내용을 다 끝내면 ⭐️에러가 없는지 잘 돌아가는지 확인⭐️한 후 push한다. (꼭 푸시, PR 날리기 전에 잘 돌아가는지 확인해주기!)
7.  PR 올리기 전 작업한 브랜치에 develop 브랜치 pull 받은 뒤 깃 크라켄을 통해 충돌 해결 후(충돌 없다면 넘어가도 OK입니다) 올리는 것을 권장
8.  PR을 작성한 후, 리뷰나 수정사항을 반영해준 뒤 develop에 merge한다.

# 🍺 Commit Message
``` 
[Feat] : 새로운 기능 구현
[Fix] : 버그, 오류 해결
[Chore] : 코드 수정, 내부 파일 수정, 애매한 것들이나 잡일은 이걸로! [Add] : 라이브러리 추가, 에셋 추가 [Del] : 쓸모없는 코드 삭제 [Docs] : README나 WIKI 등의 문서 개정
[Refactor] : 전면 수정이 있을 때 사용합니다.
[Setting] : 프로젝트 설정관련이 있을 때 사용합니다.
[Merge] : Pull Develop
```

## 🍺 Library

| Plugin | README |
| ------ | ------ |
| KingFisher | [https://github.com/onevcat/Kingfisher.git][PlGd] |
| Moya | [https://github.com/Moya/Moya.git][PlOd] |
| SnapKit | [https://github.com/SnapKit/SnapKit.git][PlDb] |
| Then | [https://github.com/devxoul/Then.git][PlGh] |

# 🍺 Foldering
```
📁 Project
├── 📁 Application
│   ├── AppDelegate
│   ├── SceneDelegate
├── 📁 Global
│   ├── 🗂️ Extensions
│   ├── 🗂️ Literals
│   ├── 🗂️ Resources
│   ├── 🗂️ Supporting Files
├── 📁 Network/Base
├── 📁 Presentation
│   ├── 🗂️ Splash
│   ├── 🗂️ Onboarding
│   ├── 🗂️ Main
│   ├── 🗂️ Quiz
│   ├── 🗂️ Result

```

# 🤪 Before..
![IMG_2542](https://github.com/user-attachments/assets/5c8b7c33-bcc7-40ce-a889-8a837a23cbc2)
![IMG_2550](https://github.com/user-attachments/assets/c4b499aa-9e6a-443e-99f4-e4c09183f242)


#  🍺 Rules
- pr 올리면 올렸다고 크게 꼭 말해주기
- 어그로 금지 놀라지ㅣ않기.. 놀래키지 않기..
- 어? 금지
- approve 1명 이상 승인받기

