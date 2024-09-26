//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

func isPerfectNumber(_ number: Int) -> Bool {
    var sum = 0
    for i in 1...number/2 {
        if number % i == 0 {
            sum += i
        }
    }
    return sum == number
}


func generatePerfectNumber(n: Int) -> [Int]{
    var perfectNumbers: [Int] = []
    
    for i in 1...n {
        let number = 6 * (Int(pow(2, Double(i))) - 1)
        perfectNumbers.append(Int(number))
    }
    return perfectNumbers
}

func checkAllNumber() {
    for i in generatePerfectNumber(n: 5) {
        print("i : \(i)")
        print(isPerfectNumber(i))
    }
}
checkAllNumber()

func reverseArray(_ arr:inout [Int]) {
    var left = 0
    var right = arr.count - 1
    while left < right {
        let leftItem = arr[left]
        arr[left] = arr[right]
        arr[right] = leftItem
        left += 1
        right -= 1
    }
    print(arr)
}
var arr = [1,2,3,4,5,6]
print(reverseArray(&arr))
