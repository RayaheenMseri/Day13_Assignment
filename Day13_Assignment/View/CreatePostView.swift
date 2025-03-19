//
//  AddPostView.swift
//  Day13_Assignment
//
//  Created by Rayaheen Mseri on 19/09/1446 AH.
//


import SwiftUI
struct CreatePostView: View {
    // ViewModel to manage the data and logic for creating a post
    @StateObject private var viewModel = PostViewModel()

    var body: some View {
        ZStack {
            // Background image for the entire screen
            Image("background")
                .resizable()
                .scaledToFill()
                .ignoresSafeArea()
            
            VStack(spacing: 20) {
                // Title text for the screen
                Text("Create New Post")
                    .foregroundColor(.white)
                    .font(.largeTitle)
                    .padding()

                // Post title label and text field
                Text("Enter Post Title")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 70)
                TextField("", text: $viewModel.title) // Binds to title property of viewModel
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)

                // Post body label and text field
                Text("Enter Post Body")
                    .foregroundColor(.white)
                    .frame(maxWidth: .infinity, alignment: .leading)
                    .padding(.leading, 70)
                TextField("", text: $viewModel.body) // Binds to body property of viewModel
                    .foregroundColor(.white)
                    .padding()
                    .frame(width: 350, height: 50)
                    .background(Color.white.opacity(0.1))
                    .cornerRadius(10)

                // Create Post button triggers the creation of a new post
                Button("Create Post") {
                    viewModel.createPost() // Calls method from viewModel to create post
                }
                .padding()
                .background(.black)
                .foregroundColor(.white)
                .cornerRadius(10)
                
                // ProgressView displayed while the post is being sent
                if viewModel.isLoading {
                    ProgressView("Sending Post...")
                }
                
                // Display the created post details after successful post creation
                if let post = viewModel.postResponse {
                    VStack {
                        Text("Post Created!")
                            .font(.headline)
                            .foregroundColor(.white)
                        Text("Title: \(post.title)") // Show created post title
                        Text("Body: \(post.body)")   // Show created post body
                    }
                    .padding()
                }
            }
            .padding()
            // Alert shown if there's an error while creating the post
            .alert(isPresented: $viewModel.showErrorAlert) {
                Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
            }
        }
    }
}

#Preview {
    CreatePostView()
}
