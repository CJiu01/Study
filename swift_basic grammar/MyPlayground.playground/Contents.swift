import UIKit

// Generic
// 타입에 의존하지 않는 범용 코드 작성

struct Friend {
    var name: String
}

// 제네릭 <T>
// 제네릭으로 어떤 자료형이 들어올 수 있도록 설정
struct MyArray<SomeElement> {
    
    // 멤버변수
    var elements = [SomeElement]()
}
