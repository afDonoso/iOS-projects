//
//  RipeningStagesView.swift
//  Avocados
//
//  Created by Andres Donoso on 27/12/23.
//

import SwiftUI

struct RipeningStagesView: View {
    //MARK: - PROPERTIES
    var ripeningStages = ripeningsData
    
    //MARK: - BODY
    var body: some View {
        ScrollView(.horizontal) {
            VStack {
                Spacer()
                HStack(spacing: 25) {
                    ForEach(ripeningStages) { stage in
                        RipeningView(ripening: stage)
                    }
                }
                .padding(.vertical)
                .padding(.horizontal, 25)
                
                Spacer()
            }
        }
    }
}

#Preview {
    RipeningStagesView()
}
