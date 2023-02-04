import UIKit

// 옵셔널 변수 언랩핑(unwrapping)하는 방법

var someVariable : Int? = nil

if someVariable == nil {
    someVariable = 90
}

print(someVariable)




// 옵셔널이란?
//값이 있는지 없는지 모르는 상태를 의미한다.

// 초기 값이 옵셔널로 선언되면 출력 시, 옵셔널로 감싸져 출력된다
// ex: Optional(90)

// 랩 즉, 감싸져있는 것을 벗기는 작업인
// 언랩핑을 해야한다.

/*
 기술도 중요하지만 다양한  --과의 소통 방법을 다양한 선배들에게 프로젝트를 경험하며 배우고 싶습니다.
 기획했던 프로젝트를 배포까지 완벽히 끝마치는 것도 중요하지만 그 과정에서의 배움도 무시할 수 없 다고 생각합니다
 그 과정에서
 아직 다른 파트와 협업할 기회가 많지않아.   나의 것을 만들어가는 방법을 배워나가고
 */

// i : if let
if let unWrappingVariable = someVariable {
    print("언랩핑 되었다. 즉, 값이 있는 상태이다. unWrappingVariable: \(unWrappingVariable)")
} else {
    print("값이 없는 상태")
}

// ii
someVariable = nil

// someVariable 이 비어있으면 즉, 값이 없으면 기본값으로 넣어줌 !!
let myValue = someVariable ?? 10
print("myValue: \(myValue)")


var firstValue : Int? = 30
var secondValue : Int? = 50

unwrap(firstValue)
unwrap(secondValue)

// guard let
func unwrap(_ parameter: Int?){
    print("unwrap() called")
    // 값이 없으면 리턴 해버린다.
    guard let unWrappedParam = parameter else {
        return
    }
    print("unWrappedParam: \(unWrappedParam)")
}
