//
//  CardView.swift
//  BookChallangeMod4
//
//  Created by Alex Tran on 3/22/23.
//

import SwiftUI

struct CardView: View {
    @State var book: Book
    @State var isFavorite = false
    
    var body: some View {
        ZStack {
            Rectangle()
                .foregroundColor(.white)
                .cornerRadius(10.0)
                .shadow(radius: 10, x: -5, y: 5)
            VStack(alignment: .leading) {
                VStack(alignment: .leading){
                    HStack{
                        Text(book.title)
                        .font(Font.custom("Avenir Heavy", size: 24))
                        Spacer()
                        if isFavorite {
                            Image(systemName: "star.fill")
                                .foregroundColor(.yellow)
                        }
                    }
                    Text(book.author)
                        .font(Font.custom("Avenir", size: 16))
                }
                    Spacer()
                    Image("cover" + String(book.id))
                        .resizable()
                        .scaledToFit()
            }.padding()
        }.frame(height: 570)
        .padding()
        .onAppear{
            isFavorite = book.isFavourite
        }
    }
}

struct CardView_Previews: PreviewProvider {
    static var previews: some View {
        let model = BookModel()
        CardView(book: model.books[0])
    }
}
