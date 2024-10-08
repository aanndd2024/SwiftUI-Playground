//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct CardView: View {
   
    var body: some View {
        ScrollView(.horizontal, showsIndicators: false) {
            HStack {
                Group {
                    CardDetailsView(image: "star.fill", category: "SwiftUI", heading: "Why Swift is Protocol Oriented?", author: "James Paur")
                    CardDetailsView(image: "star.fill", category: "Mac OSX", heading: "Building a simple editing Application", author: "Gabriel Yadav")
                    CardDetailsView(image: "star.fill", category: "Flutter", heading: "Flutter - A future programming language", author: "Lawrence Mishra")
                    CardDetailsView(image: "star.fill", category: "React native", heading: "Building Instagram clone", author: "Simon Gupta")
                }.frame(width: 300)
                
            }
            Spacer()
            .padding(.all)
        }
        
    }
}

struct CardDetailsView:View {
    var image: String
    var category: String
    var heading: String
    var author: String
    var body: some View {
        VStack {
            Image(systemName: image)
                .resizable()
                .aspectRatio(contentMode: .fit)
            HStack {
                VStack(alignment: .leading) {
                    Text(category)
                        .font(.headline)
                        .foregroundColor(.secondary)
                    Text(heading)
                        .font(.title)
                        .fontWeight(.black)
                        .foregroundColor(.primary)
                        .lineLimit(3)
                    Text("Written by \(author)".uppercased())
                }
                Spacer()
            }
        }
    }
}

PlaygroundPage.current.setLiveView(CardView())

//: [Next](@next)
