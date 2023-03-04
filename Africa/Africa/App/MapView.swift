//
//  MapView.swift
//  Africa
//
//  Created by Amr Muhammad on 01/03/2023.
//

import SwiftUI
import MapKit

struct MapView: View {
    @State private var region : MKCoordinateRegion = {
        var mapCoordinates = CLLocationCoordinate2D(latitude: 6.600286, longitude: 16.4377599)
        var mapZoomLevel = MKCoordinateSpan(latitudeDelta: 70.0, longitudeDelta: 70.0)
        
        var mapRegion = MKCoordinateRegion(center: mapCoordinates, span: mapZoomLevel)
        
        return mapRegion
    }()
    
    let locations:[NationalParkLocation] = Bundle.main.decode("locations.json")
    
    var body: some View {
        //basic map
        //        Map(coordinateRegion: $region)
        
        //Map with annotation
        Map(coordinateRegion: $region, annotationItems: locations) { item in
            //(A) old style annotation (always static)
            //            MapPin(coordinate: item.location,tint: .accentColor)
            
            //(B) new style (always static)
            //            MapMarker(coordinate: item.location,tint: .accentColor)
            
            //(C) custom annotation (could be interactive)
            
            //            MapAnnotation(coordinate: item.location){
            //                Image("logo")
            //                    .resizable()
            //                    .scaledToFit()
            //                    .frame(width: 32,height: 32,alignment: .center)
            
            //(D) custom advanced  annotation (could be interactive)
            
            MapAnnotation(coordinate: item.location){
                MapAnnotationView(location: item)
                    
            }
            
        }.overlay(
            HStack(alignment: .center, spacing: 12) {
                Image("compass")
                    .resizable()
                    .scaledToFit()
                .frame(width: 48, height: 48, alignment: .center)
                
                VStack(alignment: .leading, spacing: 3){
                    HStack{
                        Text("Longitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        
                        Text("\(region.center.longitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    Divider()
                    
                    HStack{
                        Text("Latitude:")
                            .font(.footnote)
                            .fontWeight(.bold)
                            .foregroundColor(.accentColor)
                        Spacer()
                        
                        Text("\(region.center.latitude)")
                            .font(.footnote)
                            .foregroundColor(.white)
                    }
                    
                }
            }
            .padding(.vertical,12)
            .padding(.horizontal,16)
            .background(
                Color.black
                    .cornerRadius(8)
                    .opacity(0.6)
            )
            .padding()
            , alignment: .top
        )
        
    }
}

struct MapView_Previews: PreviewProvider {
    static var previews: some View {
        MapView()
    }
}
