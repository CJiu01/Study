import UIKit

var myArray : [Int] =
    [0, 1, 2, 3, 4, 5]

for i in myArray {
    print("myArray: \(i)")
}

for i in myArray where i<3 {
    print("3보다 작은 수: \(i)")
}

for i in myArray where i % 2 == 0 {
    print("짝수: \(i)")
}
