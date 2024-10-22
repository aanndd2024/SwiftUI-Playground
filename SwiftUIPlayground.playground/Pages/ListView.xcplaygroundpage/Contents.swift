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

struct SimpleListView: View {
    var restaurants = [Restaurant(name: "Cafe Deadend", image: "cafedeadend.jpg"),
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
            List(restaurants) { restaurant in
                ForEach(restaurants.indices, id: \.self) { index in
                    if (0...1).contains(index) {
                        NavigationLink(destination: RestaurantDetailsView(restaurant: self.restaurants[index])) {
                            FullImageRow(restaurant: self.restaurants[index])
                        }
                    } else {
                        NavigationLink(destination: RestaurantDetailsView(restaurant: self.restaurants[index])) {
                            BasicImageRow(restaurant: self.restaurants[index])
                        }
                    }
                }
            }
            .listStyle(.plain)
            .navigationTitle("Restaurants")
            .navigationBarTitleDisplayMode(.inline)
        }
    }
}

struct BasicImageRow: View {
    var restaurant: Restaurant
    var body: some View {
        HStack {
            Image(uiImage: #imageLiteral(resourceName:restaurant.image))
                .resizable()
                .frame(width: 40, height: 40)
                .cornerRadius(5)
            Text(restaurant.name)
        }
    }
}

struct FullImageRow: View {
    var restaurant: Restaurant
    var body: some View {
        ZStack {
            Image(uiImage: #imageLiteral(resourceName:restaurant.image))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(height: 200)
                .cornerRadius(10)
                .overlay(
                    Rectangle()
                        .foregroundColor(.black)
                        .cornerRadius(10)
                        .opacity(0.2)
                )
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
                .foregroundColor(.white)
        }
    }
}

struct RestaurantDetailsView: View {
    var restaurant:Restaurant
    var body: some View {
        VStack {
            Image(uiImage: #imageLiteral(resourceName:restaurant.image))
                .resizable()
                .aspectRatio(contentMode: .fit)
            Text(restaurant.name)
                .font(.system(.title, design: .rounded))
                .fontWeight(.black)
            Spacer()
        }
    }
}

struct Restaurant: Identifiable {
    var id = UUID()
    var name: String
    var image: String
}
PlaygroundPage.current.setLiveView(SimpleListView())

//: [Next](@next)
