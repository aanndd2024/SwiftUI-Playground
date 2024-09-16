//: [Previous](@previous)
import SwiftUI
import PlaygroundSupport

struct Fruit: Identifiable {
    var id = UUID()
    var name: String
    var color: Color
}

struct CustomListView: View {
    let fruits = [
        Fruit(name: "Apple", color: .red),
        Fruit(name: "Banana", color: .yellow),
        Fruit(name: "Orange", color: .orange),
        Fruit(name: "Grapes", color: .purple)
    ]

    var body: some View {
        List(fruits) { fruit in
            HStack {
                Circle()
                    .fill(fruit.color)
                    .frame(width: 30, height: 30)
                Text(fruit.name)
                    .font(.headline)
            }
        }
    }
}
PlaygroundPage.current.setLiveView(CustomListView())

struct SectionedListView: View {
    let fruits = ["Apple", "Banana", "Orange", "Grapes"]
    let vegetables = ["Carrot", "Broccoli", "Lettuce", "Peas"]

    var body: some View {
        List {
            Section(header: Text("Fruits")) {
                ForEach(fruits, id: \.self) { fruit in
                    Text(fruit)
                }
            }
            Section(header: Text("Vegetables")) {
                ForEach(vegetables, id: \.self) { vegetable in
                    Text(vegetable)
                }
            }
        }
        .listStyle(GroupedListStyle())
    }
}

struct SectionedListView_Previews: PreviewProvider {
    static var previews: some View {
        SectionedListView()
    }
}
PlaygroundPage.current.setLiveView(SectionedListView())

//: [Next](@next)
