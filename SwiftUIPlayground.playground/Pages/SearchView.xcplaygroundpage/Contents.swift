//: [Previous](@previous)
import SwiftUI
import PlaygroundSupport
struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}
struct SimpleListView: View {
    @State var searchStr: String = ""
    @State private var filteredList = [Restaurant]()
    @State private var restaurants = [Restaurant(name: "Cafe Deadend", image: "cafedeadend.jpg"),
                       Restaurant(name: "Homei", image: "homei.jpg"),
                       Restaurant(name: "Teakha", image: "teakha.jpg"),
                       Restaurant(name: "Cafe Loisl", image: "cafeloisl.jpg"),
                       Restaurant(name: "Petite Oyster", image: "petiteoyster.jpg"),
                       Restaurant(name: "For Kee Restaurant", image: "forkeerestaurant.jpg"),
                       Restaurant(name: "Po's Atelier", image: "posatelier.jpg"),
                       Restaurant(name: "Bourke Street Bakery", image: "bourkestreetbakery.jpg"),
                       Restaurant(name: "Haigh's Chocolate", image: "haighschocolate.jpg"),
                       Restaurant(name: "Palomino Espresso", image: "palominoespresso.jpg"),
                       Restaurant(name: "Upstate", image: "upstate.jpg"),
                       Restaurant(name: "Traif", image: "traif.jpg"),
                       Restaurant(name: "Graham Avenue Meats And Deli", image: "grahamavenuemeats.jpg"),
                       Restaurant(name: "Waffle & Wolf", image: "wafflewolf.jpg"),
                       Restaurant(name: "Five Leaves", image: "fiveleaves.jpg"),
                       Restaurant(name: "Cafe Lore", image: "cafelore.jpg"),
                       Restaurant(name: "Waffle & Wolf", image: "wafflewolf.jpg"),
                       Restaurant(name: "Confessional", image: "confessional.jpg"),
                       Restaurant(name: "Barrafina", image: "barrafina.jpg"),
                       Restaurant(name: "Donostia", image: "donostia.jpg"),
                       Restaurant(name: "Royal Oak", image: "royaloak.jpg"),
                       Restaurant(name: "CASK Pub and Kitchen", image: "caskpubkitchen.jpg")]

    var body: some View {
        NavigationStack {
            List(filteredList) { restaurant in
                Text(restaurant.name)
            }
            .listStyle(.plain)
            .navigationTitle("Restaurants")
            .navigationBarTitleDisplayMode(.inline)
            .searchable(text:$searchStr)
            .onChange(of:searchStr) {
                if searchStr.isEmpty {
                    filteredList = restaurants
                } else {
                    filteredList = restaurants.filter {$0.name.contains(searchStr) }
                }
            }.onAppear(perform: {
                filteredList = restaurants
            })
        }
    }
}

PlaygroundPage.current.setLiveView(SimpleListView())

//: [Next](@next)
