//
//  CarCardView.swift
//  CarListing
//
//  Created by wizz on 9/11/22.
//

import SwiftUI
import YouTubePlayerKit

struct CarCardView: View {
    let car: Car
    @State var isExpanded: Bool = false
    @State var playingVideo: Bool = false
    @Binding var selectedCar: Car?

    
    var body: some View {
        VStack(alignment: .leading,spacing: 0){
            mainImageView
            detailsView
            if selectedCar == car   {
                hiddenDetailsView
            }
            expandButton
        }
        .popover(isPresented: $playingVideo){
            YouTubePlayerView(
                YouTubePlayer( source: .video(id: car.videoURL),configuration: .init(autoPlay: true)
            ))
        }
        .cornerRadius(10)
        .overlay(RoundedRectangle(cornerRadius: 10).stroke(Color(.gray), lineWidth: 1))
        .padding()
        
    }
    
}

extension CarCardView {
    var expandButton: some View {
        HStack{
            Button{
                withAnimation {
                    if selectedCar != car {
                        isExpanded.toggle()
                        selectedCar = car
                    }
                }
            }label: {
                HStack{
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 1)
                        .foregroundColor(.gray)
                    Image(systemName: selectedCar == car ? "chevron.up.circle" : "chevron.down.circle")
                        .resizable()
                        .frame(width: 25, height: 25, alignment: .center)
                        .foregroundColor(.secondary)
                    RoundedRectangle(cornerRadius: 15)
                        .frame(height: 1)
                        .foregroundColor(.gray)
                }
            }
            
        }.padding(8)
    }
    
    var mainImageView: some View {
        ZStack{
            Image(car.imageName)
                .resizable()
                .aspectRatio(contentMode: .fit)
            if selectedCar == car  {
                Button{
                    playingVideo.toggle()
                }label: {
                    
                    Image(systemName: "play.circle")
                        .resizable()
                        .scaledToFit()
                        .frame(width: 50, height: 50, alignment: .center)
                        .foregroundColor(.secondary)
                }
            }
            
        }
        .scaleEffect(isExpanded && selectedCar == car ? 1.2 : 1)
        .padding(.bottom, isExpanded && selectedCar == car ? 24 : 8)
    }
    
    var detailsView: some View {
        VStack(alignment: .leading){
            Text(car.make)
                .font(.title)
                .fontWeight(.black)
            Text("$\(car.marketPrice, specifier: "%.2f")")
                .font(.caption)
            HStack{
                ForEach(0...car.rating, id: \.self){ _ in
                    Image(systemName: "star.fill")
                        .foregroundColor(.yellow)
                }
            }
        }
        .padding([.leading,.trailing])
    }
    
    var hiddenDetailsView: some View {
        VStack(alignment: .leading){
            Group{
                ExternalWeblinkView(car: car)
            }
                
        }
        .padding()
    }
}

struct CarCardView_Previews: PreviewProvider {
    static var previews: some View {
        CarCardView(car: CarExample.BMWCar,selectedCar: .constant(CarExample.BMWCar))
    }
}
