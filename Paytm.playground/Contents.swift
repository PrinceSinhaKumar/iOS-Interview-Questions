import UIKit

var greeting = "Hello, playground"

let arr = [1,2,2,3,4,5]

func missingNumber(_ arr: [Int]) {
    
    var frequency = [Int](repeating: 0, count: arr.count + 1)
    var repeatedElements: [Int] = []
    var missingNumber: [Int] = []
    for (index, value) in arr.enumerated() {
        frequency[value] += 1
        if frequency[index] == 0 && index != 0 {
            missingNumber.append(index)
        }
    }
    print(repeatedElements, missingNumber)
}

missingNumber(arr)
/*
    *    i = 1, j = 1  * n/2
   ***   1= 2, j = 2, ***
  *****
 *******
 */

// L principle of SOLID
protocol Proor {
    func m1()
    func m2()

}

protocol Pror1 {
    func m3()
    func m4()
}
class A: Proor, Pror1 {
    func m1() {
        
    }
    
    func m2() {
        
    }
    
    func m3() {
        
    }
    
    func m4() {
        
    }
    
    
}
class B: Proor {
    func m1() {
        
    }
    func m2() {
        
    }
    
    
}

