//: [Previous](@previous)

import Foundation

//MARK: - Delegate
/*
 Delegation:

 1. One-to-one relationship: A delegate is a single object that acts on behalf of another object.
 2. Tight coupling: The delegating object has a reference to the delegate.
 3. Specific protocol: The delegate must conform to a specific protocol.
 4. Direct communication: The delegating object calls methods directly on the delegate.
 5. Typically used for:
     - View controllers communicating with their delegates.
     - Objects providing data or actions to other objects.
 */

protocol DataProviderDelegate {
    func provideData() -> String
}

class DataConsumer  {
    var delegate: DataProviderDelegate?
    func consumeData() {
        let data = delegate?.provideData()
        print("Received data: \(data)")
    }
}

class DataProvider: DataProviderDelegate {
    func provideData() -> String {
        return "Hey Prince"
    }
}

let consumer = DataConsumer()
let provider = DataProvider()
consumer.delegate = provider
consumer.consumeData()


//MARK: - NSNotification
/*
 1. One-to-many relationship: A notification can be observed by multiple objects.
 2. Loose coupling: Observers register for notifications without a direct reference.
 3. No specific protocol: Observers can be any object that conforms to the NSObject protocol.
 4. Indirect communication: The posting object sends a notification, and observers receive it.
 5. Typically used for:
     - Broadcasting events or changes to multiple objects.
     - Decoupling objects that don't need a direct reference.
 */

class DataPoster {
    func postObserver() {
        NotificationCenter.default.post(name: NSNotification.Name.init("postData"), object: nil)
    }
}

class DataObserver {
    
    func addObserver() {
        let notificationCenter = NotificationCenter.default.addObserver(self, selector: #selector(observerData), name: NSNotification.Name.init("postData"), object: nil)
    }
    
    @objc func observerData(_ notification: NotificationCenter) {
        print("Observer works well")
    }
}

let poster = DataPoster()
let observer = DataObserver()
observer.addObserver()
poster.postObserver()

//MARK: - Key Difference
/*
 Key differences:
 - Delegation is a direct, one-to-one relationship, while NSNotification is an indirect, one-to-many relationship.
 - Delegation requires a specific protocol, while NSNotification does not.
 - Delegation is typically used for specific, tightly-coupled interactions, while NSNotification is used for broadcasting events to multiple objects.

 When to use each:

 - Use delegation for:
     - View controller interactions.
     - Providing data or actions to specific objects.
 - Use NSNotification for:
     - Broadcasting events or changes.
     - Decoupling objects that don't need a direct reference.
 */
