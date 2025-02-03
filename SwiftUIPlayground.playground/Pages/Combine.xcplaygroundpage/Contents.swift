//: [Previous](@previous)

import Foundation
import Combine

//MAP
struct Person {
    var name: String
    var birthYear: Int
}

let publisher = Just(Person(name: "Anand", birthYear: 1985))

let subscription = publisher.map { person in
    let currentYear = Calendar.current.component(.year, from: Date())

    let age = currentYear - person.birthYear
    return "\(person.name) is \(age) years old."
}
    .sink { result in
    print(result)
}

let numbers = [1, 2, 3, 4, 5]
let numberPublisher = numbers.publisher

let squarePublisher = numberPublisher.map { $0 * $0 }

let cancellable = squarePublisher.sink { value in
    print(value)
}

//MERGE
let num1 = [1, 2, 3, 4, 5].publisher
let num2 = [6, 7, 8, 9, 10].publisher

let mergedPublisher = Publishers.Merge(num1, num2)
let cancellable1 = mergedPublisher.sink { value in
    print(value)
}

//FILTER
let filterPublisher = num1.filter { $0 % 2 == 0 }
let cancellable2 = filterPublisher.sink {value in
    print(value)
}

//ZIP Publisher
let publisher1 = [1, 2, 3, 4, 5].publisher
let publisher2 = ["A", "B", "C", "D", "E"].publisher
let publisher3 = ["Ajay", "Rahul", "Ashok", "Sudhir", "Mohan"].publisher

let zipPublisher = Publishers.Zip3(publisher1, publisher2, publisher3)

let cancellable3 = zipPublisher.sink { value in
    print(value.0)
    print(value.1)
    print(value.2)
}

//PassThrough
//let subject = PassthroughSubject<Int, Never>()
//let cancellable4 = subject.sink{ value in
//    print(value)
//}
//subject.send(4)
//subject.send(9)

// Create a CurrentValueSubject with an initial value of 0
//let subject = CurrentValueSubject<Int, Never>(0)

// Create a PassthroughSubject that emits Strings
let subject = PassthroughSubject<Int, Never>()

// Subscribe to receive values
let subscription11 = subject.sink { value in
    print("Received:", value)
}

// Send new values
subject.send(10)
subject.send(20)
//: [Next](@next)
