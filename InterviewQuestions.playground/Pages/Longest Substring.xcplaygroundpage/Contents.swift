//: [Previous](@previous)

import Foundation

var greeting = "Helloplayground"

func getLongestSubString(_ s: String) -> String{
    var subString = ""
    var longestSubString: String?
    var index = 0
    var right = index
    while index < s.count {
        let str = s[s.index(s.startIndex, offsetBy: index)]
        if !subString.contains(str) {
            subString.append(str)
            if longestSubString?.count ?? 0 < subString.count {
                longestSubString = subString
            }
            index += 1
        } else {
            right += 1
            index = right
            subString = ""
        }
    }
    return longestSubString ?? ""
}
getLongestSubString(greeting)

func getLongestSubStringUsingSlidingWindow(_ s: String) {
    var left = 0
    var longestSubstring = ""
    var dict:[Character: Int] = [:]
    for (index,char) in s.enumerated() {
        dict[char, default: 0] += 1
        while dict[char, default: 0] > 1 {
            dict[s[s.index(s.startIndex, offsetBy: left)], default: 0] -= 1
            if dict[s[s.index(s.startIndex, offsetBy: left)], default: 0] == 0 {
                dict.removeValue(forKey: s[s.index(s.startIndex, offsetBy: left)])
            }
            left += 1
        }
        let subString = s[s.index(s.startIndex, offsetBy: left)...s.index(s.startIndex, offsetBy: index)]
        if subString.count > longestSubstring.count {
            longestSubstring = subString.description
        }
    }
    
    print(longestSubstring)
}
getLongestSubStringUsingSlidingWindow(greeting)
