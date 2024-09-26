//: [Previous](@previous)

import Foundation

/*
 Method Swizzling in iOS Development is a runtime feature used to change the implementation of an existing method at runtime. Prior to Swift 5.1, we could change the implementation of Objective-C methods marked with the @objc attribute. In Swift 5.1, Apple added an alternative feature to Swift to change the implementation of Swift methods at runtime.
 Why is it needed?
 Let’s imagine that you have a third-party library in your project that contains a method in some class, and the implementation of this method does not work correctly or not the way you want and you want to change the implementation of this method. You can do this using the Method Swizzling feature.
 When is this even useful?
 Let’s imagine you are writing applications for iOS/iPadOS and at some point you want to change the language of the application on the fly (at runtime) without reloading the application. At this time, applying Method Swizzling would be useful.
 */

class MyClass {
    
    lazy var name: String = ""
    
    init() {
    }
    
//    @objc func myMethod() {
//        print("Old Value")
//    }
//    
//    func newMthod() {
//        let originalMethod = class_getClassMethod(MyClass.self, #selector(myMethod()))
//        let swizzlingMethod = class_getClassMethod(MyClass.self, #selector(mySwizzling()))
//        method_exchangeImplementations(originalMethod!, swizzlingMethod!)
//    }
}
//extension MyClass {
//    @objc func mySwizzling() {
//        print("New Value")
//    }
//}

class New {
    lazy var instance = MyClass()
    
}
//let nn = MyClass()
//nn.newMthod()
//nn.myMethod()
