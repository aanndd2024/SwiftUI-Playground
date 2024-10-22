//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct ChildView: View {
    @Binding var isOn: Bool

    var body: some View {
        VStack {
            Image(systemName: isOn ? "lightbulb.fill" : "lightbulb")
                .foregroundStyle(isOn ? .yellow : .black)
            Button("Toggle") {
                isOn.toggle()
            }.foregroundStyle(.black)
        }
    }
}

struct ContentView: View {
    @State private var isLightOn: Bool = false
    var body: some View {
        VStack {
            ChildView(isOn: $isLightOn)
        }
        .frame(width: 400, height: 600)
        .foregroundStyle(isLightOn ? .red : .pink)
    }
}


PlaygroundPage.current.setLiveView(ContentView())
//: [Next](@next)
