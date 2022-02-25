//
//  BookPages.swift
//  Books
//
//  Created by Brent on 25/2/2022.
//

import SwiftUI

struct BookPages: View {
    
    let pages:[String]
    
    @State var selectedPage = 1
    
    var body: some View {
        
        VStack {
            TabView(selection: $selectedPage) {
                ForEach(pages.indices, id:\.self) {index in
                    
                    Text(pages[index]).tag(index + 1)
                        
                }
            }
            .tabViewStyle(
                PageTabViewStyle(indexDisplayMode: .never)
            )
            
            Text("\(selectedPage)")
            
        }.padding()
        
    }
}

struct BookPages_Previews: PreviewProvider {
    static var previews: some View {
        
        let model = BookModel()
        
        BookPages(pages: model.books[0].content)
    }
}
