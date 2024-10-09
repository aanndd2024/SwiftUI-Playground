//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    @State private var name:String = ""
    @State private var isOn: Bool = false
    @State private var friendList: [String] = []
    var body: some View {
        VStack {
            Toggle(isOn: $isOn, label: {
                Text(isOn ? "ON": "OFF")
            }).fixedSize()
            Spacer()
            TextField("Enter Friend Name: ", text:$name)
                .foregroundColor(.white)
                .fixedSize()
                .onSubmit {
                    friendList.append(name)
                    name = ""
                }
            List(friendList, id:\.self) { friend in
                Text(friend)
            }
        }
        .padding()
        .frame(width: 400, height: 600)
        .background(isOn ? .purple : .gray)
    }
}

PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
