struct SampleData {

    static let sampleSource2 = NewsSource(id: "cbc", name: "CNN")
    
    static let MockData : Article = Article(author: "Jack Delamount", title: "Exam is killing me", articleDescription: "Tale of how im crying every night", url: "www.google.com", urlToImage: "https://static.politico.com/73/cc/32e1b2294242a00908c67b4a32fd/election-2024-ap-votecast-black-and-latino-men-78172.jpg", publishedAt: "yesterday", content: "Here is the full content of the news article...", source: "Kristiania")
        
    
    
    static let MockDataTwo : NewsArticle =
        NewsArticle(
                source: sampleSource2,
                author: "John Doe",
                title: "Breaking News: Major Event Unfolds",
                description: "An in-depth look at the latest breaking news.",
                url: "https://www.cnn.com/latest-news",
                urlToImage: "https://static.politico.com/73/cc/32e1b2294242a00908c67b4a32fd/election-2024-ap-votecast-black-and-latino-men-78172.jpg",
                publishedAt: "2024-12-03T09:07:36.4175402Z",
                content: "Here is the full content of the news article..."
            )
    
}
