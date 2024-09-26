//: [Previous](@previous)

import Foundation

func reverElement(num:inout Int) {
    var reminder = 0
    var reversed = 0
    var sign = 1
    if num < 0 {
        num = -num
        sign = -1
    }
    while num > 0 {
        reminder = num % 10
        reversed = reversed * 10 + reminder
        num /= 10
    }
    print(reversed * sign)
}
var num = -120
print(reverElement(num: &num))

