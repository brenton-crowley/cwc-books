//
//  BookCard.swift
//  Books
//
//  Created by Brent on 24/2/2022.
//

import SwiftUI

struct BookCard: View {
    
    var book:Book?
    
    var body: some View {
        
        GeometryReader { geo in
            
            let cardHeight = geo.size.height
            
            if let book = book {
                
                ZStack (alignment: .leading) {
                    
                    CardBackground(height: cardHeight)
                    
                    VStack (alignment: .center) {
                        
                        VStack (alignment: .leading) {
                            
                            // hstack
                            HStack {
                                // title
                                Text(book.title)
                                    .font(.title)
                                    .fontWeight(.bold)
                                Spacer()
                                // favourite
                                
                                if book.isFavourite {
                                    
                                    Image(systemName: "star.fill")
                                        .foregroundColor(.yellow)
                                }
                            }
                            // caption
                            Text(book.author)
                                .font(.caption)
                                .italic()
                        }
                        
                        VStack {
                            // image
                            Image(book.cover)
                                .resizable()
                            //                            .frame(height: cardHeight * 0.8)
                                .scaledToFit()
                            //                            .clipped()
                        }
                    }
                    .padding()
                }
            } else {
                CardBackground(height: cardHeight)
            }
            
        }
        
    }
}

struct CardBackground:View {
    
    let height:Double
    
    var body: some View {
        
        Rectangle()
            .frame(height: height)
            .foregroundColor(.white)
            .cornerRadius(20.0)
            .shadow(color: Color(red: 0, green: 0, blue: 0).opacity(0.3), radius: 5.0, x: -2, y: 4)
        
    }
    
}

struct BookCard_Previews: PreviewProvider {
    static var previews: some View {
        
        let bookModel = BookModel()
        
        BookCard(book: bookModel.books[0])
    }
}
