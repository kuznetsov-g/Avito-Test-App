//
//  JSONParsing.swift
//  Avito Test App
//
//  Created by Георгий iMac on 26.01.2021.
//

import Foundation

class JSONData {
    let url = URL(string: "https://raw.githubusercontent.com/avito-tech/internship/main/result.json")
    var dataCards : mainJSON!
    var cardsArray: [listStruct] = []
    
    init() {
        getInfo()
    }

    func getInfo() {
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url!) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                return }
            DispatchQueue.main.async {
                guard let data = data else { return }
                self.parsingJSON(data: data)
                }
        }
        task.resume()
    }
    
    func parsingJSON(data: Data) {
        let decoder = JSONDecoder()
        do {
            self.dataCards = try! decoder.decode(mainJSON.self, from: data)
            print(self.dataCards.result.title)
        }
    }
}
