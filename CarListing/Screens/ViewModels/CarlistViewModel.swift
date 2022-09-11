//
//  CarlistViewModel.swift
//  CarListing
//
//  Created by wizz on 9/11/22.
//

import SwiftUI

class CarlistViewModel: ObservableObject {
    @Published var carList = [Car]()
    var initailCarList:[Car]? {
        didSet {
            carList = (initailCarList == nil ? [] : initailCarList) ?? []
        }
    }
    init(){
        initailCarList = Bundle.main.decode("car_list.json")
        carList = (initailCarList == nil ? [] : initailCarList) ?? []
    }
}
