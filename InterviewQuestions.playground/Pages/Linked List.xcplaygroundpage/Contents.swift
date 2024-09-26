//: [Previous](@previous)

import Foundation

class Node<T> {
    var value: T
    var next: Node<T>?
    init(value: T, next: Node<T>? = nil) {
        self.value = value
        self.next = next
    }
}

class LinkedList<T> {
    var head: Node<T>?
}
extension LinkedList {
    func appendList(_ value: T) {
        let newNode = Node(value: value)
        if head == nil {
            head = newNode
        } else {
            var currentNote = head
            while let nextNode = currentNote?.next {
                currentNote = nextNode
            }
            currentNote?.next = newNode
        }
    }
    
    func removeFirst() {
        head = head?.next
    }
    
    func removeLast() {
        if head == nil {
            return
        }
        if head?.next == nil  {
            head = nil
            return
        }
        var currentNote = head
        while let nextNode = currentNote?.next, nextNode.next != nil {
            currentNote = nextNode
        }
        currentNote?.next = nil
    }
    
    func traverse() {
        var currentNote = head
        while let nextNode = currentNote{
            print(nextNode.value)
            currentNote = nextNode.next
        }
    }
}

//let list = LinkedList<Int>()
//list.appendList(1)
//list.appendList(2)
//list.appendList(3)
//list.appendList(4)
//list.appendList(5)
//list.traverse()

class Nodee<T> {
    var value: T
    var nextNode: Nodee<T>?
    init(value: T, nextNode: Nodee<T>? = nil) {
        self.value = value
        self.nextNode = nextNode
    }
}
class LinkedListt<T> {
    var head: Nodee<T>?
}
extension LinkedListt {
    func appendList(_ value: T){
        let newNote =  Nodee(value: value)
        if head == nil {
            head = newNote
        } else{
            var currentNote = head
            while let nextNode = currentNote?.nextNode {
                currentNote = nextNode
            }
            currentNote?.nextNode = newNote
        }
    }
    
    func removeFirst() {
        head = head?.nextNode
    }
    func removeLast() {
        if head == nil {
            return
        }
        if head?.nextNode == nil {
            head = nil
            return
        }
        var currentNote = head
        while let nextNode = currentNote?.nextNode, nextNode.nextNode != nil {
            currentNote = nextNode
        }
        currentNote?.nextNode = nil
    }
    
    func traverse() {
        var currentNote = head
        while let note = currentNote {
            print(note.value)
            currentNote = note.nextNode
        }
    }
}


let list = LinkedListt<Int>()
list.appendList(1)
list.appendList(2)
list.appendList(3)
list.appendList(4)
list.appendList(5)
list.traverse()
print("........")
list.removeFirst()
list.traverse()
print("........")
list.removeLast()
list.traverse()












