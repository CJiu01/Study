import UIKit

// 1
enum School {
    case elementary
    case middle
    case high
    // 한 줄로도 표현 가능
    // case elementary, middle, high
}

let yourSchool = School.high
print("yourSchool : \(yourSchool)")
// print("yourSchool : ", yourSchool)



// 2

//원하는 값을 명시해 줄 수 있음
enum Grade : Int {
    case first = 1
    case second = 2
}

let yourGrade = Grade.second

//enum 이 가지고 있는 값을 가져오기
print("yourGrade : \(yourGrade.rawValue)")



// 3
// 2에서는 rawValue 사용해야 했지만
enum SchoolDetail {
    case elementary(name: String)
    case middle(name: String)
    case high(name: String)
    
    // case의 값 가져오기 함수
    func getName() -> String {
        switch self {
        case .elementary(let name):     // 방법 1
            return name
        case let .middle(name):         // 방법 2
            return name
        case .high(let name):
            return name
        }
    }
}

let yourMiddleSchoolName = SchoolDetail.middle(name: "CJW 중학교")
print("yourMiddleSchoolName : \(yourMiddleSchoolName)")
print("yourMiddleSchoolName : \(yourMiddleSchoolName.getName())")

// 변수 var, let
//var 는 값의 변경이 가능한 변수
//let 은 값의 변경이 불가능한 변수
