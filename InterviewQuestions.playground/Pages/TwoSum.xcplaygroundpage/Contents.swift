//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

func findTwoSum(_ arr: [Int],_ targetValue: Int) {
    var left = 0
    var right = arr.count - 1
    var result: [(Int, Int)] = []
    
    while left < right {
        let indexSum = arr[left] + arr[right]
        if indexSum == targetValue {
            result.append((left, right))
            left += 1
            right -= 1
        } else if indexSum > targetValue {
            right -= 1
        } else {
            left += 1
        }
    }
    print(result)
}
//6
//1,2,3,4,5,6,7
print(findTwoSum([1,2,3,4,5,6,7], 6))

func twoSumUsingDict(_ arr: [Int],_ targetValue: Int) -> [Int] {
    var dict: [Int: Int] = [:]
    for (index, value) in arr.enumerated() {
        let comp = targetValue - value
        if let indexV = dict[comp] {
            return [indexV, index]
        }
        dict[value] = index
    }
    return []
}

print(twoSumUsingDict([1,2,3,4,5,6,7], 6))
