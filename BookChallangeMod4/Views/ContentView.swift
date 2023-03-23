//
//  ContentView.swift
//  BookChallangeMod4
//
//  Created by Alex Tran on 3/22/23.
//

import SwiftUI

struct ContentView: View {
    @ObservedObject var model = BookModel()
    
    var body: some View {
        NavigationView {
            ScrollView{
                LazyVStack{
                    ForEach(model.books) { b in
                        NavigationLink {
                            DetailBookView(book: b)
                        } label: {
                            CardView(book: b)
                        }.buttonStyle(PlainButtonStyle())
                    }
                }
            }
            .navigationTitle("My Libary")
        }.environmentObject(model)
    }
}

struct ContentView_Previews: PreviewProvider {
    static var previews: some View {
        ContentView()
    }
}
