//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

import Foundation

class Restaurant {
    let name: String
    let streetAddress: String
    let city: String
    let state: String
    let reviews: [String]?
    
    init(name: String, streetAddress: String, city: String, state: String, reviews: [String]?) {
        self.name = name
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.reviews = reviews
    }
    
    var hashtags {
         
    }
    
    var restaurans = ["Chipotle", "Papa John", "The Red Lobster", "El Chapin", "Se llama Peru"]
}

class Reviews {
    let username: String
    let text: String
    
    init(username: String, text: String) {
        self.username = username
        self.text = text
    }
    
    var restaurantReviews = ["So Good!", "Ummm.. #eww", "Delish!", "Good service, good food. #awesome"]
    
}

