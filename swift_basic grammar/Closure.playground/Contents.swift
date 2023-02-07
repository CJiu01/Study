import UIKit

// String을 반환하는 클로저
let myName : String = {
    // return 부분이 myName 으로 들어간다
    return "최지우"
}()
print(myName)

var yourName : String {
    return "Lee"
}
print(yourName)


// 매개변수를 가지고 String으로 반환하는 클로저
let myMajorNameString = { (major:String) -> String in
    return "나의 전공은 \(major) 입니다"
}
print(myMajorNameString("컴퓨터학부"))


// 클로저가 print 로직을 담고 있다
let name = {
    print("CJW")
}
name()


// 클로저가 매개변수를 가지며 아래 로직을 담고 있다
let myRealName = { (name: String) in
    print("컴퓨터학부 \(name)")
}
myRealName("최지우")
