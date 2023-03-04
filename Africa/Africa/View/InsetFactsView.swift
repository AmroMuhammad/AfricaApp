//
//  InsetFactsView.swift
//  Africa
//
//  Created by Amr Muhammad on 04/03/2023.
//

import SwiftUI

struct InsetFactsView: View {
    
    let animal:Animal
    var body: some View {
        GroupBox{
            TabView{
                    ForEach(animal.fact,id: \.self){item in
                        Text(item)
                            .multilineTextAlignment(.center)
                            .padding()
                }
            }
            .tabViewStyle(PageTabViewStyle())
            .frame(minHeight: 148,idealHeight: 168,maxHeight: 180 )
        }.padding()
    }
}

struct InsetFactsView_Previews: PreviewProvider {
    static let animals:[Animal] = Bundle.main.decode("animals.json")
    static var previews: some View {
        InsetFactsView(animal: animals[0])
            .previewLayout(.sizeThatFits)
            .padding()
    }
}
