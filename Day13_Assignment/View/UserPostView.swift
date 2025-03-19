//
//  ContentView.swift
//  Day13_Assignment
//
//  Created by Rayaheen Mseri on 19/09/1446 AH.
//

import SwiftUI

struct UserPostView: View {
    // A view model to manage fetching the users' data
    @StateObject var viewModel = UserPostViewModel()
    
    // A flag to ensure data is only loaded once
    @State private var hasLoaded = false
    
    // A flag to control the visibility of the post list
    @State private var showList: Bool = false
    
    var body: some View {
        NavigationStack {
            ZStack {
                // Background image covering the entire screen
                Image("background")
                    .resizable()
                    .scaledToFill()
                    .ignoresSafeArea()
                
                VStack {
                    // Display "show posts" button if the list isn't visible
                    if !showList {
                        VStack {
                            Spacer()
                            Text("show posts")
                                .background {
                                    Capsule()
                                        .fill(Color.black)
                                        .frame(width: 200, height: 50)
                                }
                                .foregroundColor(.white)
                                .onTapGesture {
                                    // When the button is tapped, toggle showList to true
                                    showList = true
                                }
                        }.padding()
                    } else {
                        // Show loading spinner if data is still being fetched
                        VStack {
                            if viewModel.isLoading {
                                ProgressView("Loading...")
                                    .progressViewStyle(CircularProgressViewStyle())
                                    .scaleEffect(1.5)
                                    .foregroundColor(.white)
                            } else {
                                // Once data is loaded, display the list of users
                                VStack {
                                    List {
                                        ForEach(viewModel.users, id: \.id) { user in
                                            Section {
                                                HStack {
                                                    // User avatar
                                                    VStack{
                                                        Image(systemName: "person.circle.fill")
                                                            .resizable()
                                                            .frame(width: 50, height: 50)
                                                            .padding([.top, .trailing], 10)
                                                            .foregroundColor(.white)
                                                        
                                                        Spacer()
                                                    }
                                                    VStack(alignment: .leading) {
                                                        // User post title and body
                                                        Text(user.title)
                                                            .font(.headline)
                                                            .fontWeight(.bold)
                                                            .foregroundColor(.white)
                                                        
                                                        Text(user.body)
                                                            .foregroundColor(.white)
                                                    }
                                                }
                                            }
                                        }
                                        .listRowBackground(Color.black.blur(radius: 5).opacity(0.2))
                                    }
                                    .scrollContentBackground(.hidden)
                                }.padding()
                            }
                        }
                        .onAppear {
                            // Fetch users only if data hasn't been loaded yet
                            if !hasLoaded {
                                viewModel.fetchUsers()
                                hasLoaded = true
                            }
                        }
                    }
                }
                .padding()
                // Toolbar at the top
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        Text("Posts")
                            .fontWeight(.bold)
                            .font(.largeTitle)
                            .foregroundColor(.white)
                    }
                    
                    // Button to navigate to the CreatePostView
                    ToolbarItem(placement: .navigationBarTrailing) {
                        NavigationLink(destination: CreatePostView()) {
                            Image(systemName: "plus.circle")
                                .resizable()
                                .frame(width: 30, height: 30)
                                .foregroundColor(.white)
                                .padding(.trailing)
                        }
                    }
                }
            }
        }
        // Show error alert if there is an error
        .alert(isPresented: $viewModel.showErrorAlert) {
            Alert(title: Text("Error"), message: Text(viewModel.errorMessage), dismissButton: .default(Text("OK")))
        }
    }
}

#Preview {
    UserPostView()
}
