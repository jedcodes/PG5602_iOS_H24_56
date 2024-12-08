import Foundation
import Observation

@Observable
class SearchStore {
    var articles: [NewsArticle] = [NewsArticle]()
    private let repository = SearchRepository()
    
    func getArticles(query: String) async {
        do {
            let fetchedArticles = try await repository.fetchNewsArticles(query: query)
            self.articles = fetchedArticles
        } catch {
            print("Error fetching articles: \(error.localizedDescription)")
        }
    }
}
