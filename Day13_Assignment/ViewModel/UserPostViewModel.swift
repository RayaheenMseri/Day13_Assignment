//
//  UserViewModel.swift
//  Day13_Assignment
//
//  Created by Rayaheen Mseri on 19/09/1446 AH.
//

import SwiftUI
import Alamofire
extension UserPostView {
    // ViewModel for the UserPostView, responsible for fetching user posts and handling state
    class UserPostViewModel: ObservableObject {
        // Published properties to bind to the view
        @Published var users: [UserPost] = []  // Stores the list of fetched user posts
        @Published var showErrorAlert: Bool = false  // Indicates whether an error alert should be shown
        @Published var errorMessage: String = ""  // Holds the error message if the request fails
        @Published var isLoading: Bool = false  // Indicates whether the data is currently being loaded
        
        // Method to fetch users (posts) from the server
        func fetchUsers() {
            // Set the loading state to true as the request starts
            isLoading = true
            
            // API URL to fetch posts data
            let url = "https://jsonplaceholder.typicode.com/posts"
            
            // Send a GET request using Alamofire
            AF.request(url, method: .get)
                .responseDecodable(of: [UserPost].self) { response in  // Decode the response into an array of UserPost objects
                    DispatchQueue.main.async {
                        // Update UI-related properties on the main thread
                        self.isLoading = false  // Stop loading state
                        
                        // Handle the response based on success or failure
                        switch response.result {
                        case .success(let users):  // Successfully fetched the posts
                            self.users = users  // Assign the fetched posts to the users property
                            
                        case .failure(let error):  // Failed to fetch the posts
                            // Set the error message to display to the user
                            self.errorMessage = "Failed to fetch data: \(error.localizedDescription)"
                            self.showErrorAlert = true  // Trigger the error alert
                        }
                    }
                }
        }
    }
}
