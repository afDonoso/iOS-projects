//
//  ContentView.swift
//  TodoApp
//
//  Created by Andres Donoso on 29/12/23.
//

import SwiftUI
import CoreData

struct ContentView: View {
    //MARK: - PROPERTIES
    @Environment(\.managedObjectContext) var context
    
    @FetchRequest(entity: Todo.entity(), sortDescriptors: [
        NSSortDescriptor(keyPath: \Todo.name, ascending: true)
    ])
    var todos: FetchedResults<Todo>
    
    @State private var showingAddTodoView = false
    @State private var animatingButton = false
    @State private var showingSettingsView = false
    
    let themes: [Theme] = themeData
    @ObservedObject var theme = ThemeSettings()
    
    //MARK: - BODY
    var body: some View {
        NavigationView {
            ZStack {
                List {
                    ForEach(todos) { todo in
                        HStack {
                            Circle()
                                .frame(width: 12, height: 12)
                                .foregroundStyle(colorize(priority: todo.priority ?? "Normal"))
                            
                            Text(todo.name ?? "Unknown")
                                .fontWeight(.semibold)
                            
                            Spacer()
                            
                            Text(todo.priority ?? "Unknown")
                                .font(.footnote)
                                .foregroundStyle(Color(uiColor: .systemGray2))
                                .padding(3)
                                .frame(minWidth: 62)
                                .overlay {
                                    Capsule()
                                        .stroke(Color(uiColor: .systemGray2), lineWidth: 0.75)
                                }
                        } //: HStack
                        .padding(.vertical ,10)
                    } //: Loop
                    .onDelete(perform: deleteTodo)
                } //: List
                .navigationTitle("Todo")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar {
                    ToolbarItem(placement: .topBarLeading) {
                        EditButton()
                    }
                    
                    ToolbarItem(placement: .topBarTrailing) {
                        Button(action: {
                            showingSettingsView.toggle()
                        }, label: {
                            Image(systemName: "paintbrush")
                                .imageScale(.large)
                        })
                        .sheet(isPresented: $showingSettingsView, content: {
                            SettingsView()
                        })
                    }
                }//: Toolbar
                .tint(themes[theme.themeSettings].themeColor)
                
                //MARK: - NO TODO ITEMS
                if todos.count == 0 {
                    EmtpyListView()
                }
            } //: ZStack
            .sheet(isPresented: $showingAddTodoView, content: {
                AddTodoView()
                    .environment(\.managedObjectContext, context)
            })
            .overlay(alignment: .bottomTrailing) {
                ZStack {
                    Group {
                        Circle()
                            .fill(themes[theme.themeSettings].themeColor)
                            .opacity(animatingButton ? 0.2 : 0)
                            .scaleEffect(animatingButton ? 1 : 0)
                            .frame(width: 68, height: 68)
                            
                        Circle()
                            .fill(themes[theme.themeSettings].themeColor)
                            .opacity(animatingButton ? 0.15 : 0)
                            .scaleEffect(animatingButton ? 1 : 0)
                            .frame(width: 88, height: 88)
                    }
                    .animation(.easeInOut(duration: 2).repeatForever(autoreverses: true), value: animatingButton)
                    
                    Button(action: {
                        showingAddTodoView.toggle()
                    }, label: {
                        Image(systemName: "plus.circle.fill")
                            .resizable()
                            .scaledToFit()
                            .background(
                                Circle()
                                    .fill(.colorBase)
                            )
                            .frame(width: 48, height: 48)
                }) //: Button
                    .tint(themes[theme.themeSettings].themeColor)
                    .onAppear {
                        animatingButton.toggle()
                    }
                } //: ZStack
                .padding(.bottom, 15)
                .padding(.trailing, 15)
            } //: Add Button Overlay
        } //: NavigationView
    }
    
    //MARK: - FUNCTIONS
    private func deleteTodo(at offsets: IndexSet) {
        for index in offsets {
            let todo = todos[index]
            context.delete(todo)
            
            do {
                try context.save()
            } catch {
                print(error)
            }
        }
    }
    
    private func colorize(priority: String) -> Color {
        switch priority {
            case "High":
                return .pink
                
            case "Normal":
                return .green
                
            case "Low":
                return .blue
                
            default:
                return .gray
        }
    }
}

private let itemFormatter: DateFormatter = {
    let formatter = DateFormatter()
    formatter.dateStyle = .short
    formatter.timeStyle = .medium
    return formatter
}()

#Preview {
    ContentView()
        .environment(\.managedObjectContext, PersistenceController.preview.container.viewContext)
}
