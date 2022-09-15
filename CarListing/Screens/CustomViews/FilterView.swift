//
//  FilterView.swift
//  CarListing
//
//  Created by wizz on 9/14/22.
//

import SwiftUI

struct FilterView: View {
    var body: some View {
        ZStack{
            Color.secondary
            VStack{
                Form{
                    Section {
                        Text("Hello, world!")
                    }
                    
                    Section {
                        Text("Hello, world!")
                        Text("Hello, world!")
                    }
                }
            }
        }
        .cornerRadius(30)
    }
}

struct FilterView_Previews: PreviewProvider {
    static var previews: some View {
        FilterView()
    }
}
