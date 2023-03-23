//
//  DetailBookView.swift
//  BookChallangeMod4
//
//  Created by Alex Tran on 3/22/23.
//

import SwiftUI

struct DetailBookView: View {
    @EnvironmentObject var model: BookModel
    @State var rating = 1
    @State var book: Book
    @State var isFavorite = false
    
    var body: some View {
        VStack(alignment: .center, spacing: 20){
            NavigationLink {
                BookContentView(book: book)
            } label: {
                VStack{
                    Text("Read Now!")
                        .foregroundColor(.black)
                    Image("cover" + String(book.id))
                        .resizable()
                        .scaledToFit()
                }
            }
            Text("Mark for later!")
            Button(action: {
                isFavorite.toggle()
                model.updateFavourite(forId: book.id)
            }) {
                Image(systemName: isFavorite ? "star.fill" : "star")
                    .resizable()
                    .frame(width: 28, height: 28)
            }
            .accentColor(.yellow)
            .onAppear {
                isFavorite = book.isFavourite
            }
            
            Text("Rate Amazing Words")
            Picker("", selection: $rating) {
                Text("1").tag(1)
                Text("2").tag(2)
                Text("3").tag(3)
                Text("4").tag(4)
                Text("5").tag(5)
            }.pickerStyle(SegmentedPickerStyle())
        }.padding(.horizontal, 50)
        .navigationTitle(book.title)
        .onChange(of: rating) { value in
            model.updateRating(forId: book.id, rating: rating)
        }
        .onAppear { rating = book.rating }
    }
 
}

struct DetailBookView_Previews: PreviewProvider {
    static var previews: some View {
        let book = BookModel()
        DetailBookView(book: book.books[0])
            .environmentObject(book)
    }
}
