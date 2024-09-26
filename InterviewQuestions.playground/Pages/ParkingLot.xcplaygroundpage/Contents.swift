//: [Previous](@previous)

import Foundation

enum ParkingLotError: Error, LocalizedError {
    case noAvailableSlots
    case invalidSlot(String)
    case lotIsEmpty

    var errorDescription: String? {
        switch self {
        case .noAvailableSlots:
            return "No available slots in the parking lot."
        case .invalidSlot(let slot):
            return "Invalid slot: \(slot). Slot is already available or does not belong to this parking lot."
        case .lotIsEmpty:
            return "No vehicle available to leave from the parking lot."
        }
    }
}

struct ParkingLotModel {
    private let slots: [String]
    private var availableSlots: [String]

    init(slots: [String]) {
        self.slots = slots
        self.availableSlots = slots
    }

    mutating func parkIn() throws -> Bool {
        guard !availableSlots.isEmpty else {
            throw ParkingLotError.noAvailableSlots
        }
        availableSlots.removeFirst()
        return true
    }

    mutating func leaveParking(slot: String) throws -> Bool {
        guard slots.contains(slot) else {
            throw ParkingLotError.invalidSlot(slot)
        }
        guard !availableSlots.contains(slot) else {
            throw ParkingLotError.invalidSlot(slot)
        }
        availableSlots.append(slot)
        return true
    }

    func totalAvailableSlots() -> [String] {
        availableSlots
    }
}

class ParkingLotViewModel {
    private var model: ParkingLotModel
    init(model: ParkingLotModel) {
        self.model = model
    }
    
    func parking() throws -> Bool {
        try model.parkIn()
    }
    
    func leave(slot: String)  throws -> Bool {
        try model.leaveParking(slot: slot)
    }
    
    func availableSlots() -> [String] {
        model.totalAvailableSlots()
    }
}

class ParkingLotView {
    private let viewModel: ParkingLotViewModel
    init(viewModel: ParkingLotViewModel) {
        self.viewModel = viewModel
    }
    
    func parkIn() {
        do {
           print("Parking: ",try viewModel.parking())
        } catch let error {
            print(error.localizedDescription)
        }
    }
    
    func totalNumberOfAvailableSlots() {
        print("Total Available Slots: ",viewModel.availableSlots())
    }
    
    func leaveParking(_ slot: String) {
        do {
           print("Leave: ",try viewModel.leave(slot: slot))
        } catch let error {
            print(error.localizedDescription)
        }
        
    }
}
let slots = ["1","2","3","4","5"]
let parkingView = ParkingLotView(viewModel: ParkingLotViewModel(model: ParkingLotModel(slots: slots)))
parkingView.totalNumberOfAvailableSlots()
parkingView.parkIn()
parkingView.totalNumberOfAvailableSlots()
parkingView.leaveParking("1")
parkingView.parkIn()
parkingView.parkIn()
parkingView.parkIn()
parkingView.parkIn()
parkingView.parkIn()
parkingView.parkIn()
parkingView.totalNumberOfAvailableSlots()
parkingView.leaveParking("2")
parkingView.totalNumberOfAvailableSlots()
parkingView.parkIn()
parkingView.totalNumberOfAvailableSlots()
