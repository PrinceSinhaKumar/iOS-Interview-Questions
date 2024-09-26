//: [Previous](@previous)

import Foundation


func missingRepeatElements(_ arr: [Int]) {

    var frequency = [Int](repeating: 0, count: arr.count + 1)
    var repeatedElements: [Int] = []
    var missingNumber: [Int] = []
    for (index, value) in arr.enumerated() {
        frequency[value] += 1
        if frequency[value] > 1, !repeatedElements.contains(value) {
            repeatedElements.append(value)
        }
        if frequency[index] == 0 && index != 0 {
            missingNumber.append(index)
        }
    }
    print(repeatedElements, missingNumber)
}

missingRepeatElements([1,2,3,4,6,6,7,8,9])

func lowestMissingElement(_ arr: [Int]) -> Int {
    var sortedArray = sortArray(arr)
    for i in 0..<sortedArray.count {
        if sortedArray[i] != i + 1 {
            return i + 1
        }
    }
    return sortedArray.count + 1
}

func sortArray(_ arr: [Int]) -> [Int]{
    guard arr.count > 1 else { return arr }
    var left:[Int] = []
    var right:[Int] = []
    var middle:[Int] = []
    let piviotIndex = arr.count/2
    let piviotItem = arr[piviotIndex]
    arr.forEach { item in
        if piviotItem == item {
            middle.append(item)
        } else if piviotItem < item {
            right.append(item)
        } else{
            left.append(item)
        }
    }
    return sortArray(left) + middle + sortArray(right)
}

print(lowestMissingElement([1,4,6,6,7,8,9]))

func factorial(_ n: Int) -> NSDecimalNumber {
    var result = NSDecimalNumber(1)

    if n == 0 || n == 1 {
        return result
    } else {
        for i in 2...n {
            result = result.multiplying(by: NSDecimalNumber(value: i))
        }
        return result
    }
}

let result = factorial(100)

let formatter = NumberFormatter()
formatter.numberStyle = .scientific
formatter.maximumFractionDigits = 0
if let formattedResult = formatter.string(from: result) {
    print("Factorial of 100: \(formattedResult)")
}

func factorialOfNumber1(_ num: Int) {
    var factorial = "1"
    
    for i in 1...num {
        factorial = multi(factorial, i)
    }
    
    print(factorial)
}

func multiply(_ num1: String, _ num2: Int) -> String {
    var result = ""
    var carry = 0
    var num1 = num1.reversed()
    
    for digit in num1 {
        let product = Int(String(digit))! * num2 + carry
        carry = product / 10
        result = String(product % 10) + result
    }
    
    if carry > 0 {
        result = String(carry) + result
    }
    
    return result
}

func multi(_ num1: String, _ num2: Int) -> String{
    var result = ""
    var carry = 0
    var num1 = num1.reversed()
    num1.forEach { item in
        let product = (Int(item.description) ?? 0) * num2 + carry
        carry = product / 10
        result = (product % 10).description + result
    }
    
    if carry > 0 {
        result = carry.description + result
    }
    return result
}

factorialOfNumber1(100)

func sort01Araya(_ arr:inout [Int]) -> [Int] {
    var left = 0
    var right = arr.count - 1
    while left < right {
        while arr[left] == 0 {
            left += 1
        }
        while arr[right] == 1 {
            right -= 1
        }
        //if left < right {
            arr.swapAt(left, right)
            left += 1
            right -= 1
       // }
    }
    return arr
}
var arr = [0, 1, 0, 1, 1, 0, 0, 1]
print(sort01Araya(&arr))

func sort012Array(_ arr:inout [Int]) -> [Int] {
    var left = 0
    var mid = 0
    var right = arr.count - 1
    while mid <= right {
        switch arr[mid] {
        case 0:
            let temp = arr[left]
            arr[left] = arr[mid]
            arr[mid] = temp
            //arr.swapAt(left, mid)
            left += 1
            mid += 1
        case 1:
            mid += 1
        case 2:
            arr.swapAt(mid, right)
            right -= 1
        default:
            break
        }
    }
    return arr
}
print(sort012Array(&arr))

func moveAllZeroAtlast(_ arr: inout [Int]) {
    var wPoint = 0
    for rPoint in 0..<arr.count {
        if arr[rPoint] != 0 {
            arr[wPoint] = arr[rPoint]
            wPoint += 1
        }
        
        while wPoint < arr.count {
            arr[wPoint] = 0
            wPoint += 1
        }
    }
    print(arr)
}
var arr1 = [1, 9, 8, 4, 0, 0, 2, 7, 0, 6, 0]
print(moveAllZeroAtlast(&arr1))
