//: [Previous](@previous)

import Foundation
 
struct ChessBoardModel {
    private let row: Int
    private let coloum: Int
    private var board: [[String]] = []
    
    init(row: Int, coloum: Int) {
        self.row = row
        self.coloum = coloum
    }
    
    mutating func designBoard() -> [[String]] {
        for i in 1...row {
            var row: [String] = []
            for c in 1...coloum {
                if (i + c) % 2 == 0 {
                    row.append("⬛️")
                } else {
                    row.append("⬜️")
                }
            }
            self.board.append(row)
        }
        return board
    }
}
class ChessBoardViewModel {
    private var model: ChessBoardModel
    init(model: ChessBoardModel) {
        self.model = model
    }
    
    func fetchChessBoard() -> String {
       return model.designBoard().map({$0.joined(separator: " ")}).joined(separator: "\n")
    }
}
class ChessBoardView {
    private let viewModel: ChessBoardViewModel
    init(viewModel: ChessBoardViewModel) {
        self.viewModel = viewModel
    }
    
    func getChessBoard() {
        print(viewModel.fetchChessBoard())
    }
}

let boardView = ChessBoardView(viewModel: ChessBoardViewModel(model: ChessBoardModel(row: 10, coloum: 10)))
boardView.getChessBoard()
