//
//  BookContentView.swift
//  BookChallangeMod4
//
//  Created by Alex Tran on 3/22/23.
//

import SwiftUI

struct BookContentView: View {
    @EnvironmentObject var model: BookModel
    @State var book: Book
    
    var body: some View {
        TabView(selection: $book.currentPage) {
                ForEach(book.content.indices, id: \.self) { i in
                    VStack{
                        Text(book.content[i]).tag(i)
                        Spacer()
                        Text(String(i))
                    }
                }
            }.tabViewStyle(.page)
    }
}

struct BookContentView_Previews: PreviewProvider {
    static var previews: some View {
        let book = BookModel().books[0]
        BookContentView(book: book)
    }
}
