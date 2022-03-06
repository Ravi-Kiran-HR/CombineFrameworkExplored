//: [Previous](@previous)

// publishers that will pass a limited number of values

import UIKit
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let foodBank: Publishers.Sequence<[String], Never> = ["Apple", "Milk", "Banana", "Rice"].publisher

let timer = Timer.publish(every: 1, on: .main, in: .common).autoconnect()

let threeSecondsFromNow = Calendar.current.date(byAdding: .second, value: 3, to: Date())!

struct MyError: Error {}

func throwAt3Secs(_ foodItem: String, _ timestamp: Date) throws -> String {
    guard timestamp < threeSecondsFromNow else {
        throw MyError()
    }
    return "Item: \(foodItem) with Timestamp: \(timestamp)"
}

let subscription = foodBank
    .zip(timer)
    .tryMap {(foodItem, timestamp) in
        try throwAt3Secs(foodItem, timestamp)
    }
    .sink { completion in
        switch completion {
        case .finished:
            print("completion: \(completion)")
        case .failure(let error):
            print("completion: \(error.localizedDescription)")
        }
        
    }
    receiveValue: { value in
        print(value)
    }





//: [Next](@next)
