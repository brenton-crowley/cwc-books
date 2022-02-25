//
//  BookDetails.swift
//  Books
//
//  Created by Brent on 25/2/2022.
//

import SwiftUI

struct BookDetails: View {
    
    @EnvironmentObject var model:BookModel
    @State var selectedRating = 3
    
    var book:Book?
    
    var body: some View {
        //vstack
        VStack {
            
            if let book = book {
                // read now text
                Text("Read Now!")
                    .font(.title2)
                
                // MARK: - Cover
                
                NavigationLink {
                    BookPages(pages: book.content)
                        .navigationBarTitleDisplayMode(.inline)
                } label: {
                    Image(book.cover)
                        .resizable()
                        .aspectRatio(contentMode: .fit)
                        .padding(.horizontal, 100)
                    
                }

                // MARK: - Bookmark
                VStack {
                    
                    // mark for later text
                    Text("Mark for later!")
                        .font(.caption)
                        .fontWeight(.bold)
                    
                    // button of star
                    Button {
                        // update model
                        model.toggleReadLaterForId(book.id)
                    } label: {
                        
                        let star = book.isFavourite ? "star.fill" : "star"
                        
                        Image(systemName: star)
                            .foregroundColor(.yellow)
                    }
                }
                .padding(.vertical)

                // MARK: - Rating
                VStack {
                    
                    // rate text
                    Text("Rate \(book.title)")
                        .font(.caption)
                        .fontWeight(.bold)
                    
                    // segmented picker
                    Picker("", selection: $selectedRating, content: {
                        ForEach(1...5, id: \.self) { index in
                            Text("\(index)").tag(index)
                        }
                    })
                    .pickerStyle(SegmentedPickerStyle())
                    .padding(.horizontal, 50)
                    .onChange(of: selectedRating) { newValue in
                        model.changeRatingTo(newValue, forId: book.id)
                    }
                }
                .padding(.vertical)

            }
        }
        .onAppear {
            if let book = book {
                self.selectedRating = book.rating
            }
        }
    }
}

struct BookDetails_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = BookModel()
        
        BookDetails(book: model.books[0])
            .environmentObject(model)
    }
}
