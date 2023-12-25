//
//  NewTaskItemView.swift
//  Devote
//
//  Created by Andres Donoso on 22/12/23.
//

import SwiftUI

struct NewTaskItemView: View {
    //MARK: - PROPERTIES
    @Environment(\.managedObjectContext) private var viewContext
    
    @AppStorage("isDarkMode") private var isDarkMode = false
    
    @State private var task = ""
    
    @Binding var isShowing: Bool
    
    private var isButtonDisabled: Bool {
        task.isEmpty
    }
    
    //MARK: - FUNCTIONS
    private func addItem() {
        withAnimation {
            let newItem = Item(context: viewContext)
            newItem.timestamp = Date()
            newItem.task = task
            newItem.completion = false
            newItem.id = UUID()
            
            do {
                try viewContext.save()
            } catch {
                let nsError = error as NSError
                fatalError("Unresolved error \(nsError), \(nsError.userInfo)")
            }
            
            task = ""
            hideKeyboard()
            isShowing = false
        }
    }
    
    //MARK: - BODY
    var body: some View {
        VStack {
            Spacer()
            
            VStack(spacing: 16) {
                TextField("New task", text: $task)
                    .foregroundStyle(.pink)
                    .font(.system(size: 24, weight: .bold, design: .rounded))
                    .padding()
                    .background(
                        isDarkMode ? Color(uiColor: .tertiarySystemBackground) : Color(uiColor: .secondarySystemBackground)
                    )
                    .clipShape(.rect(cornerRadius: 10))
                
                Button(action: {
                    addItem()
                    playSound(sound: "sound-ding", type: "mp3")
                }, label: {
                    Spacer()
                    
                    Text("SAVE")
                        .font(.system(size: 24, weight: .bold, design: .rounded))
                    
                    Spacer()
                })
                .padding()
                .foregroundStyle(.white)
                .background(isButtonDisabled ? .gray : .pink)
                .clipShape(.rect(cornerRadius: 10))
                .disabled(isButtonDisabled)
                .onTapGesture {
                    if isButtonDisabled {
                        playSound(sound: "sound-tap", type: "mp3")
                    }
                }
            } //: VStack
            .padding(.horizontal)
            .padding(.vertical, 20)
            .background(isDarkMode ? Color(uiColor: .secondarySystemBackground) : .white)
            .clipShape(.rect(cornerRadius: 16))
            .shadow(color: .black.opacity(0.65), radius: 24)
            .frame(maxWidth: 640)
        } //: Vstack
        .padding()
    }
}

#Preview {
    NewTaskItemView(isShowing: .constant(true))
        .background(.gray)
}
