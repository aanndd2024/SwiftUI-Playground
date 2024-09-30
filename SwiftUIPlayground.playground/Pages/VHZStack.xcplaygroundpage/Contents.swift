//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct ContentView: View {
   
    var body: some View {
        VStack {
            HeaderView()
            HStack {
                PricingView(title: "Basic", price: "$9", txtColor: .white, bgColor: .purple)
                ZStack(alignment:.top) {
                    PricingView(title: "Pro", price: "$19", txtColor: .white, bgColor: .gray)
                    Image(systemName: "crown.fill")
                        .foregroundStyle(.yellow)
                        .offset(x:-40, y: 10)
                }
               
            }.padding()
            PricingView(title: "Team", price: "$99", txtColor: .white, bgColor: .yellow)
            Spacer()
        }
    }
}
struct HeaderView: View {
    var body: some View {
        HStack {
            VStack(alignment:.leading, spacing: 2) {
                Text("Choose")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .fontDesign(.rounded)
                Text("Select Plan")
                    .font(.largeTitle)
                    .fontWeight(.black)
                    .fontDesign(.rounded)
            }.padding(.leading, 20)
            Spacer()
        }
        
    }
}

struct PricingView: View {
    var title:String
    var price:String
    var txtColor:Color
    var bgColor:Color
    var body: some View {
        VStack {
            Text(title)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(txtColor)
            Text(price)
                .font(.title)
                .fontWeight(.medium)
                .foregroundColor(txtColor)
            Text("per month")
                .font(.title3)
        }
        .padding()
        .background(bgColor)
        .cornerRadius(10)
    }
}


PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
