//
//  CarListingApp.swift
//  CarListing
//
//  Created by wizz on 9/8/22.
//

import SwiftUI

@main
struct CarListingApp: App {
    
    @StateObject var carViewModel = CarlistViewModel()
    var body: some Scene {
        WindowGroup {
            ListingView()
                .environmentObject(carViewModel)
        }
    }
}
