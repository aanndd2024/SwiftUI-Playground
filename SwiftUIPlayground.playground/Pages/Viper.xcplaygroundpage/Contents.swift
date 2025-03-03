//: [Previous](@previous)

import Foundation
import SwiftUI
import PlaygroundSupport


// Model
struct User: Identifiable {
    let id: Int
    let name: String
    let details: String
}

//Interacter(Business Logic)
protocol UserInteractorProtocol {
    func fetchUsers() -> [User]
}

class UserInteractor: UserInteractorProtocol {
    func fetchUsers() -> [User] {
        return [
            User(id: 1, name: "Alice", details: "iOS Developer at XYZ"),
            User(id: 2, name: "Bob", details: "Product Manager at ABC"),
            User(id: 3, name: "Charlie", details: "Software Engineer at DEF")
        ]
    }
}

//Presenter - Data Formatting
protocol UserPresenterProtocol: ObservableObject {
    var users: [User] { get }
    func loadUsers()
}

class UserPresenter: UserPresenterProtocol {
    @Published var users: [User] = []
    
    private let interactor: UserInteractorProtocol
    
    init(interactor: UserInteractorProtocol) {
        self.interactor = interactor
    }
    
    func loadUsers() {
        users = interactor.fetchUsers()
    }
}

//Router - Screen Navigation

protocol UserRouterProtocol {
    func goToDetail(user: User) -> UserDetailsView
}

class UserRouter: UserRouterProtocol {
    func goToDetail(user: User) -> UserDetailsView {
        return UserDetailsView(user: user)
    }
}

// View - SwiftUI View
struct UserListView: View {
    @StateObject var presenter: UserPresenter
    private let router = UserRouter()

    var body: some View {
        NavigationStack {
            List(presenter.users) { user in
                NavigationLink(destination: router.goToDetail(user: user)) {
                    Text(user.name)
                }
            }
            .onAppear {
                presenter.loadUsers()
            }
            .navigationTitle("Users")
        }
    }
}

struct UserDetailsView: View {
    let user: User
    
    var body: some View {
        VStack {
            Text(user.name)
                .font(.largeTitle)
                .bold()
            
            Text(user.details)
                .font(.body)
                .padding()
            
            Spacer()
        }
        .navigationTitle("User Details")
        .padding()
    }
}


let interactor = UserInteractor()
let presenter = UserPresenter(interactor: interactor)
PlaygroundPage.current.setLiveView(UserListView(presenter: presenter))
//: [Next](@next)
