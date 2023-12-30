//
//  AddTodoView.swift
//  TodoApp
//
//  Created by Andres Donoso on 29/12/23.
//

import SwiftUI

struct AddTodoView: View {
    //MARK: - PROPERTIES
    @Environment(\.dismiss) var dismiss
    @Environment(\.managedObjectContext) var context
    
    @State private var name = ""
    @State private var priority = "Normal"
    @State private var errorShowing = false
    @State private var errorTitle = ""
    @State private var errorMessage = ""
    
    let priorities = ["High", "Normal", "Low"]
    
    @ObservedObject var theme = ThemeSettings()
    var themes = themeData
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            VStack {
                VStack(alignment: .leading, spacing: 20) {
                    //MARK: - TODO NAME
                    TextField("Todo", text: $name)
                        .padding()
                        .background(Color(uiColor: .tertiarySystemFill))
                        .clipShape(.rect(cornerRadius: 9))
                        .font(.system(size: 24, weight: .bold))
                    
                    //MARK: - TODO PRIORITY
                    Picker("Priority", selection: $priority) {
                        ForEach(priorities, id: \.self) {
                            Text($0)
                        }
                    }
                    .pickerStyle(.segmented)
                    
                    //MARK: - SAVE BUTTON
                    Button(action: {
                        if name != "" {
                            let todo = Todo(context: context)
                            todo.name = name
                            todo.priority = priority
                            
                            do {
                                try context.save()
                            } catch {
                                print(error)
                            }
                        } else {
                            errorShowing = true
                            errorTitle = "Invalid name"
                            errorMessage = "Make sure to enter something for the new todo item."
                        }
                        
                        dismiss()
                    }, label: {
                        Text("Save")
                            .font(.system(size: 24, weight: .bold))
                            .padding()
                            .frame(minWidth: 0, maxWidth: .infinity)
                            .background(themes[theme.themeSettings].themeColor)
                            .clipShape(.rect(cornerRadius: 9))
                            .foregroundStyle(.white)
                    })
                } //: VStack
                .padding(.horizontal)
                .padding(.vertical, 30)
            } //: VStack
            .navigationTitle("New Todo")
            .navigationBarTitleDisplayMode(.inline)
            .toolbar {
                ToolbarItem(placement: .topBarTrailing) {
                    Button(action: {
                        dismiss()
                    }, label: {
                        Image(systemName: "xmark")
                    })
                }
            }
            .alert(isPresented: $errorShowing, content: {
                Alert(title: Text(errorTitle), message: Text(errorMessage), dismissButton: .default(Text("OK")))
            })
        } //: Navigation
        .tint(themes[theme.themeSettings].themeColor)
    }
}

#Preview {
    AddTodoView()
}
