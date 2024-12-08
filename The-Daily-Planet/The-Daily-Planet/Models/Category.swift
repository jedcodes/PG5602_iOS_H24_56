import Foundation
import SwiftData

@Model
final class Category {
    @Attribute(.unique) var categoryTitle: String
    var categoryNote: String
   @Relationship(deleteRule: .cascade) var categoryArticles: [Article]
   
    init(categoryTitle: String, categoryNote: String, categoryArticles: [Article]) {
        self.categoryTitle = categoryTitle
        self.categoryNote = categoryNote
        self.categoryArticles = categoryArticles
    }
}
