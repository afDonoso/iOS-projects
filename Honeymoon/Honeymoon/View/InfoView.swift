//
//  InfoView.swift
//  Honeymoon
//
//  Created by Andres Donoso on 30/12/23.
//

import SwiftUI

struct InfoView: View {
    //MARK: - PROPERTIES
    @Environment(\.dismiss) var dismiss
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.vertical) {
            VStack(spacing: 20) {
                HeaderComponent()
                
                Spacer(minLength: 10)
                
                Text("App Info")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                AppInfoView()
                
                Text("Credits")
                    .fontWeight(.black)
                    .modifier(TitleModifier())
                
                CreditsView()
                
                Spacer(minLength: 10)
                
                Button(action: {
                    dismiss()
                }, label: {
                    Text("Continue".uppercased())
                        .modifier(ButtonModifier())
                })
            } //: VStack
            .frame(minWidth: 0, maxWidth: .infinity)
            .padding(.top, 15)
            .padding(.bottom, 25)
            .padding(.horizontal, 25)
        }
    }
}

#Preview {
    InfoView()
}

struct AppInfoView: View {
    var body: some View {
        VStack(spacing: 10) {
            RowAppInfoView(item1: "Application", item2: "Honeymoon")
            RowAppInfoView(item1: "Compatibility", item2: "iPhone/iPad")
            RowAppInfoView(item1: "Developer", item2: "Andrés Donoso")
            RowAppInfoView(item1: "Designer", item2: "Robert Petras")
            RowAppInfoView(item1: "Website", item2: "swiftuimasterclass.com")
            RowAppInfoView(item1: "Version", item2: "1.0.0")
        } //: HStack
    }
}

struct RowAppInfoView: View {
    //MARK: - PROPERTIES
    var item1: String
    var item2: String
    
    //MARK: - BODY
    var body: some View {
        VStack {
            HStack {
                Text(item1)
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text(item2)
            } //: HStack
        } //: VStack
    }
}

struct CreditsView: View {
    var body: some View {
        VStack(alignment: .leading, spacing: 10) {
            HStack {
                Text("Photos")
                    .foregroundStyle(.gray)
                
                Spacer()
                
                Text("Unsplash")
            }
            
            Divider()
            
            Text("Photographers")
                .foregroundStyle(.gray)
            
            Text("Shifaaz Shamoon (Maldives), Grillot Edouard (France), Evan Wise (Greece), Christoph Schulz (United Arab Emirates), Andrew Coelho (USA), Damiano Baschiera (Italy), Daniel Olah (Hungary), Andrzej Rusinowski (Poland), Lucas Miguel (Slovenia), Florencia Potter (Spain), Ian Simmonds (USA), Ian Keefe (Canada), Denys Nevozhai (Thailand), David Köhler (Italy), Andre Benz (USA), Alexandre Chambon (South Korea), Roberto Nickson (Mexico), Ajit Paul Abraham (UK), Jeremy Bishop (USA), Davi Costa (Brazil), Liam Pozz (Australia)")
                .font(.footnote)
        }
    }
}
