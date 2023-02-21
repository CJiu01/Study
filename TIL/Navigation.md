# Navigation
- 내비게이션 컨트롤러란
- 내비게이션 스택이란
- 내비게이션바

## 0. 내비게이션 인터페이스란?

내비게이션 인터페이스란 계층적 구조의 화면전환을 위해 사용되는 드릴 다운 인터페이스이다. 

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/3215ded8-04af-441f-b203-da25f218a7af/Untitled.png)

내비게이션 인터페이스는 내비게이션 컨트롤러를 통해 구현한다.

## 1. 내비게이션 컨트롤러

**계층적 내용을 탐색하기 위한 스택 기반 체계를 정의하는 컨테이너 뷰 컨트롤러** 이다.

Navigation stack을 사용하여 다른 뷰 컨트롤러를 관리한다. 여기서 내비게이션 스택에 담겨서 콘텐츠를 보여주게 되는 뷰 컨트롤러들을 컨텐트 뷰 컨트롤러(content view controller)라고 한다.

Navigation Controllers는 두 개의 뷰로 구성되어 화면에 표시한다. 

- 내비게이션 스택뷰에 포함된 최상위 컨텐트 뷰 컨트롤러의 콘텐츠를 나타내는 뷰
- 내비게이션 컨트롤러가 직접 관리하는 뷰(즉, 내비게이션 바 or 툴 바)

추가로 내비게이션 인터페이스의 변화에 따른 특정 액션을 동작하도록 하기 위해 내비게이션 델리게이트 객체를 사용할 수 있다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/9bd3a5b2-82ac-42ac-a981-bb0ea03185c7/Untitled.png)

---

## 2. 내비게이션 스택

내비게이션 컨트롤러가 관리하는 내비게이션 스택은 뷰 컨트롤러를 담는 배열이라고 생각하면 된다. 내비게이션 스택의 가장 하위에 위치한 루트 뷰 컨트롤러는 내비게이션 스택에서 pop되지 않는다. 내비게이션 스택의 가장 상위에 위치한 뷰 컨트롤러는 최상위 뷰 컨트롤러가 되어 화면에 보여지게 된다.

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/5f826232-80d7-44cc-b2d4-ad03685f4619/Untitled.png)

### 내비게이션 스택에서의 화면이동

push 와 pop을 통해 화면이동이 가능하다.

이때 root 뷰 컨트롤러는 내비게이션 스택에서 pop되지 않으며, 상단 내비게이션바를 통해서도 루트 뷰 컨트롤러는 팝 하는 버튼이 생성되지 않는다.

### UINavigationController Class

- 내비게이션 컨트롤러의 생성

```swift
// 매개변수로 내비게이션 스택의 가장 아래에 있는 루트 뷰 컨트롤러가 될 뷰 컨트롤러를 넘겨준다.
init(rootViewController: UIViewController)
```

- 내비게이션 스택의 뷰 컨트롤러에 대한 접근

```swift
// 내비게이션 스택에 있는 최상위 뷰 컨트롤러에 접근하기 위한 프로퍼티
var topViewController: UIViewController?

// 현재 내비게이션 인터페이스에서 보이는 뷰와 관련된 뷰 컨트롤러에 접근하기 위한 프로퍼티
var visibleViewController: UIViewController?

// 내비게이션 스택에 특정 뷰 컨트롤러에 접근하기 위한 프로퍼티(루트 뷰 컨트롤러의 인덱스는 0)
var viewController: [UIViewController]
```

- 내비게이션 스택의 push / pop

```swift
// 내비게이션 스택에 뷰 컨트롤러를 push
// push 된 뷰 컨트롤러는 최상위 뷰 컨트롤러로 화면에 표시된다.
func pushViewController(UIViewController, animated: Bool)

// 내비게이션 스택에 있는 최상위 뷰 컨트롤러 pop
// 최상위 뷰 컨트롤러 아래에 있던 뷰 컨트롤러가 화면에 표시된다.
func popViewController(animated: Bool) -> UIViewController?

// 내비게이션 스택에서 root 뷰 컨트롤러를 제외한 모든 뷰 컨트롤러 pop
// 삭제된 모든 뷰 컨트롤러의 배열이 반환
func popToRootViewController(animated: Bool) -> [UIViewController]?

// 특정 뷰 컨트롤러가 내비게이션 스택에 최상위 뷰 컨트롤러가 되기 전까지 상위에 있는 뷰 컨트롤러를 pop
func popToViewController(_ viewController: UIViewController,
        animated: Bool) -> [UIViewController]?
```

### 내비게이션 인터페이스 구성하기

```swift
func application(_ application: UIApplication, didFinishLaunchingWithOptions launchOptions: [UIApplicationLaunchOptionsKey: Any]?) -> Bool {
        // Override point for customization after application launch.
        
        // 루트 뷰 컨트롤러가 될 뷰 컨트롤러를 생성합니다.
        let rootViewController = UIViewController()
        // 위에서 생성한 뷰 컨트롤러로 내비게이션 컨트롤러를 생성합니다.
        let navigationController = UINavigationController(rootViewController: rootViewController)
        
        self.window = UIWindow(frame: UIScreen.main.bounds)
        // 윈도우의 루트 뷰 컨트롤러로 내비게이션 컨트롤러를 설정합니다.
        self.window?.rootViewController = navigationController
        self.window?.makeKeyAndVisible()
        
        return true
    }
```

---

## 3. Navigation bar

UINavigationBar 는 다음과 같이 구성되어 있다.

- Items
- backItem
- topItem

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/555e18f2-5399-40fc-88af-5e814b9e067b/Untitled.png)

Navigation bar 속성을 통해 Item의 텍스트 지정이 가능하다.

```swift
override func viewDidLoad() {
                super.viewDidLoad()
                navigationController?.navigationBar.topItem?.title = "MainView"
                navigationController?.navigationBar.topItem?.prompt = "메인화면"
                navigationController?.navigationBar.topItem?.backButtonTitle = "뒤로가기" 
    }
```

left, right의 Item 또한 지정이 가능하다

```swift
let leftBarButton = UIBarButtonItem.init(title: "left", style: .done, target: self, action: nil)
navigationItem.leftBarButtonItem = leftBarButton
```

![Untitled](https://s3-us-west-2.amazonaws.com/secure.notion-static.com/f8ebeaa8-fc02-49b8-902b-33f88320e115/Untitled.png)

navigation bar의 Customize 또한 가능하다.

```swift
override func viewDidLoad() {
                super.viewDidLoad()
                navigationController?.navigationBar.tintColor = .black
                navigationController?.navigationBar.barTintColor = .black
        }
```
