//
//  User.swift
//  Day13_Assignment
//
//  Created by Rayaheen Mseri on 19/09/1446 AH.
//

struct UserPost: Codable, Identifiable {
    let id: Int
    let userId: Int
    let title: String
    let body: String
}
