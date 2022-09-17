//
//  CarlistViewModel.swift
//  CarListing
//
//  Created by wizz on 9/11/22.
//

import SwiftUI

class CarlistViewModel: ObservableObject {
    
    private var modelList = [String]()
    private var makeList = [String]()
    @Published var modelListOption = [DropdownOption]()
    @Published var makeListOption = [DropdownOption]()
    
    @Published var carList = [Car]()
    var initailCarList:[Car]? {
        didSet {
            carList = (initailCarList == nil ? [] : initailCarList) ?? []
        }
    }
    init(){
        initailCarList = Bundle.main.decode("car_list.json")
        carList = (initailCarList == nil ? [] : initailCarList) ?? []
        modelList = carList.compactMap{ $0.model }
        makeList = carList.compactMap{ $0.make }
        modelListOption = carList.compactMap{  DropdownOption(key: UUID().uuidString, value: $0.model ) }
        makeListOption = carList.compactMap{  DropdownOption(key: UUID().uuidString, value: $0.make ) }

    }
    
}
