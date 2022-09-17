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
    @Environment(\.dismiss) var dismiss
    
    @State private var min: Double = 0
    @State private var max: Double = 0
    static var uniqueKey: String {
        UUID().uuidString
    }
    let modelOptions: [DropdownOption]
    let makeOptions: [DropdownOption]
    
    @State var tempMake: DropdownOption?
    @State var tempModel: DropdownOption?
    @State var selectedMake: DropdownOption?
    @State var selectedModel: DropdownOption?
    
    
    var body: some View {
        
        VStack(spacing: 16){
            HStack{
                Spacer()
                Button{
                    selectedMake = nil
                    selectedModel = nil
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
                    Slider(value: $min, in: 0...10000000)
                    Text("Min price : \(min, specifier: "%.0f")")
                }
                Group{
                    Slider(value: $max, in: 0...10000000)
                    Text("Max Price : \(max, specifier: "%.0f")")
                }
            }.zIndex(80)
            
            Button{
                selectedMake = tempMake
                selectedModel = tempModel
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
