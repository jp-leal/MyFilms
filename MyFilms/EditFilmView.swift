//
//  EditFilmView.swift
//  MyFilms
//
//  Created by Joao Leal on 8/14/24.
//

import SwiftUI

struct EditFilmView: View {
    @Environment(\.dismiss) var dismiss
    
    @State private var title = ""
    @State private var year = ""
    @State private var summary = ""
    @State private var critique = ""
    @State private var rating: Int?
    @State private var dateAdded = Date.distantPast
    
    @State private var firstView = true
  
    let film: Film
    
    var body: some View {
        VStack{
            LabeledContent{
                Text(dateAdded, style: .date)
                
            } label: {
                Text("Date Added")
            }
            Divider()
            LabeledContent{
                RatingsView(maxRating: 5, currentRating: $rating, width: 30)
            } label: {
                Text("Rating")
            }; LabeledContent {
                TextField("", text: $title)
            } label: {
                Text("Title")
            }
            LabeledContent {
                TextField("", text: $year)
            } label: {
                Text("Year")
            }
            Divider()
            VStack{
                Text("Summary").foregroundStyle(.secondary)
                TextEditor(text: $summary)
                    .padding(5)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(uiColor: .tertiarySystemFill), lineWidth: 2))
                Text("My Critique").foregroundStyle(.secondary)
                TextEditor(text: $critique)
                    .padding(5)
                    .overlay(RoundedRectangle(cornerRadius: 20).stroke(Color(uiColor: .tertiarySystemFill), lineWidth: 2))
        
                
            }}
        .padding()
        .textFieldStyle(.roundedBorder)
        .navigationTitle(title)
        .navigationBarTitleDisplayMode(.inline)
        .toolbar{
            if changed{
                Button("Update") {
                    film.rating = rating
                    film.title = title
                    film.summary = summary
                    film.critique = critique
                    film.year = year
                    dismiss()
                }
                .buttonStyle(.borderedProminent)
            }}
        .onAppear{
            rating = film.rating
            summary = film.summary
            critique = film.critique
            title = film.title
            year = film.year
            
        }
    }
    var changed: Bool {
       rating != film.rating
        || summary != film.summary
        || critique != film.critique
        || title != film.title
        || year != film.year
        
    }
}
//#Preview {
//    NavigationStack{
//        EditFilmView()
//    }}
