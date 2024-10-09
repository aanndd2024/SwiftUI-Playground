//: [Previous](@previous)

import SwiftUI
import PlaygroundSupport

struct ButtonView: View {
   
    var body: some View {
        VStack {
            Button {
                print("hello")
            } label: {
                Text("Button1")
                    .font(.title)
                    .background(.purple)
                    .foregroundColor(.white)
                    .padding()
            }
            Button {
                print("hello")
            } label: {
                Text("Button2")
                    .padding()
                    .background(.purple)
                    .foregroundColor(.white)
                    .font(.title)
            }
            Button {
                print("hello")
            } label: {
                Text("Button3")
                    .padding()
                    .background(.purple)
                    .foregroundColor(.white)
                    .font(.title)
                    .padding(10)
                    .border(.purple, width: 5)
            }
            
            Button {
                print("hello")
            } label: {
                Text("Button4")
                    .padding()
                    .background(.purple)
                    .cornerRadius(40)
                    .foregroundColor(.white)
                    .padding(10)
                    .overlay {
                        RoundedRectangle(cornerRadius: 40)
                            .stroke(.purple, lineWidth: 5)
                    }
            }
            Button {
                print("Button with System Image")
            } label: {
                Image(systemName: "trash")
                    .font(.title)
                    .foregroundStyle(.purple)
                    .padding()
            }
            Button {
                print("Button with System Image")
            } label: {
                Image(systemName: "trash")
                    .font(.largeTitle)
                    .padding()
                    .foregroundStyle(.white)
                    .background(.purple)
                    .clipShape(.circle)
            }
            Button {
                print("Button with System Image")
            } label: {
                HStack {
                    Image(systemName: "trash")
                        .font(.largeTitle)
                    Text("Delete")
                        .font(.title)
                        .fontWeight(.medium)
                }
                .padding()
                .font(.title)
                .foregroundStyle(.white)
                .background(.red)
                .clipShape(.capsule)
            }
            
            Button {
                print("Button with System Image")
            } label: {
                HStack {
                    Image(systemName: "plus.circle")
                        .font(.largeTitle)
                    Text("Add")
                        .font(.title)
                        .fontWeight(.medium)
                }
                .padding()
                .font(.title)
                .foregroundStyle(.white)
                .background(LinearGradient(gradient:Gradient(colors: [.red, .blue]), startPoint: .top, endPoint: .bottom))
                .clipShape(.capsule)
            }
            
            Button {
                print("Button with System Image")
            } label: {
                HStack {
                    Image(systemName: "trash")
                        .font(.largeTitle)
                    Text("Delete")
                        .font(.title)
                        .fontWeight(.medium)
                }
            }
            .buttonStyle(CustomButtonStyle())
        }
    }
}

struct CustomButtonStyle: ButtonStyle {
    func makeBody(configuration: Configuration) -> some View {
        configuration.label
            .font(.title)
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding()
            .foregroundStyle(.white)
            .background(LinearGradient(gradient: Gradient(colors: [.red, .green]), startPoint: .leading, endPoint: .trailing))
            .clipShape(.capsule)
            .scaleEffect(configuration.isPressed ? 0.9 : 1.0)
    }
}

PlaygroundPage.current.setLiveView(ButtonView())

//: [Next](@next)
