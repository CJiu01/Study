import UIKit

// 함수 정의

// 함수 호출시, 매개변수 이름 name
func myFunction(name: String) -> String {
    return "안녕하세요, \(name) 입니다!"
}
print(myFunction(name: "CJW"))

// 함수 호출시, 매개변수 이름이 myName
func myFunctionSecond(myName name: String) -> String {
    return "안녕하세요, \(name) 입니다!"
}
print(myFunctionSecond(myName: "최지우"))


// 함수 호출시, 매개변수 이름 없음
func myFunctionThird(_ name: String) -> String {
    return "안녕하세요, \(name) 입니다!"
}
print(myFunctionThird("컴퓨터학부 최지우"))
