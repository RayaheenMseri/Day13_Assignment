//
//  PostViewModel.swift
//  Day13_Assignment
//
//  Created by Rayaheen Mseri on 19/09/1446 AH.
//


import SwiftUI
import Alamofire
class PostViewModel: ObservableObject {
    // Properties to store post data, loading state, and error state
    @Published var title: String = ""  // Post title
    @Published var body: String = ""   // Post body
    @Published var postResponse: Post?  // Response containing the created post
    @Published var isLoading: Bool = false  // Indicates if the post creation is in progress
    @Published var showErrorAlert: Bool = false  // Flag to show error alert
    @Published var errorMessage: String = ""  // Holds the error message

    // URL for the API endpoint to create a post
    private let url = "https://jsonplaceholder.typicode.com/posts"

    // Method to create a new post
    func createPost() {
        // Set the loading state to true while the request is being processed
        isLoading = true
        
        // Prepare the parameters for the post request (title and body)
        let parameters: [String: Any] = ["title": title, "body": body]
        
        // Make a POST request using Alamofire
        AF.request(url, method: .post, parameters: parameters, encoding: JSONEncoding.default)
            .validate()  // Validate the response
            .responseDecodable(of: Post.self) { response in  // Decode the response as a Post object
                DispatchQueue.main.async {
                    // Update UI-related properties on the main thread
                    self.isLoading = false  // Stop loading animation
                    
                    switch response.result {
                    case .success(let data):  // Successfully received the post data
                        self.postResponse = data  // Assign the response to the postResponse property

                    case .failure(let error):  // Failed to send the data
                        // Set the error message and show the alert
                        self.errorMessage = "Failed to send data: \(error.localizedDescription)"
                        self.showErrorAlert = true
                    }
                }
            }
    }
}
