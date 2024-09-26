import UIKit

let original = "aaccedddeddff"
// acedf
func removeDuplication() -> String {
    
    var str = ""
    
    for i in original {
        if !str.contains(i) {
            str.append(i)
        }
    }
    return str
}

print(removeDuplication())

// (n - 1) + (n + 2)
func generateFibonaci(n: Int) -> [Int] {
   var num = [0, 1]
    while num.count <= n {
        num.append(num[num.count - 1] + num[num.count - 2])
    }
    return num
}

print(generateFibonaci(n: 6))
