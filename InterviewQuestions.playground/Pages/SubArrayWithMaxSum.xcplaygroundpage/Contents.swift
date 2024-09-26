//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

let array:[Int] = [-13,5,2,6,-8,3,5,9,2,4,1,5,1,-2,-3,4,6]

func getSubArrayWithMaxSum(_ arr: [Int]) -> [Int] {
    var subArr:[Int] = []
    var left: Int = 0
    var right: Int = left
    var maxSum: Int = 0
    while left < arr.count {
        let array = arr[left...right]
        let sum = array.reduce(0, {$0 + $1})
        if maxSum < sum {
            maxSum = sum
            subArr = array.map({$0})
        }
        if right == arr.count - 1 {
            left += 1
            right = left
        } else {
            right += 1
        }
    }
    return subArr
}

print(getSubArrayWithMaxSum(array))

func maxSubArraySum(_ nums: [Int]) -> Int {
    guard !nums.isEmpty else {
        return 0 // Edge case for empty array
    }

    var currentSum = nums[0]
    var maxSum = nums[0]

    for i in 1..<nums.count {
        // Calculate the current subarray sum
        currentSum = max(nums[i], currentSum + nums[i])
        // Update maxSum if currentSum is larger
        maxSum = max(maxSum, currentSum)
    }

    return maxSum
}

// Example Usage:
print("Maximum subarray sum is:", maxSubArraySum(array))

func maxSumSubArray(_ arr: [Int]) -> [Int] {
    guard !arr.isEmpty else {
        return ([]) // Edge case for empty array
    }
    var maxSum:Int = arr[0]
    var currentSum:Int = arr[0]
    
    var start = 0
    var end = 0
    var tempStart = 0
    
    for i in 1..<arr.count {
        if arr[i] > currentSum + arr[i] {
            currentSum = arr[i]
            tempStart = i
        } else {
            currentSum += arr[i]
        }
        
        if maxSum < currentSum {
            maxSum = currentSum
            start = tempStart
            end = i
        }
    }
    return Array(arr[start...end])
}

// Example Usage:
let result = maxSumSubArray(array)
print("Subarray with the maximum sum is:", result)

func mergeTwoArray(_ arr1:inout [Int],_ arr2:inout [Int]) {
    var left = 0
    var right = 0
    
    while left < arr1.count && right < arr2.count {
        if arr1[left] > arr2[right] {
            if arr2[right] <= 0 {
                arr1.insert(arr2[right], at: 0)
            } else {
                arr1.insert(arr2[right], at: left)
            }
            right += 1
        }else {
            left += 1
        }
        
    }
    while right < arr2.count {
        arr1.append(arr2[right])
        right += 1
    }
    print(arr1)
}
var arr1 = [2,5,7,9]
var arr2 = [1,3,0,0,0,-4,6,8]
mergeTwoArray(&arr1, &arr2)
