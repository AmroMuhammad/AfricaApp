//
//  AnimalListItemView.swift
//  Africa
//
//  Created by Amr Muhammad on 01/03/2023.
//

import SwiftUI

struct AnimalListItemView: View {
    
    let animel:Animal
    
    var body: some View {
        HStack(alignment: .center, spacing: 16){
            Image(animel.image)
                .resizable()
                .scaledToFill()
                .frame(width: 90,height: 90)
                .cornerRadius(5)
            
            VStack(alignment: .leading, spacing: 8){
                Text(animel.name)
                    .font(.title2)
                    .foregroundColor(.accentColor)
                    .fontWeight(.heavy )
                
                Text(animel.description)
                    .multilineTextAlignment(.leading)
                    .lineLimit(2)
                    .font(.footnote)
                    .padding(.trailing,8)
            }
                
        }
    }
}

struct AnimalListItemView_Previews: PreviewProvider {
    static let animals:[Animal] = Bundle.main.decode("animals.json")

    static var previews: some View {
        AnimalListItemView(animel: animals[2])
            .previewLayout(.sizeThatFits)
            .padding( )
    }
}
