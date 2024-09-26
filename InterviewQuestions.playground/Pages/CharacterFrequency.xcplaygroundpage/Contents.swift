//: [Previous](@previous)

import Foundation

var greeting = "Hello"

func characterFrequency(_ str: String) -> [Character: Int] {
    var dict: [Character: Int] = [:]
    str.forEach { c in
        if let count = dict[c] {
            dict[c] = count + 1
        } else {
            dict[c] = 1
        }
    }
    return dict
}

print(characterFrequency(greeting))
