//
//  ContentView.swift
//  Notes Watch App
//
//  Created by Andres Donoso on 26/12/23.
//

import SwiftUI

struct ContentView: View {
    //MARK: - PROPERTIES
    @AppStorage("lineCount") var lineCount: Int = 1
    
    @State private var notes: [Note] = [Note]()
    @State private var text: String = ""
    
    //MARK: - FUNCTION
    func getDocumentDirectory() -> URL {
        let path = FileManager.default.urls(for: .documentDirectory, in: .userDomainMask)
        return path[0]
    }
    
    func save() {
//        dump(notes)
        
        do {
            let data = try JSONEncoder().encode(notes)
            
            let url = getDocumentDirectory().appendingPathComponent("notes")
            
            try data.write(to: url)
        } catch {
            print("Saving data has failed.")
        }
    }
    
    func load() {
        DispatchQueue.main.async {
            do {
                let url = getDocumentDirectory().appendingPathComponent("notes")
                
                let data = try Data(contentsOf: url)
                
                notes = try JSONDecoder().decode([Note].self, from: data)
            } catch {
                // Do nothing
            }
        }
    }
    
    func delete(offsets: IndexSet) {
        withAnimation {
            notes.remove(atOffsets: offsets)
            save()
        }
    }
    
    //MARK: - BODY
    var body: some View {
        VStack {
            HStack(alignment: .center, spacing: 6) {
                TextField("Add New Note", text: $text)
                
                Button {
                    guard !text.isEmpty else { return }
                    
                    let note = Note(id: UUID(), text: text)
                    
                    notes.append(note)
                    
                    text = ""
                    
                    save()
                } label: {
                    Image(systemName: "plus.circle")
                        .font(.system(size: 42, weight: .semibold))
                }
                .fixedSize()
                .buttonStyle(.plain)
                .foregroundStyle(.accent)
            } //: HStack
            
            Spacer()
            
            if notes.count >= 1 {
                List {
                    ForEach(0..<notes.count, id: \.self) { i in
                        NavigationLink(destination: DetailView(note: notes[i], count: notes.count, index: i)) {
                            HStack {
                                Capsule()
                                    .frame(width: 4)
                                    .foregroundStyle(.accent)
                                
                                Text(notes[i].text)
                                    .lineLimit(lineCount)
                                    .padding(.leading, 5)
                            } //: Note
                        } //: NavigationLink
                    } //: Loop
                    .onDelete(perform: delete)
                } //: List
            } else {
                Spacer()
                
                Image(systemName: "note.text")
                    .resizable()
                    .scaledToFit()
                    .foregroundStyle(.gray)
                    .opacity(0.25)
                    .padding(25)
                
                Spacer()
            } //: Conditional
        } //: VStack
        .navigationTitle("Notes")
        .onAppear {
            load()
        }
    }
}

#Preview {
    ContentView()
}
