//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
   
    var body: some View {
        VStack {
            
            Image(uiImage: #imageLiteral(resourceName: "Paris.jpg"))
                .resizable()
                .aspectRatio(contentMode: .fill)
                .frame(width: 450, height: 750)
                .overlay(
                    VStack {
                        Text("Paris")
                            .font(.largeTitle)
                            .fontWeight(.bold)
                            .foregroundColor(.white)
                            .opacity(0.5)
                        Image(uiImage: #imageLiteral(resourceName: "ProfilePic.jpeg"))
                            .resizable()
                            .frame(width: 70, height: 70)
                            .clipShape(.circle)
                        Image(systemName: "star.circle")
                            .symbolRenderingMode(.palette)
                            .foregroundStyle(.yellow)
                            .font(.largeTitle)
                    }.offset(y:-50)
                )
        }
    }
}

PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
