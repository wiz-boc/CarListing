//
//  ContentView.swift
//  CarListing
//
//  Created by wizz on 9/8/22.
//

import SwiftUI

struct ListingView: View {
    @EnvironmentObject var viewModel: CarlistViewModel
    var body: some View {
        VStack{
            ScrollView{
                ForEach(viewModel.carList){ car in
                    CarCardView(car: car)
                }
            }
        }
    }
}

struct ListingView_Previews: PreviewProvider {
    static var previews: some View {
        ListingView()
            .environmentObject(CarlistViewModel())
    }
}
