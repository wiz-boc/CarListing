//
//  Car.swift
//  CarListing
//
//  Created by wizz on 9/11/22.
//

import SwiftUI

struct Car: Codable, Identifiable, Equatable {
    let id: String = UUID().uuidString
    let consList : [String]
    let customerPrice:Double
    let make: String
    let marketPrice: Double
    let model: String
    let prosList: [String]
    let rating:Int
    let videoURL: String
    let imageName: String
    let website: String
    
    
}

class CarExample {
        
    static var BMWCar = Car(consList: ["You can heard the engine over children cry at the back, You may lose this one if you divorce"], customerPrice: 65000.0, make: "BMW", marketPrice: 55900.0, model: "3300i", prosList: ["Your average business man car","Can bring the family home safely","The city must have"], rating: 3, videoURL: "", imageName: "", website: "")
}
