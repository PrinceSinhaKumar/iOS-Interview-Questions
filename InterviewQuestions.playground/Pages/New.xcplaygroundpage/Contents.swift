//: [Previous](@previous)

import Foundation

func palindrome(s: String) -> Int {
    var left = 0
    var right = left
    var subPS = Set<String>()
    while left < s.count {
        let subString = s[s.index(s.startIndex, offsetBy: left)...s.index(s.startIndex, offsetBy: right)].description
        if checkPalimdrome(s: subString) {
            subPS.insert(subString)
        }
        if right == s.count - 1{
           left += 1
           right  = left
        } else{
            right += 1
        }
    }
    print(subPS)
    return subPS.count
}

func checkPalimdrome(s: String) -> Bool {
    
    var left = 0
    var right = s.count - 1
    while left < right {
        if s[s.index(s.startIndex, offsetBy: left)] != s[s.index(s.startIndex, offsetBy: right)] {
            return false
        }
        left += 1
        right -= 1
    }
    return true
}

print(palindrome(s: "abaaba")) // Output: aba, baab, aa
