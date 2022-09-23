//
//  FilterView.swift
//  CarListing
//
//  Created by wizz on 9/14/22.
//

import SwiftUI


struct FilterView: View {
    @State private var selectedStrength = "Mild"
    let strengths = ["Mild", "Medium", "Mature"]
    @Environment(\.dismiss) private var dismiss
    
    static var uniqueKey: String {
        UUID().uuidString
    }
    let modelOptions: [DropdownOption]
    let makeOptions: [DropdownOption]
    
    @State private var tempMin: Double = 0
    @State private var tempMax: Double = 0
    @Binding var minPrice: Double
    @Binding var maxPrice: Double
    
    
    
    @State private var tempMake: DropdownOption?
    @State private var tempModel: DropdownOption?
    @Binding var selectedMake: String
    @Binding var selectedModel: String
    
    
    var body: some View {
        
        VStack(spacing: 16){
            HStack{
                Spacer()
                Button{
                    selectedMake = ""
                    selectedModel = ""
                    minPrice = 0
                    maxPrice = 0
                    dismiss()
                } label: {
                    Image(systemName: "x.circle")
                        .resizable()
                        .frame(width:26, height: 26, alignment: .center)
                        .foregroundColor(.secondary)
                }
            }
            Group {
                DropdownSelector(
                    placeholder: "Make",
                    options: makeOptions,
                    onOptionSelected: { option in
                        tempMake = option
                        print(option)
                    })
                
            }.zIndex(100)
            
            Group {
                DropdownSelector(
                    placeholder: "Model",
                    options: modelOptions,
                    onOptionSelected: { option in
                        tempModel = option
                        print(option)
                    })
            }.zIndex(90)
            
            VStack(alignment:.leading) {
                Group{
                    Slider(value: $tempMin, in: 0...10000000)
                    Text("Min price : \(tempMin, specifier: "%.0f")")
                }
                Group{
                    Slider(value: $tempMax, in: 0...10000000)
                    Text("Max Price : \(tempMax, specifier: "%.0f")")
                }
            }.zIndex(80)
            
            Button{
                selectedMake = tempMake?.value ?? ""
                selectedModel = tempModel?.value ?? ""
                maxPrice = tempMax
                minPrice = tempMin
                dismiss()
            } label: {
                HStack{
                    Image(systemName: "magnifyingglass")
                    Text("Filter")
                }
            }
            .buttonStyle(.borderedProminent)
            .shadow(radius: 5)
        }
        .padding()
        .cornerRadius(30)
        .background(Color.white)
        .shadow(radius: 5)
    }
}

//struct FilterView_Previews: PreviewProvider {
//    static var previews: some View {
//        FilterView(modelOptions: <#[DropdownOption]#>, makeOptions: <#[DropdownOption]#>)
//    }
//}
