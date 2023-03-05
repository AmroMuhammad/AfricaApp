//
//  ContentView.swift
//  Africa
//
//  Created by Amr Muhammad on 01/03/2023.
//

import SwiftUI

struct ContentView: View {
    let animals:[Animal] = Bundle.main.decode("animals.json")

    @State private var isGridViewActive = false
    
    @State private var gridLayout: [GridItem] = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"

//    let gridLayout:[GridItem] = Array(repeating: GridItem(.flexible()), count: 2)
    
    func gridSwitch(){
        gridLayout = Array(repeating: GridItem(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        switch gridColumn{
        case 1:
            toolbarIcon = "square.grid.2x2"
        case 2:
            toolbarIcon = "square.grid.3x2"
        case 3:
            toolbarIcon = "rectangle.grid.1x2"
        default:
            toolbarIcon = "square.grid.2x2"
        }
    }
    
    var body: some View {
        NavigationView{
            
            Group{
                if !isGridViewActive {
                    List{
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(EdgeInsets(top: 0, leading: 0, bottom: 0, trailing: 0)) //change insets for specific cell
                        
                        ForEach(animals) { animal in
                            
                            NavigationLink(destination: AnimalDetailView(animal: animal)){
                                AnimalListItemView(animel: animal)
                            }

                        }
                    }
                } else {
                    ScrollView(.vertical,showsIndicators: false){
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10){
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)){
                                    AnimalGridItemView(animal: animal)
                                }
                            }
                        }
                        .padding(10)
                        .animation(.easeIn)
                    }
                }
            }
            .navigationBarTitle("Africa", displayMode: .large)
            .toolbar{
                ToolbarItem(placement: .navigationBarTrailing){
                    HStack(spacing: 16){
                        Button {
                            isGridViewActive = false
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .white : .accentColor)
                        }
                        
                        Button {
                            isGridViewActive = true
                            if gridColumn == 1 {
                                toolbarIcon = "square.grid.3x3"
                                gridSwitch()
                            }else if gridColumn == 2 {
                                toolbarIcon = "square.grid.2x3"
                                gridSwitch()
                            }else{
                                toolbarIcon = "square.grid.1x2"
                                gridSwitch()
                            }
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundColor(isGridViewActive ? .accentColor : .primary)
                        }
                    }
                }
            }
        }
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
