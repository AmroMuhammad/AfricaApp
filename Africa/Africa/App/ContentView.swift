//
//  ContentView.swift
//  Africa
//
//  Created by Amr Muhammad on 01/03/2023.
//

import SwiftUI

struct ContentView: View {
    let animals:[Animal] = Bundle.main.decode("animals.json")

    var body: some View {
        NavigationView{
            List{
                CoverImageView()
                    .frame(height: 300)
                    .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)) //change insets for specific cell
                
                ForEach(animals) { animal in
                    AnimalListItemView(animel: animal)

                }
            }
            .navigationBarTitle("Africa", displayMode: .large)
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
