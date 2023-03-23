//
//  BookModel.swift
//  BookChallangeMod4
//
//  Created by Alex Tran on 3/22/23.
//

import Foundation
class BookModel: ObservableObject {
    @Published var books = [Book]()
    
    init () {
        let data = DataService()
        books = data.getBook()
    }
    /// Update the specified book's favourite status. Does nothing if `forId` is invalid.
    func updateFavourite(forId: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].isFavourite.toggle()
        }
    }
    func updateRating(forId: Int, rating: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].rating = rating
        }
    }
    func updateCurrentPage(forId: Int, currPage: Int) {
        if let index = books.firstIndex(where: { $0.id == forId }) {
            books[index].currentPage = currPage
        }
    }
}
