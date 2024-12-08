import SwiftUI
import SwiftData

struct BottomSheetView: View {
    let article: NewsArticle
    @Query private var categories: [Category]
    @Environment(\.modelContext) private var modelContext
    @Environment(\.dismiss) private var dismiss
    @State private var categoryName = ""
    @State private var categoryNote = ""
    @State private var selectedCategory: String = "All"
   
    
    var body: some View {
        ZStack {
            Color(Colors.PrimaryBG)
                .ignoresSafeArea()
            
            NavigationStack {
                VStack {
                    Text("Save this article")
                        .font(Font.custom("Poppins-SemiBold", size: 20))
                        .foregroundStyle(Colors.TextColor)
                        .padding()
                    
                    Spacer()
                    
                    // Picker for existing categories
                    Picker("Select Category", selection: $selectedCategory) {
                        ForEach(categories, id: \.categoryTitle) { category in
                            Text(category.categoryTitle)
                        }
                    }
                    .pickerStyle(.wheel)
                    .padding()
                    
                    Button(action: {
                        addArticleToCategory()
                        dismiss()
                    }) {
                        Text("Add Article to Selected Category")
                            .font(Font.custom("Poppins-Medium", size: 16))
                            .foregroundStyle(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Colors.SecondaryBG)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                    
                    Spacer()
                }
            }
            .safeAreaInset(edge: .bottom) {
                VStack {
                    Text("Create a New Category")
                        .font(Font.custom("Poppins-Medium", size: 18))
                        .foregroundStyle(Colors.TextColor)
                        .padding()
                    
                    TextField("Enter category title", text: $categoryName)
                        .padding()
                        .background(Colors.SecondaryBG)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    TextField("Enter category note", text: $categoryNote)
                        .padding()
                        .background(Colors.SecondaryBG)
                        .cornerRadius(10)
                        .padding(.horizontal)
                    
                    Button(action: {
                        createNewCategory()
                        dismiss()
                    }) {
                        Text("Create Category with Article")
                            .font(Font.custom("Poppins-Medium", size: 16))
                            .foregroundStyle(.white)
                            .padding()
                            .frame(maxWidth: .infinity)
                            .background(Colors.SecondaryBG)
                            .cornerRadius(10)
                            .padding(.horizontal)
                    }
                }
            }
        }
    }
    
    private func addArticleToCategory() {
        // Create a new article from the provided `article`
        let articleToAdd = Article(
            author: article.author ?? "Author",
            title: article.title,
            articleDescription: article.description,
            url: article.url,
            urlToImage: article.urlToImage ?? "https://placehold.co/400",
            publishedAt: article.publishedAt,
            content: article.content ?? "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
            source: article.source.name
        )
        
        if let category = categories.first(where: { $0.categoryTitle == selectedCategory }) {
            category.categoryArticles.append(articleToAdd)
            
            // Persist changes using `modelContext`
            modelContext.insert(articleToAdd)
        }
        
    }
    
    private func createNewCategory() {
            // Ensure the category name is not empty
            guard !categoryName.isEmpty else { return }
            
            // Create a new article from the provided `article`
            let articleToAdd = Article(
                author: article.author ?? "Author",
                title: article.title,
                articleDescription: article.description,
                url: article.url,
                urlToImage: article.urlToImage ?? "https://placehold.co/400",
                publishedAt: article.publishedAt,
                content: article.content ?? "Lorem Ipsum is simply dummy text of the printing and typesetting industry. Lorem Ipsum has been the industry's standard dummy text ever since the 1500s",
                source: article.source.name
            )
            
            // Create a new category and add the article to it
            let newCategory = Category(
                categoryTitle: categoryName,
                categoryNote: categoryNote,
                categoryArticles: [articleToAdd]
            )
            
            // Persist the new category and article using `modelContext`
            modelContext.insert(newCategory)
            modelContext.insert(articleToAdd)
            
            // Reset input fields
            categoryName = ""
            categoryNote = ""
        }
}

#Preview {
    BottomSheetView(article: SampleData.MockDataTwo)
}
