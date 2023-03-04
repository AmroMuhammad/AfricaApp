//
//  ExternalWebLinkView.swift
//  Africa
//
//  Created by Amr Muhammad on 04/03/2023.
//

import SwiftUI

struct ExternalWebLinkView: View {
    let animal:Animal
    var body: some View {
        GroupBox{
            HStack {
                Image(systemName: "globe")
                Text("WikiPedia")
                
                Spacer()
                
                Group{
                    Link(animal.name,destination: URL(string: animal.link) ?? URL(string:"https://wikipedia.org")!)
                    
                    Image(systemName: "arrow.up.right.square")
                    
                }
                .foregroundColor(.accentColor)
            }

        }
    }
}

struct ExternalWebLinkView_Previews: PreviewProvider {
    static let aniamls:[Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        ExternalWebLinkView(animal: aniamls[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
