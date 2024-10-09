//: [Previous](@previous)
import SwiftUI
import PlaygroundSupport

struct ContentView: View {
    var body: some View {
        VStack {
            DrawPieChart()
            DrawProgress(percentage: 100)
        }
        .frame(width: 400, height: 650)
        .padding()
    }
}

struct DrawPieChart: View {
    var body: some View {
        ZStack {
            Path { path in
                path.move(to: CGPoint(x: 200, y: 180))
                path.addArc(center: .init(x: 200, y: 180), radius: 150, startAngle: .degrees(0), endAngle: .degrees(190), clockwise: true)
            }
            .fill(.yellow)
            
            Path { path in
                path.move(to: CGPoint(x: 200, y: 180))
                path.addArc(center: .init(x: 200, y: 180), radius: 150, startAngle: .degrees(190), endAngle: .degrees(110), clockwise: true)
            }
            .fill(.blue)
            
            Path { path in
                path.move(to: CGPoint(x: 200, y: 180))
                path.addArc(center: .init(x: 200, y: 180), radius: 150, startAngle: .degrees(110), endAngle: .degrees(90), clockwise: true)
            }
            .fill(.pink)
            
            Path { path in
                path.move(to: CGPoint(x: 200, y: 180))
                path.addArc(center: .init(x: 200, y: 180), radius: 150, startAngle: .degrees(90), endAngle: .degrees(360), clockwise: true)
            }
            .fill(.purple)
        }
        //.frame(width: 400, height: 600)
    }
}

struct DrawProgress: View {
    let percentage:Double
    @State private var purpleGradient = LinearGradient(gradient: Gradient(colors: [ Color(red: 207/255, green: 150/255, blue: 207/255), Color(red: 107/255, green: 116/255, blue: 179/255) ]), startPoint: .trailing, endPoint: .leading)
    var body: some View {
        VStack {
            Circle()
                .trim(from: 0, to: Double(percentage/100.00))
            .stroke(purpleGradient, lineWidth: 20)
            .frame(width: 300, height: 300)
            .overlay {
                VStack {
                    Text("\(Int(percentage))%")
                        .font(.system(size: 80, weight: .bold, design: .rounded))
                        .foregroundColor(.gray)
                    Text("Complete")
                        .font(.system(.body, design: .rounded))
                        .bold()
                        .foregroundColor(.gray)
                }
            }
        }
    }
}
PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
