//
//  FormRowLinkView.swift
//  TodoApp
//
//  Created by Andres Donoso on 30/12/23.
//

import SwiftUI

struct FormRowLinkView: View {
    //MARK: - PROPERTIES
    var icon: String
    var color: Color
    var text: String
    var link: String
    
    //MARK: - BODY
    var body: some View {
        HStack {
            ZStack {
                RoundedRectangle(cornerRadius: 8, style: .continuous)
                    .fill(color)
                
                Image(systemName: icon)
                    .imageScale(.large)
                    .foregroundStyle(.white)
            } //: ZStack
            .frame(width: 36, height: 36)
            
            Text(text)
                .foregroundStyle(.gray)
            
            Spacer()
            
            Button(action: {
                guard let url = URL(string: link), UIApplication.shared.canOpenURL(url) else {
                    return
                }
                
                UIApplication.shared.open(url)
            }, label: {
                Image(systemName: "chevron.right")
                    .font(.system(size: 14, weight: .semibold, design: .rounded))
            })
            .tint(Color(uiColor: .systemGray2))
        } //: HStack
    }
}

#Preview(traits: .fixedLayout(width: 375, height: 60)) {
    FormRowLinkView(icon: "globe", color: .pink, text: "Website", link: "https://swiftuimasterclass.com")
        .padding()
}
