//
//  FilmView.swift
//  MyFilms
//
//  Created by Joao Leal on 8/12/24.
//

import SwiftUI

struct FilmView: View {
    @Environment(\.modelContext) private var context
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var year = ""
  
    
    var body: some View {
        NavigationStack{
            Form{
                TextField("Title", text: $title)
                TextField("Year", text: $year)
                
                Button("Create") {
                    let newFilm = Film(title: title, year: year)
                    context.insert(newFilm)
                    dismiss()
                }
                .frame(maxWidth: .infinity, alignment: .trailing)
                .buttonStyle(.borderedProminent)
                .padding(.vertical)
                .disabled(title.isEmpty || year.isEmpty)
                .navigationTitle("New Film")
                .navigationBarTitleDisplayMode(.inline)
                .toolbar{
                    Button("Cancel") {
                        dismiss()
                    }
                }
            }
        }
    }
}

#Preview {
    FilmView()
}
