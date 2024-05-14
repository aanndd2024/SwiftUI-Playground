
import SwiftUI
import PlaygroundSupport

struct Animal {
    var uniqueID : Int
    var name: String
}

struct ContentView: View {
    let animals = [
        Animal(uniqueID: 0, name: "Dog"),
        Animal(uniqueID: 1, name: "Cat"),
        Animal(uniqueID: 2, name: "Parrot")
    ]
    var body: some View {
        List(animals, id: \.uniqueID) { animal in
                    Text(animal.name)
                }

    }
}

PlaygroundPage.current.setLiveView(ContentView())

