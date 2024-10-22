//: [Previous](@previous)
import SwiftUI
import PlaygroundSupport

class UserProfile: ObservableObject {
    @Published var name: String = "John Doe"
    @Published var age: Int = 25
}


// Main View
struct ContentView: View {
    @StateObject var profile = UserProfile() // Initialize the user profile object
    
    var body: some View {
        NavigationStack {
            VStack {
                Text("Hello, \(profile.name)!")
                    .font(.largeTitle)
                    .padding()
                NavigationLink("Edit Profile") {
                    EditProfileView()
                }
                
                NavigationLink("Profile Details") {
                    ProfileDetailView()
                }
            }
        }
        .environmentObject(profile) // Inject the profile object into the environment
    }
}


// View: Edit Profile
struct EditProfileView: View {
    @EnvironmentObject var profile: UserProfile // Access the shared profile
    
    var body: some View {
        VStack {
            TextField("Enter new name", text: $profile.name)
                .textFieldStyle(RoundedBorderTextFieldStyle())
                .padding()
            
            Stepper("Age: \(profile.age)", value: $profile.age, in: 0...100)
                .padding()
        }
        .padding()
        .navigationTitle("Edit Profile")
    }
}

// View: Profile Details
struct ProfileDetailView: View {
    @EnvironmentObject var profile: UserProfile // Access the shared profile
    
    var body: some View {
        VStack {
            Text("Name: \(profile.name)")
                .font(.title)
                .padding()
            
            Text("Age: \(profile.age)")
                .font(.title)
                .padding()
        }
        .navigationTitle("Profile Details")
    }
}

PlaygroundPage.current.setLiveView(ContentView())

//: [Next](@next)
