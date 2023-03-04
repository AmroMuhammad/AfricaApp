//
//  HeadingView.swift
//  Africa
//
//  Created by Amr Muhammad on 02/03/2023.
//

import SwiftUI

struct HeadingView: View {
    
    var headingImage:String
    var headerText:String
    
    var body: some View {
        HStack{
            Image(systemName: headingImage)
                .foregroundColor(.accentColor)
                .imageScale(.large)
            
            Text(headerText)
                .font(.title3)
                .fontWeight(.bold)
        }
    }
}

struct HeadingView_Previews: PreviewProvider {
    static var previews: some View {
        HeadingView(headingImage: "photo.on.rectangle.angled", headerText: "Wilderness In Pictures")
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
