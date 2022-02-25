//
//  Book.swift
//  Books
//
//  Created by Brent on 24/2/2022.
//

import Foundation

struct Book: Identifiable, Decodable {
    
    var title:String
    var cover:String
    var author:String
    var isFavourite:Bool
    var currentPage:Int
    var rating:Int
    var id:Int
    var content:[String]
    
    mutating func toggleIsFavourite() {
        
        self.isFavourite.toggle()
        
    }
    
}
