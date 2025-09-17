//
//  User.swift
//  Spotify
//
//  Created by Mahesh Behere on 12/09/25.
//

import Foundation


// MARK: - Welcome
struct UserArray: Codable {
    let users: [User]
    let total, skip, limit: Int
}

// MARK: - User
struct User: Codable,Identifiable {
    let id: Int
    let firstName, lastName, maidenName: String
    let age: Int
    let email, phone, username, password: String
    let birthDate: String
    let image: String
    let height, weight: Double
    let eyeColor: String
    
    var work:String{
        "Worker has a some job"
    }
    var education:String{
        "Worker has some education"
    }
    var aboutMe:String{
        "This is the section that read me abount ME"
    }
    
    var images:[String] {
        return [
        "https://picsum.photos/600/600",
        "https://picsum.photos/500/500",
        "https://picsum.photos/400/400"
        ]
    
    }
    
    static var mock:User{
        User(
            id: 444,
            firstName: "Mahesh",
            lastName: "Behere",
            maidenName: "",
            age: 35,
            email: "",
            phone: "8888841458",
            username: "Mahesh",
            password: "",
            birthDate: "",
            image: Constant.randomImage,
            height: 0.0,
            weight: 0.0,
            eyeColor: ""
        )
    }
    
    var basics:[UserInterest]{
        [
            UserInterest(icon: "ruler", emoji: nil, title: "\(height)"),
            UserInterest(icon: "graduationcap", emoji: nil, title: "\(education)"),
            UserInterest(icon: "wineglass", emoji: nil, title: "Socially"),
            UserInterest(icon: "moon.star.fill", emoji: nil, title:"Virgo")
        ]
    }
    
    var interest:[UserInterest]{
        [
            UserInterest(icon: nil, emoji: "🖕", title: "running"),
            UserInterest(icon: nil, emoji: "🏋️‍♀️", title: "gym"),
            UserInterest(icon:nil, emoji: "🎧", title: "music"),
            UserInterest(icon:nil, emoji: "🥠", title:"cooking")
        ]
    }
}
