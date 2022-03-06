//: [Previous](@previous)

// How to create a subscription?
// What does a publisher without a subscription?
// What does data stream mean?


import Foundation
import Combine
import PlaygroundSupport

PlaygroundPage.current.needsIndefiniteExecution = true

var timerSubscription: AnyCancellable? = Timer.publish(every: 0.5, on: .main, in: .common)
    .autoconnect()
    .throttle(for: .seconds(1), scheduler: DispatchQueue.main, latest: true)
    .scan(0, { (count, output)  in
        return count + 1
    })
    .filter({ val in
        val < 5
    })
    .sink { subscriber in
        print("subscriber: \(subscriber)")
    } receiveValue: { value in
        print("value: \(value)")
    }


DispatchQueue.main.asyncAfter(deadline: .now()+15) {
    //    timerSubscription?.cancel()
    timerSubscription = nil
    print("\n timerSubscription Cancelled")
}




//: [Next](@next)



