//
//  Search.swift
//  The-Daily-Planet
//
//  Created by Jack Delamou on 08/12/2024.
//

import Foundation
import SwiftData
@Model
final class Search {
    @Attribute(.unique) var searchedTerm: String
    
    init(searchedTerm: String) {
        self.searchedTerm = searchedTerm
    }
}
