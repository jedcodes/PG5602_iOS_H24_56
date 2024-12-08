import SwiftUI

struct SearchScreen: View {
    @State private var isShowingSheet: Bool = false
    private let model = SearchStore()
    @State private var searchTerm: String = ""
    var body: some View {
        NavigationStack {
            ZStack {
                Color(Colors.PrimaryBG)
                    .ignoresSafeArea()
                
                VStack(spacing: 30) {
                    TextField("Search...", text: $searchTerm)
                        .padding()
                        .background(Colors.SecondaryBG)
                        .cornerRadius(10)
                        .onSubmit {
                            Task {
                                await model.getArticles(query: searchTerm)
                                searchTerm = ""
                            }
                        }
                    
                   
                    
                    if model.articles.isEmpty {
                        EmptyListView(title: "Enter search term", subtitle: "Or tap on filter more to customize your search", imageName: "plus")
                    } else {
                      List {
                          ForEach(model.articles, id: \.publishedAt) { article in
                              NavigationLink(destination: SearchDetailView(article: article)) {
                                  SearchResultView(article: article)
                              }
                          }
                        }
                      .listStyle(.plain)
                      .listRowSeparator(.hidden)
                    }
                    Spacer()
                    
                }
                .padding(.horizontal, 20)
            }
            .navigationTitle("Search")
        }
    }
}

#Preview {
    SearchScreen()
}
