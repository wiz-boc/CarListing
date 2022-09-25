//
//  ContentView.swift
//  CarListing
//
//  Created by wizz on 9/8/22.
//

import SwiftUI

struct ListingView: View {
    @EnvironmentObject var viewModel: CarlistViewModel
    @State var isFilterViewShowing = false
    
    
    var body: some View {
        NavigationView {
            VStack{
                ScrollView{
                    ForEach(viewModel.carList){ car in
                        CarCardView(car: car,selectedCar:$viewModel.selectedCar)
                    }
                }
            }.toolbar {
                ToolbarItem(placement: .navigationBarTrailing) {
                    Button{
                        isFilterViewShowing.toggle()
                    }label: {
                        Image(systemName: "wave.3.left")
                            .resizable()
                            .frame(width: 16, height: 16, alignment: .center)
                            .rotationEffect(Angle(degrees: 90))
                    }
                }
            }
            .navigationTitle("SwiftUI")
            .navigationBarTitleDisplayMode(.inline)
            .fullScreenCover(isPresented: $isFilterViewShowing) {
                FilterView(modelOptions: viewModel.modelListOption, makeOptions: viewModel.makeListOption, minPrice: $viewModel.minPrice, maxPrice: $viewModel.maxPrice, selectedMake: $viewModel.selectedMake, selectedModel: $viewModel.selectedModel)
                    .cornerRadius(20)
                    .padding()
                    .frame(maxWidth: .infinity, maxHeight: .infinity)
                    .background(BackgroundBlurView().ignoresSafeArea())
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

struct BackgroundBlurView: UIViewRepresentable {
    func makeUIView(context: Context) -> UIView {
        let view = UIVisualEffectView(effect: UIBlurEffect(style: .light))
        DispatchQueue.main.async {
            view.superview?.superview?.backgroundColor = .clear
        }
        return view
    }
    
    func updateUIView(_ uiView: UIView, context: Context) {}
}
