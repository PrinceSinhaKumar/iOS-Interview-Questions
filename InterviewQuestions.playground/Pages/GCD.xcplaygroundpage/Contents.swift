//: [Previous](@previous)

import Foundation

func gcdOfTwoNumber(_ num1: Int,_ num2: Int) -> Int {
    if num2 == 0{
        return num1
    }
    return gcdOfTwoNumber(num2, num1 % num2)
}

print("GCD of 48, 14 is: (\(gcdOfTwoNumber(48,14)))")

//MARK: - GCD of two array
func gcdOfTwoArray(_ arr1: [Int],_ arr2: [Int]) -> Int {
    var result = arr1.first ?? 0
    for i in arr1.dropFirst() + arr2 {
        result = gcdOfTwoNumber(result, i)
    }
    return result
}

print("GCD of tow array is: (\(gcdOfTwoArray([48,12,30], [24,18,86])))")

//MARK: - Using reduce method

func gcdUsingReduce(_ arr1: [Int],_ arr2: [Int],_ arr3: [Int]) -> Int {
    return (arr1 + arr2 + arr3).reduce(0, { gcdOfTwoNumber($0, $1) })
}

print("GCD of tow array using reduce is: (\(gcdUsingReduce([10,20,30], [40,45,50], [55,60,65])))")
