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
    
    @Published var selectedCar: Car?
    @Published var expandedList = [Bool]()
    @Published var modelListOption = [DropdownOption]()
    @Published var makeListOption = [DropdownOption]()
    @Published var selectedModel = "" {
        didSet {
            if !selectedModel.isEmpty {
                carList = carList.filter{ $0.model == selectedModel }
            }
        }
    }
    @Published var selectedMake = "" {
        didSet {
            carList = (initailCarList == nil ? [] : initailCarList) ?? []
            if !selectedMake.isEmpty {
                carList = carList.filter{ $0.make == selectedMake }
            }
        }
    }
    @Published var maxPrice:Double = 0 {
        didSet {
            if maxPrice > 0 {
                carList = carList.filter{ $0.customerPrice <= maxPrice }
            }
        }
    }
    @Published var minPrice:Double = 0 {
        didSet {
            carList = carList.filter{ $0.customerPrice >= minPrice }
        }
    }
    
    @Published var carList = [Car]() {
        didSet {
            if carList.count > 0 {
                selectedCar = carList[0]
            }
        }
    }
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
        if carList.count > 0 {
            selectedCar = carList[0]
        }
        
    }
    
}
