//
//  BookListView.swift
//  Books
//
//  Created by Brent on 24/2/2022.
//

import SwiftUI

struct BookListView: View {
    
    @ObservedObject var bookModel = BookModel()
    
    var body: some View {
        
        NavigationView {
            GeometryReader { geo in
                
                ScrollView {
                    
                    VStack (alignment: .leading, spacing: 20.0) {
                        ForEach(bookModel.books) {book in
                            
                            NavigationLink {
                                BookDetails(book: book)
                                    .navigationTitle(book.title)
                            } label: {
                                let cardHeight = geo.size.height * 0.8
                                
                                BookCard(book: book)
                                    .frame(height: cardHeight)
                                    .multilineTextAlignment(TextAlignment.leading)
                            }
                            .buttonStyle(PlainButtonStyle())

                            
                        }
                    }
                    .padding(.horizontal)
                    .navigationTitle("My Library")
                }
            }
        }
        
        .environmentObject(bookModel)
    }
}

struct BookListView_Previews: PreviewProvider {
    static var previews: some View {
        BookListView()
    }
}
