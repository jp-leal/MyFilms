//
//  ContentView.swift
//  MyFilms
//
//  Created by Joao Leal on 8/12/24.
//

import SwiftUI
import SwiftData

struct FilmListView: View {
    
    @Query(sort: \Film.title)private var films: [Film]
    
    @State private var createNewBook = false
    var body: some View {
        NavigationStack {
            
            List{
                ForEach(films){ film in
                    NavigationLink(destination: Text(film.title)) {
                        //
                    }
                }
            }
            .listStyle(.plain)

            .navigationTitle("My Films")
            .toolbar {
                Button{
                    createNewBook.toggle()
                }label: {
                    Image(systemName: "plus.circle.fill")
                        .imageScale(.large)
                }
            }
            .sheet(isPresented: $createNewBook) {
                FilmView()
                    .presentationDetents([.medium])
            }
    }
        .padding()
    }
}

#Preview {
    FilmListView()
        .modelContainer(for: Film.self, inMemory: true)
}
