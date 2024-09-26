//: [Previous](@previous)

import Foundation

//MARK: - Two sum problem

//TODO: - BrutForce solution using two loops
let array = [7,5,6,3,5,2,1,7,8,9]
let sum = 10
func brutForceTwoSum(array: [Int], sum: Int) -> String{
    var result: String = ""
    for i in 0..<array.count {
        for j in 0..<array.count where j != i {
            if array[i] + array[j] == sum {
                result.append("(\(array[i]), \(array[j])) ")
            }
        }
    }
    return result
}

//print("Two sum of \(sum) are: \(brutForceTwoSum(array: array, sum: sum))")
//Time complexity:O(n^2)

//TODO: - Using binary search

func twoSumBinarySearch(array: [Int], sum: Int) -> String {
    var result: String = ""
    for i in 0..<array.count {
        let compliment = sum - array[i]
        var tempArray = array
        tempArray.remove(at: i)
        if binarySearch(array: tempArray, targetItem: compliment, low: 0, high: array.count - 1) {
            result.append("(\(array[i]), \(compliment)) ")
        }
    }
    return result
}

//print("Two sum of \(sum) are: \(twoSumBinarySearch(array: array.sorted(), sum: sum))")


func binarySearch(array: [Int], targetItem: Int, low: Int, high: Int) -> Bool {
    if low > high {
        return false
    }
    let mid = (low + high)/2
    if array[mid] == targetItem {
        return true
    } else if array[mid] < targetItem {
        return binarySearch(array: array, targetItem: targetItem, low: mid+1, high: high)
    } else {
        return binarySearch(array: array, targetItem: targetItem, low: low, high: mid - 1)
    }
}

//TODO: - Two sum using two pointers

func twoSumTwoPointer(array: [Int], sum: Int) -> String{
    var result = ""
    var lowerIndex = 0
    var higherIndex = array.count - 1
    
    while lowerIndex < higherIndex {
        let addSum = array[lowerIndex] + array[higherIndex]
        if addSum == sum {
            result.append("(\(array[lowerIndex]), \(array[higherIndex])) ")
            lowerIndex += 1
            higherIndex -= 1
        } else if addSum < sum {
            lowerIndex += 1
        } else if addSum > sum {
            higherIndex -= 1
        }
    }
    return result
}

print("Two sum of \(sum) are: \(twoSumTwoPointer(array: array.sorted(), sum: 10))")

func twoPointer(array: [Int], sum: Int) -> [(Int,Int)] {
    var lower = 0
    var higher = array.count - 1
    var result:[(Int, Int)] = []
    while lower < higher {
        let indexSum = array[lower] + array[higher]
        if indexSum == sum {
            result.append((array[lower], array[higher]))
            lower += 1
            higher -= 1
        } else if indexSum < sum {
            lower += 1
        } else {
            higher -= 1
        }
    }
    return result
}

//MARK: - Two sum Using Dict
func twoSumUsingDict(array: [Int], sum: Int) -> [(Int,Int)]  {
    var dict: [Int: Int] = [:]
    var result:[(Int, Int)] = []
    for (i, num) in array.enumerated() {
        let compliment = sum - num
        if let index = dict[compliment] {
            result.append((index, i))
        }
        dict[num] = i
    }
    return result
}

print("Two sum using twoPoint of \(array.sorted()) \(sum) are: \(twoSumUsingDict(array: array.sorted(), sum: 10))")

//MARK: - Fibbonaci

func resultFibbonaci(num: Int) {
    var first = 1
    var second = 1
    print(first, second)
    var next = 0
    while next < num {
        next = first + second
        print(next)
        first = second
        second = next
    }
}

//print(resultFibbonaci(num: 20))

func binarySearchh(arr: [Int], targetValue: Int) -> Int? {
    var lower = 0
    var higher = arr.count - 1
    
    while lower < higher {
        let mid = lower + (higher - lower)/2
        if arr[mid] == targetValue {
            return mid
        } else if arr[mid] < targetValue {
            lower = mid + 1
        } else {
            higher = mid - 1
        }
    }
    return nil
}

print(binarySearchh(arr: array.sorted(), targetValue: 5))
