//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

func longestSubString(_ s: String){
    var longest: String = ""
    for left in 0..<s.count {
        var right = left + 1
        while right < s.count {
            let subString = s[s.index(s.startIndex, offsetBy: left)...s.index(s.startIndex, offsetBy: right)]
            if checkPalimdrome(s: subString.description) {
                if longest.count < subString.count {
                    longest = subString.description
                }
            }
            right += 1
        }
    }
    print(longest)
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

longestSubString("babadmamd")

//MARK: - Optimize version

func checkLongestSubPalimdrom(_ s: String) {
    var longest = ""
    var maxLen = 0
    for index in 0..<s.count {
        var l = index
        var r = index
        while l >= 0 , r < s.count , s[s.index(s.startIndex, offsetBy: l)] == s[s.index(s.startIndex, offsetBy: r)] {
            let ln = r - l + 1
            if ln > maxLen {
                longest = s[s.index(s.startIndex, offsetBy: l)...s.index(s.startIndex, offsetBy: r)].description
                maxLen = ln
            }
            l -= 1
            r += 1
        }
        
        l = index
        r = index + 1
        while l >= 0 , r < s.count , s[s.index(s.startIndex, offsetBy: l)] == s[s.index(s.startIndex, offsetBy: r)] {
            let ln = r - l + 1
            if ln > maxLen {
                maxLen = ln
                longest = s[s.index(s.startIndex, offsetBy: l)...s.index(s.startIndex, offsetBy: r)].description
            }
            l -= 1
            r += 1
        }
    }
    print(longest)
}

checkLongestSubPalimdrom("babadmamd")
func checkLongestSubPalimdrom(_ s1: String,_ s2: String) {
    let s = s1 + s2
    var longest = ""
    var maxLen = 0
    for index in 0..<s.count {
        var l = index
        var r = index
        while l >= 0 , r < s.count , s[s.index(s.startIndex, offsetBy: l)] == s[s.index(s.startIndex, offsetBy: r)] {
            let ln = r - l + 1
            if ln > maxLen {
                longest = s[s.index(s.startIndex, offsetBy: l)...s.index(s.startIndex, offsetBy: r)].description
                maxLen = ln
            }
            l -= 1
            r += 1
        }
        
        l = index
        r = index + 1
        while l >= 0 , r < s.count , s[s.index(s.startIndex, offsetBy: l)] == s[s.index(s.startIndex, offsetBy: r)] {
            let ln = r - l + 1
            if ln > maxLen {
                maxLen = ln
                longest = s[s.index(s.startIndex, offsetBy: l)...s.index(s.startIndex, offsetBy: r)].description
            }
            l -= 1
            r += 1
        }
    }
    print(longest)
}
checkLongestSubPalimdrom("abc", "babad")

func longestCommonPrefix(_ strs: [String]) -> String {
    guard !strs.isEmpty else { return "" }
    
    let shortestStr = strs.min(by: { $0.count < $1.count })!
    
    for (index, char) in shortestStr.enumerated() {
        for str in strs {
            if str[str.index(str.startIndex, offsetBy: index)] != char {
                return String(shortestStr.prefix(index))
            }
        }
    }
    
    return shortestStr
}
let strs = ["flower", "flow", "flight"]
print(longestCommonPrefix(strs))
