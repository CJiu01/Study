## 1. Launch Screen 이란?
앱 실행 시, First screen이 나타나기 이전의 화면은 Launch Screen이라고 한다. 
![](https://velog.velcdn.com/images/cjiu0201/post/89bf2f2d-4ec3-447f-8014-df208e02afe6/image.png)

로딩 중 Launch Screen이 나타남으로써, 사람들은 앱을 즉시 사용할 수 있는 능률적인 실행 환경이 갖추어 있다고 판단한다.

iOS에서는 launch screen, AOS에서는 splash라는 표현을 사용한다.


## 2. Launch Screen의 Best practices
Launch Screen의 모범 사례는 아래와 같다.

```
1. 앱의 첫 화면과 거의 동일한 시작 화면을 디자인합니다.
	앱 실행이 완료될 때, 보이는 요소가 다르다면 사용자는 이질감을 느낄 수 있다.
    
2. 시작 화면에 텍스트를 포함하지 마십시오.
	시작 화면의 콘텐츠는 변경되지 않으므로 사용자화가 불가하다.
    
3. 광고를 하지 마십시오.
```


Launch Screen을 만들 때 주의할 점은 아래와 같다.
```
1. UIKit만을 사용해야 합니다.
2. 단 하나의 UIView나 UIViewController 객체만을 사용해야 합니다.
3. 액션, 아울렛과 같은 코드를 연결하면 안 됩니다.
4. UIWebView를 사용하면 안 됩니다.
5. 어떤 커스텀 클래스도 사용하면 안 됩니다.
6. 런타임 속성을 사용하면 안 됩니다.
```

>시작 화면은 온보딩 경험이나 시작 화면이 아니며 예술적 표현의 기회도 아닙니다. 시작 화면의 유일한 기능은 빠르게 시작하고 즉시 사용할 수 있도록 경험에 대한 인식을 향상시키는 것입니다.


위 주의사항의 요점은 런치 스크린이란 **사용자에게 앱이 빠르게 사용 가능하다는 인식을 남기는 것**이다. 즉, `최소한의 동작` 만을 하라는 것이다. 
따라서 앱 아이콘, 이미지 같은 단 하나의 ImageView만 포함하는 것이 가장 좋다.
<br/>
***
참조
https://developer.apple.com/design/humaninterfaceguidelines/patterns/launching/
https://jeong9216.tistory.com/193