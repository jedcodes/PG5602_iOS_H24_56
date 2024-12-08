import Foundation
import SwiftData

@Model
class Article {
    var author: String
    var title: String
    var articleDescription: String
    var url: String
    var urlToImage: String
    var publishedAt: String
    var content: String
    var source: String
    
    init(author: String, title: String, articleDescription: String, url: String, urlToImage: String, publishedAt: String, content: String, source: String) {
        self.author = author
        self.title = title
        self.articleDescription = articleDescription
        self.url = url
        self.urlToImage = urlToImage
        self.publishedAt = publishedAt
        self.content = content
        self.source = source
    }
}
