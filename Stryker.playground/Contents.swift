import UIKit

var arr = [1,2,3,4,5,6]

print(arr.map({ $0 * 2}))

print(arr.filter({ $0 % 2 == 0 }))

print(arr.reduce(0, { $0 + $1}))

// SOLID

// Single Responsibility Principle (SRP)
struct CartItem {
    let name: String
    let price: Double
}

class Cart {
    private var items: [CartItem] = []
    
    func addItem(item: CartItem) {
        items.append(item)
    }
    
    func removeItem(item: CartItem) {
    }
    
    func getItems() -> [CartItem] {
        return items
    }
}
class PriceCalculator {
    func calculateTotal(items: [CartItem]) -> Double {
        return items.reduce(0) { $0 + $1.price }
    }
}

// Open/Closed Principle (OCP)
protocol Discount {
    func applyDiscount(total: Double) -> Double
}

class PercentageDiscount: Discount {
    let percentage: Double
    
    init(percentage: Double) {
        self.percentage = percentage
    }
    
    func applyDiscount(total: Double) -> Double {
        return total - (total * percentage / 100)
    }
}

class FlatDiscount: Discount {
    let discountAmount: Double
    
    init(discountAmount: Double) {
        self.discountAmount = discountAmount
    }
    
    func applyDiscount(total: Double) -> Double {
        return total - discountAmount
    }
}

//Liskov Substitution Principle (LSP)
protocol PaymentProcessor {
    func processPayment(amount: Double)
}

class CreditCardPayment: PaymentProcessor {
    func processPayment(amount: Double) {
        print("Processing Credit Card payment of \(amount)")
    }
}

class PayPalPayment: PaymentProcessor {
    func processPayment(amount: Double) {
        print("Processing PayPal payment of \(amount)")
    }
}

let paymentMethod: PaymentProcessor = PayPalPayment()
paymentMethod.processPayment(amount: 200.0)

//  Interface Segregation Principle (ISP)
protocol RefundProcessor {
    func processRefund(amount: Double)
}

extension CreditCardPayment: RefundProcessor {
    
    func processRefund(amount: Double) {
        print("Processing Credit Card refund")
    }
}

class ApplePayPayment: PaymentProcessor {
    func processPayment(amount: Double) {
        print("Processing Apple Pay payment")
    }
}


//Dependency Inversion Principle (DIP)
class ShoppingService {
    private let paymentProcessor: PaymentProcessor
    
    init(paymentProcessor: PaymentProcessor) {
        self.paymentProcessor = paymentProcessor
    }
    
    func checkout(amount: Double) {
        paymentProcessor.processPayment(amount: amount)
    }
}

let shoppingService = ShoppingService(paymentProcessor: PayPalPayment())
shoppingService.checkout(amount: 500.0)

