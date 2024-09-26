//: [Previous](@previous)

import Foundation

var greeting = "MadaM"

func isPalindrome(_ str: String) -> Bool {
    var left = 0
    var right = str.count - 1
    
    while left < right {
        if str[str.index(str.startIndex, offsetBy: left)] != str[str.index(str.startIndex, offsetBy: right)] {
            return false
        }
        left += 1
        right -= 1
    }
    return true
}

print(isPalindrome(greeting))
