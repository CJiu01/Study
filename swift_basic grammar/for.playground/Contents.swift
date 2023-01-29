import UIKit

// 6번 반복 : 0~5
for i in 0...5 {
    print("i : \(i)")
}


// 5번 반복 : 0~4
// iterate 를 i로 많이 나타냄
for i in 0..<5 {
    print("i : \(i)")
}

// 0~4 짝수만 출력
for i in 0..<5 where i%2 == 0 {
    print("i : \(i)")
}

// 비어있는 Int형 배열 선언
var randomInts: [Int] = []

// i 는 사용하지 않으면 _ 언더바 로 쓰면 된다.
// int형 random 숫자 생성 : Int.random(in: 0...100)
for _ in 0..<25 {
    let randomNumber = Int.random(in: 0...100)
    randomInts.append(randomNumber)
}
print("randomInts : \(randomInts)")
