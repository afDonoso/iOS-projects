//
//  DishesView.swift
//  Avocados
//
//  Created by Andres Donoso on 27/12/23.
//

import SwiftUI

struct DishesView: View {
    var body: some View {
        HStack(spacing: 4) {
            //MARK: - 1st COLUMN
            VStack(alignment: .leading, spacing: 4) {
                HStack {
                    Image(.iconToasts)
                        .resizable()
                        .modifier(IconModifier())
                    
                    Spacer()
                    
                    Text("Toasts")
                } //: Toasts
                
                Divider()
                
                HStack {
                    Image(.iconTacos)
                        .resizable()
                        .modifier(IconModifier())
                    
                    Spacer()
                    
                    Text("Tacos")
                } //: Tacos
                
                Divider()
                
                HStack {
                    Image(.iconSalads)
                        .resizable()
                        .modifier(IconModifier())
                    
                    Spacer()
                    
                    Text("Salads")
                } //: Salads
                
                Divider()
                
                HStack {
                    Image(.iconHalfavo)
                        .resizable()
                        .modifier(IconModifier())
                    
                    Spacer()
                    
                    Text("Spreads")
                } //: Spreads
            } //: VStack
            
            //MARK: - 2nd COLUMN
            VStack(spacing: 16) {
                HStack {
                    Divider()
                }
                
                Image(systemName: "heart.circle")
                    .font(.title.weight(.ultraLight))
                    .imageScale(.large)
                
                HStack {
                    Divider()
                }
            } //: VStack
            
            //MARK: - 3rd COLUMN
            VStack(alignment: .trailing, spacing: 4) {
                HStack {
                    Text("Guacamole")
                    
                    Spacer()
                    
                    Image(.iconGuacamole)
                        .resizable()
                        .modifier(IconModifier())
                } //: HStack
                
                Divider()
                
                HStack {
                    Text("Sandwich")
                    
                    Spacer()
                    
                    Image(.iconSandwiches)
                        .resizable()
                        .modifier(IconModifier())
                } //: HStack
                
                Divider()
                
                HStack {
                    Text("Soup")
                    
                    Spacer()
                    
                    Image(.iconSoup)
                        .resizable()
                        .modifier(IconModifier())
                } //: HStack
                
                Divider()
                
                HStack {
                    Text("Smoothy")
                    
                    Spacer()
                    
                    Image(.iconSmoothies)
                        .resizable()
                        .modifier(IconModifier())
                } //: HStack
            } //: VStack
        } //: HStack
        .font(.system(.callout, design: .serif))
        .foregroundStyle(.gray)
        .padding(.horizontal)
        .frame(maxHeight: 220)
    }
}

struct IconModifier: ViewModifier {
    func body(content: Content) -> some View {
        content
            .frame(width: 42, height: 42)
    }
}

#Preview(traits: .fixedLayout(width: 414, height: 280)) {
    DishesView()
}
