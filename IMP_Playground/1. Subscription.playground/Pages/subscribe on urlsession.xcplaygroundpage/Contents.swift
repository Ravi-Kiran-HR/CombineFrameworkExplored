//: [Previous](@previous)

import Foundation
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

let subscription = URLSession.shared.dataTaskPublisher(for: URL(string: "https://jsonplaceholder.typicode.com")!)
    .map({ result in
        print(Thread.isMainThread)
        // do the JSON decoding stuff in backgroud thread
    })
//    .subscribe(on: DispatchQueue.main)
    .receive(on: DispatchQueue.main)// get the completion on main thread
    .sink(receiveCompletion: { _ in }, receiveValue: { value in
        print(Thread.isMainThread)
    })


//: [Next](@next)
