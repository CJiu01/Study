# Alert, ActionSheet 를 이용한 알림창 띄우기


> 사용자에게 알림, 경고 등을 확인 및 동의하기 위해 팝업 형태의 창을 띄운다.
iOS에서는 대표적으로 Alert, ActionSheet가 존재한다.
> 

## 1.  특성

### Alert

- 중요한 액션을 하기 전, 경고가 필요한 경우
- 사용자의 작업을 한 번 더 확인하거나 삭제 등의 작업을 수행하거나 문제 사항을 알릴 때
- 결정이 필요한 중요 정보를 표시할 경우

### ActionSheet

- 사용자가 고를 수 있는 액션 목록이 여러 개일 경우
- 새 작업 창을 열거나, 종료 여부 확인 시
- 사용자의 결정을 되돌리거나 그 동작이 중요하지 않을 경우

## 2. 구성 요소

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/b36cee42-587f-443c-aaa4-3b3868b6b245/Untitled.png)

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/fcfece14-b7b9-44e8-be7c-8c2e0603fcf6/Untitled.png)

즉, Alert와 ActionSheet는 화면에 나타나는 형식만 다를 뿐, 구성요소는 동일하다.

Action의 특성에 따라 Alert / ActionSheet 를 선택하여 사용하면 된다.

## 3. 액션 스타일 종류

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/ca6cad4f-812e-4a00-90ca-2d1bd84b0ad0/Untitled.png)

여기서 알아두어야 할 두가지가

UIAlertController 와 UIAlertAction 입니다.

UIAlertController가 현재의 view에서 present될 뷰이고, 그에 관한 action에 대한 설정이 UIAlertAction 입니다.

**UIAlertController의 주요 프로퍼티**

- var title: String?: 얼럿의 제목입니다.
- var message: String?: 얼럿에 대해 좀 더 자세히 설명하는 텍스트입니다.
- var actions: [UIAlertAction]: 사용자가 얼럿 또는 액션시트에 응답하여 실행할 수 있는 액션입니다.
- var preferredStyle: UIAlertController.Style: 얼럿 컨트롤러의 스타일입니다. 얼럿(alert)과 액션시트(actionSheet)가 있습니다.

**UIAlertAction의 주요 프로퍼티**

- var title: String?: 액션 버튼의 타이틀입니다.
- var isEnabled: Bool: 액션이 현재 사용 가능한지를 나타냅니다.
- var style: UIAlertAction.Style: 액션 버튼의 적용될 스타일입니다.