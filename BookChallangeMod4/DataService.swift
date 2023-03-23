//
//  DataService.swift
//  BookChallangeMod4
//
//  Created by Alex Tran on 3/22/23.
//

import Foundation
struct DataService {
    func getBook() -> [Book] {
        let pathString = Bundle.main.path(forResource: "Data", ofType: "json")
        guard pathString != nil else{
            return [Book]()
        }
        let url = URL(fileURLWithPath: pathString!)
        do {
            let data = try Data(contentsOf: url)
            do {
                let decoder = JSONDecoder()
                let parsedData = try decoder.decode([Book].self, from: data)
                return parsedData
            } catch {
                print(error)
            }
        } catch {
            print(error)
        }
        
        return [Book]()
    }
}
