
# SwiftUI API Calls with Alamofire

This project demonstrates how to make GET and POST API calls using Alamofire in a SwiftUI app. The app fetches data from a public API (JSONPlaceholder) and allows the user to view posts in a list format. Additionally, users can refresh the data to get the latest posts.

## Features

- **GET Request**: Fetches data from `https://jsonplaceholder.typicode.com/posts` using Alamofire.
- **POST Request**: Submits data via a POST request to the same API to create a new post.
- **SwiftUI Integration**: Uses SwiftUI to display the fetched data dynamically.
- **Error Handling**: Gracefully handles network errors and displays appropriate error messages.
- **Refresh Button**: Allows the user to refresh and fetch the latest data.

## Requirements

- Xcode 12.0 or higher
- Swift 5.0 or higher
- Alamofire (version 5.0 or higher) installed via Swift Package Manager

## Installation

1. **Install Alamofire using Swift Package Manager (SPM)**:
   - Open your Xcode project.
   - Go to `File` -> `Swift Packages` -> `Add Package Dependency`.
   - Enter the Alamofire repository URL: `https://github.com/Alamofire/Alamofire`.
   - Select the latest version.

2. **Import Alamofire** in your Swift files where network requests are required.

## How It Works

1. **GET Request**:
   - The app fetches posts from the API using the GET method and displays the results in a list.
   - On tapping the "Refresh" button, the latest data is fetched from the API.

2. **POST Request**:
   - The app sends user input (post title and body) via a POST request to the same API and appends the new post to the list upon success.

3. **Error Handling**:
   - Network request errors are handled gracefully by showing error messages if the request fails.

4. **UI Updates**:
   - The UI automatically updates when new data is fetched or when a new post is created.

## User Interface

- **Main Screen**: Displays a list of posts fetched from the API.
- **Refresh Button**: Fetches the latest posts when pressed.
- **Error Handling**: Displays a message if there’s an issue with fetching or creating posts.

## Running the App

1. Clone the repository.
2. Open the project in Xcode.
3. Build and run the app on a simulator or a real device.
4. Tap the "Refresh" button to fetch the latest posts.
