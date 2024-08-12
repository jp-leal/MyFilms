//
//  MyFilmsApp.swift
//  MyFilms
//
//  Created by Joao Leal on 8/12/24.
//

import SwiftUI
import SwiftData

@main
struct MyFilmsApp: App {
    var body: some Scene {
        WindowGroup {
            FilmListView()
        }
        .modelContainer(for: Film.self)
    }
    
    init(){
        print(URL.applicationSupportDirectory.path(percentEncoded: false))
    }
}
