//
//  ContentView.swift
//  MyFilms
//
//  Created by Joao Leal on 8/12/24.
//

import SwiftUI
import SwiftData

struct FilmListView: View {
    @Environment(\.modelContext) private var context
    @Query(sort: \Film.title)private var films: [Film]
    
    @State private var createNewBook = false
    var body: some View {
        NavigationStack {
            Group{
                if films.isEmpty{
                    ContentUnavailableView("Enter your first film", systemImage: "film")
                }
                else{
                    List{
                        ForEach(films){ film in
                            NavigationLink {
                               EditFilmView(film: film)
                            } label: {
                                VStack(alignment: .leading) {
                                    Text(film.title).font(.title2)
                                    Text(film.year).foregroundStyle(.secondary)
                                    if let rating = film.rating{
                                        HStack{
                                            ForEach(0..<rating, id: \.self) {
                                                _ in
                                                Image(systemName: "star.fill")
                                                    .foregroundStyle(.yellow)
                                            }
                                        }
                                    }
                                }
                            }
                        }
                        .onDelete { indexSet in
                            indexSet.forEach{index in
                                let film = films[index]
                                context.delete(film)
                            }
                        }
                    }
                    
                    .listStyle(.plain)
                }}
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
