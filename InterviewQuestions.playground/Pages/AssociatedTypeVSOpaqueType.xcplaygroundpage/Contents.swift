//: [Previous](@previous)

import Foundation

class A: AssociatedTypeVSOpaqueTypeDelegate {
    func getType() -> String {
        return "A"
    }
    
}
class B: AssociatedTypeVSOpaqueTypeDelegate {
    func getType() -> Int {
        return 1
    }
}

protocol AssociatedTypeVSOpaqueTypeDelegate {
    associatedtype resturnType
    func getType() -> resturnType
}

func getTypeValue() -> some AssociatedTypeVSOpaqueTypeDelegate {
    return B()
}

print(getTypeValue().getType())

