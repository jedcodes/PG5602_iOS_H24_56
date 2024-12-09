import Foundation

struct TickerRepository {
    private let BASE_URL = "https://newsapi.org/v2/top-headlines"
    private let API_KEY = "a4a89329e9b5499d9be4907c2eda4d78"
    
    func fetchHeadlines(country: String? = nil, category: String? = nil) async throws -> [NewsArticle] {
        print("Fetching articles")
        
        // Construct query parameters
        var queryItems = [URLQueryItem(name: "apiKey", value: API_KEY)]
        
        if let country = country {
            queryItems.append(URLQueryItem(name: "country", value: country))
        }
        
        if let category = category {
            queryItems.append(URLQueryItem(name: "category", value: category))
        }
        
        // Construct URL
        var urlComponents = URLComponents(string: BASE_URL)
        urlComponents?.queryItems = queryItems
        
        guard let url = urlComponents?.url else {
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
