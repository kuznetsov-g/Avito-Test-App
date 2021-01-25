//
//  JSONParsing.swift
//  Avito Test App
//
//  Created by Георгий iMac on 26.01.2021.
//

import Foundation

protocol CardDataDelegate: class {
    func updateData(status: String )
}

class JSONData {
    let url = URL(string: "https://raw.githubusercontent.com/avito-tech/internship/main/result.json")
    var dataCards : mainJSON!
    var cardsArray: [listStruct] = []
    
    weak var cardDataDelegate: CardDataDelegate!
    
    init(delegate: CardDataDelegate) {
        self.cardDataDelegate = delegate
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
            getCardsArray()
        }
    }
    
    func getCardsArray() {
        for x in 0...self.dataCards.result.list.count-1 {
            let cardData = self.dataCards.result.list[x]
            cardsArray += [cardData]
        }
        sendDataToView()
    }
    
    func sendDataToView () {
        self.cardDataDelegate.updateData(status: self.dataCards.status)
    }
}

    
