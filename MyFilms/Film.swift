//
//  Film.swift
//  MyFilms
//
//  Created by Joao Leal on 8/12/24.
//
import SwiftData
import Foundation
import SwiftUI

@Model
class Film {
    var title: String
    var year: String
    var dateAdded: Date
    var summary: String
    var critique: String
    var rating: Int?
    
    init(title: String, year: String, dateAdded: Date = Date.now, summary: String = "", critique: String = "", rating: Int? = nil) {
        self.title = title
        self.year = year
        self.dateAdded = dateAdded
        self.summary = summary
        self.critique = critique
        self.rating = rating
    }
 
}
