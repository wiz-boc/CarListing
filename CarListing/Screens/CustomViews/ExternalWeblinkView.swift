//
//  ExternalWeblinkView.swift
//  CarListing
//
//  Created by wizz on 9/11/22.
//

import SwiftUI

struct ExternalWeblinkView: View {

    let car: Car
    var body: some View {
        GroupBox {
            
            HStack {
                Image(systemName: "globe")
                Text("Model")
                Spacer()
                Group{
                    Text(car.model)
                }
                .foregroundColor(.accentColor)
            }.padding(.bottom)
            
            HStack {
                Image(systemName: "globe")
                Text("Customer Price")
                Spacer()
                Group{
                    Text("$\(car.customerPrice, specifier: "%.2f")")
                }
                .foregroundColor(.accentColor)
            }.padding(.bottom)
            VStack{
                HStack{
                    Image(systemName: "globe")
                    Text("Pros : ")
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 2){
                    ForEach(car.prosList, id: \.self) { pro in
                        HStack(alignment: .center){
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 6, height: 6, alignment: .center)
                                .foregroundColor(.gray)
                            Text(pro)
                        }
                        .padding(.leading,26)
                    }
                }
                //.listStyle(PlainListStyle())
            }
            .padding(.bottom)
            
            VStack{
                HStack{
                    Image(systemName: "globe")
                    Text("Cons : ")
                    Spacer()
                }
                VStack(alignment: .leading, spacing: 2){
                    ForEach(car.consList, id: \.self) { con in
                        HStack(alignment: .center){
                            Image(systemName: "circle.fill")
                                .resizable()
                                .frame(width: 6, height: 6, alignment: .center)
                                .foregroundColor(.gray)
                            Text(con)
                        }
                        .padding(.leading,26)
                    }
                }
                //.listStyle(PlainListStyle())
            }
            .padding(.bottom)
            
            HStack {
                Image(systemName: "globe")
                Text("Website")
                Spacer()
                Group{
                    Image(systemName: "arrow.up.right.square")
                    Link(car.make, destination: (URL(string: car.website) ?? URL(string: "https://wikipedia.org"))!)
                }
                .foregroundColor(.accentColor)
            }
        }
    }
}

struct ExternalWeblinkView_Previews: PreviewProvider {
    static var previews: some View {
        ExternalWeblinkView(car: CarExample.BMWCar)
    }
}
