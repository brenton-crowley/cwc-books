//
//  BookModel.swift
//  Books
//
//  Created by Brent on 24/2/2022.
//

import Foundation

class BookModel:ObservableObject {
    
    @Published var books = [Book]()
    
    init() {
        
        // budgd
        
        if let url = Bundle.main.url(forResource: "Data", withExtension: "json") {
            do {
                let data = try Data(contentsOf: url)
                let decoder = JSONDecoder()
                
                do {
                    self.books = try decoder.decode([Book].self, from: data)
                } catch {
                    print(error)
                }
                
                
            } catch {
                print(error)
            }
        }
        
    }
    
    func toggleReadLaterForId(_ id:Int) {
        
        for i in books.indices {
            if books[i].id == id {
                books[i].toggleIsFavourite()
                break
            }
        }
        
    }
    
    func changeRatingTo(_ rating:Int, forId id:Int) {
        
        for i in books.indices {
            if books[i].id == id {
                books[i].rating = rating
                break
            }
        }
        
    }
}
