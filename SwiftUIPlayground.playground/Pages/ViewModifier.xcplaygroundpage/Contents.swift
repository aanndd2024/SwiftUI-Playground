//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport

struct ViewModifierView: View {
    var body: some View {
        VStack {
            Text("Hello World")
                .padding()
                .roundedBorder(color: .gray, width: 2.0, cornerRadius: 5)
            Text("Hello India")
                .padding()
                .roundedBorder(color: .cyan, width: 2.0, cornerRadius: 5)
            Text("Hello America")
                .padding()
                .roundedBorder(color: .red, width: 2.0, cornerRadius: 5)
        }
    }
}

//Add modifies in extension
extension View {
    func roundedBorder(color: Color = .blue, width: CGFloat = 2, cornerRadius: CGFloat = 10) -> some View {
            self.modifier(RoundedBorderModifier(color: color, width: width, cornerRadius: cornerRadius))
        }
}

struct RoundedBorderModifier: ViewModifier {
    let color:Color
    let width:CGFloat
    let cornerRadius: CGFloat
    
    func body(content: Content) -> some View {
        content
            .overlay (
                RoundedRectangle(cornerRadius: cornerRadius)
                    .stroke(color, lineWidth: width)
            )
    }
}
//PlaygroundPage.current.setLiveView(ViewModifierView())



struct CustomButtonView: View {
    var body: some View {
        Button {
            
        } label: {
            Text("Click Me!!")
                .font(.headline)
                .foregroundStyle(.white)
                .frame(width: 150)
                .frame(height: 50)
                .background(Color.blue)
                .cornerRadius(10)
        }.setPressableButtonStyle()
            .padding()
        
    }
}

extension View {
    func setPressableButtonStyle() -> some View {
        buttonStyle(AdvancedButtonStyle())
    }
}

struct AdvancedButtonStyle: ButtonStyle {
    var backgroundColor: Color = .blue
    var foregroundColor: Color = .white
    var cornerRadius: CGFloat = 10
    var disabledBackgroundColor: Color = .gray
    var shadowColor: Color = .black

    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .padding()
            .background(configuration.isPressed ? backgroundColor.opacity(0.7) : backgroundColor)
            .foregroundColor(foregroundColor)
            .cornerRadius(cornerRadius)
            .shadow(color: shadowColor, radius: 5, x: 0, y: 4)
            .scaleEffect(configuration.isPressed ? 0.95 : 1.0)  // Scale effect when pressed
            .animation(.easeInOut(duration: 0.2), value: configuration.isPressed)  // Animation for the press effect
    }
}

PlaygroundPage.current.setLiveView(CustomButtonView())

//: [Next](@next)
