//
//  AnimalDetailView.swift
//  Africa
//
//  Created by Amr Muhammad on 01/03/2023.
//

import SwiftUI

struct AnimalDetailView: View {
    let animal:Animal
    var body: some View {
        ScrollView(.vertical, showsIndicators: false){
            VStack(alignment: .center, spacing: 20){
                // HERO IMAGE
                
                Image(animal.image)
                    .resizable()
                    .scaledToFit()
                
                // TITLE
                
                Text(animal.name.uppercased())
                    .font(.largeTitle)
                    .fontWeight(.heavy)
                    .multilineTextAlignment(.center)
                    .padding(.vertical, 8)
                    .foregroundColor(.primary)
                    .background(
                        Color.accentColor
                            .frame(height: 6)
                            .offset(y: 24)
                    )
                
                // HEADLINE
                
                Text(animal.headline)
                    .font(.headline)
                    .multilineTextAlignment(.leading)
                    .foregroundColor(.accentColor)
                    .padding(.horizontal)
                
                // GALLERY
                
                Group{
                    HeadingView(headingImage: "photo.on.rectangle.angled", headerText: "Wilderness In Pictures")
                    InsetGalleryView(animal: animal)
                }
                .padding()
                
                // FACTS
                
                Group{
                    HeadingView(headingImage: "questionmark.circle", headerText: "Did you know?")
                    InsetFactsView(animal: animal)
                }.padding()
                
                
                // DESCRIPTION
                Group{
                    HeadingView(headingImage: "info.circle", headerText: "All About \(animal.name)")
                    
                    Text(animal.description)
                        .multilineTextAlignment(.leading)
                        .layoutPriority(1) //add space to child and make parent accept it
                }.padding()
                // MAP
                
                Group{
                    HeadingView(headingImage: "map", headerText: "National Parks")
                    InsetMapView()
                }.padding(.horizontal)
                
                // LINK
                
                Group{
                    HeadingView(headingImage: "books.vertical", headerText: "Learn More")
                    ExternalWebLinkView(animal: animal)
                }
                .padding(.horizontal)
                .padding(.vertical)
                
            }
            .navigationBarTitle("Learn about \(animal.name)",displayMode: .inline)
        }
    }
}
 
struct AnimalDetailView_Previews: PreviewProvider {
    static let animals:[Animal] = Bundle.main.decode("animals.json")

    static var previews: some View {
        NavigationView{
            AnimalDetailView(animal: animals[1])
        }.previewDevice("iPhone 14 Pro")
    }
}
