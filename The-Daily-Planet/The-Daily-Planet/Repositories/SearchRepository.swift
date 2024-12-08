import Foundation

struct SearchRepository {
    private let BASE_URL = "https://newsapi.org/v2/everything"
    private let API_KEY = "a4a89329e9b5499d9be4907c2eda4d78"
    
    func fetchNewsArticles(query: String) async throws -> [NewsArticle] {
        print("Fetching")
        
        // Construct URL
        guard let url = URL(string: "\(BASE_URL)?q=\(query)&apiKey=\(API_KEY)") else {
            throw ErrorRepository.invalidURL
        }
        print("URL: \(url)")
        
        // Fetch Data
        let (data, response) = try await URLSession.shared.data(from: url)
        
        // Check Response Status
        if let httpResponse = response as? HTTPURLResponse, httpResponse.statusCode != 200 {
            print("HTTP Error: \(httpResponse.statusCode)")
            throw ErrorRepository.invalidResponse
        }
        
        // Decode Data
        do {
            let decoder = JSONDecoder()
            decoder.keyDecodingStrategy = .convertFromSnakeCase // Handles JSON keys like `published_at`
            let wrapper = try decoder.decode(NewsResponse.self, from: data)
            print("Articles fetched: \(wrapper.articles.count)")
            
            return wrapper.articles
        } catch {
            print("Decoding Error: \(error.localizedDescription)")
            throw ErrorRepository.invalidData
        }
    }
}
