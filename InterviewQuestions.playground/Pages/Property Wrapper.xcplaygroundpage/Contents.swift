//: [Previous](@previous)

import Foundation

@propertyWrapper
class Capatilized {
    var wrappedValue: String {
        didSet { wrappedValue = wrappedValue.capitalized }
    }
    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized
    }
}

class LoginVC {
    @Capatilized var name: String
    init(name: String) {
        self.name = name
    }
}

var obj = LoginVC(name: "prince sinha")
print(obj.name)

@propertyWrapper
struct Capitalized {
    var wrappedValue: String {
        didSet { wrappedValue = wrappedValue.capitalized }
    }

    init(wrappedValue: String) {
        self.wrappedValue = wrappedValue.capitalized

    }
}

struct Person {
    @Capitalized var name: String

}

var person = Person(name: "john doe")
print(person.name) // Output: John Doe
person.name = "jane smith"
print(person.name) // Output: Jane Smith
