//: Playground - noun: a place where people can play

import UIKit

var str = "Hello, playground"

import Foundation

class Restaurant {
    let name: String
    let streetAddress: String
    let city: String
    let state: String
    var reviews: [Reviews]
    
    init(name: String, streetAddress: String, city: String, state: String, reviews: [Reviews] = []) {
        self.name = name
        self.streetAddress = streetAddress
        self.city = city
        self.state = state
        self.reviews = reviews
    }
}

class Reviews {
    let username: String
    let text: String
    
    var hashtags: [String] {
        let words = text.componentsSeparatedByString(" ")//Here we are just getting every section of the string that is searated by a space. in other words, every word of the string
        var hashtagsArray: [String] = []
        for word in words {
            if word.hasPrefix("#") {
                hashtagsArray.append(word)
            }
        }
        return hashtagsArray
    }
    
    init(username: String, text: String) {
        self.username = username
        self.text = text
    }
    
}

let papas = Restaurant(name: "Papa's", streetAddress: "123FakeStreet", city: "SugarHouse", state: "Utah")

let papasReview = Reviews(username: "Karl", text: "Very good! #Good")

print(papasReview.hashtags)





