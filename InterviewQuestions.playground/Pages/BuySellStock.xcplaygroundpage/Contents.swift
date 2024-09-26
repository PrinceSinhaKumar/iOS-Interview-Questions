//: [Previous](@previous)

import Foundation

var greeting = "Hello, playground"

//: [Next](@next)
struct Stock {
    let price: Double
}
struct StockData {
    let stocks: [Stock]
}

class StockModel {
    var stockData: StockData?
    func fetchStockData() {
        let prices = [7, 1, 5, 3, 6, 4].map { Stock(price: Double($0)) }
        stockData = StockData(stocks: prices)
         stockData
    }
}

class StockViewModel {
    let model: StockModel
    init(model: StockModel) {
        self.model = model
    }
    
    func getStockDetail() {
        model.fetchStockData()
    }
}
