//
//  ContentView.swift
//  Africa
//
//  Created by Andres Donoso on 10/12/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    let animals: [Animal] = Bundle.main.decode("animals.json")
    let haptics = UIImpactFeedbackGenerator(style: .medium)
    
    @State private var isGridViewActive = false
    @State private var gridLayout = [GridItem(.flexible())]
    @State private var gridColumn: Int = 1
    @State private var toolbarIcon: String = "square.grid.2x2"
    
    //MARK: - FUNCTIONS
    func gridSwitch() {
        gridLayout = Array(repeating: .init(.flexible()), count: gridLayout.count % 3 + 1)
        gridColumn = gridLayout.count
        
        // TOOLBAR IMAGE
        switch gridColumn {
            case 1:
                toolbarIcon = "square.grid.2x2"
                break
                
            case 2:
                toolbarIcon = "square.grid.3x2"
                break
                
            case 3:
                toolbarIcon = "rectangle.grid.1x2"
                break
                
            default:
                toolbarIcon = "square.grid.2x2"
        }
    }
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            Group {
                if !isGridViewActive {
                    List {
                        CoverImageView()
                            .frame(height: 300)
                            .listRowInsets(.init(top: 0, leading: 0, bottom: 0, trailing: 0))
                        
                        ForEach(animals) { animal in
                            NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                AnimalListItemView(animal: animal)
                            }
                            .listRowSeparator(.visible)
                        } //: Loop
                        
                        CreditsView()
                            .modifier(CenterModifier())
                    } //: List
                } else {
                    ScrollView(.vertical) {
                        LazyVGrid(columns: gridLayout, alignment: .center, spacing: 10) {
                            ForEach(animals) { animal in
                                NavigationLink(destination: AnimalDetailView(animal: animal)) {
                                    AnimalGridItemView(animal: animal)
                                } //: Link
                            } //: Loop
                        } //: Grid
                        .padding(10)
                        .animation(.easeIn, value: gridColumn)
                    } //: Scroll
                    .scrollIndicators(.hidden)
                } //: Condition
            } //: Group
            .listStyle(.plain)
            .navigationTitle("Africa")
            .navigationBarTitleDisplayMode(.large)
            .toolbar {
                ToolbarItem(placement: .primaryAction) {
                    HStack(spacing: 16) {
                        // LIST
                        Button {
                            print("List view is activated")
                            isGridViewActive = false
                            haptics.impactOccurred()
                        } label: {
                            Image(systemName: "square.fill.text.grid.1x2")
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? Color.primary : Color.accentColor)
                        }
                        .buttonStyle(.plain)

                        // GRID
                        Button {
                            print("Grid view is activated")
                            isGridViewActive = true
                            haptics.impactOccurred()
                            gridSwitch()
                        } label: {
                            Image(systemName: toolbarIcon)
                                .font(.title2)
                                .foregroundStyle(isGridViewActive ? Color.accentColor : Color.primary)
                        }
                        .buttonStyle(.plain)

                    } //: HStack
                } //: ToolbarItem
            } //: Toolbar
        } //: Navigation
    }
}

#Preview {
    ContentView()
}
