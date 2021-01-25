//
//  ViewController.swift
//  Avito Test App
//
//  Created by Георгий iMac on 25.01.2021.
//

import UIKit

class ViewController: UIViewController {

    @IBOutlet weak var topTitle: UILabel!
    @IBOutlet weak var cardsCollection: UICollectionView!
    @IBOutlet weak var actionButton: UIButton!
    
    
    var cardsData : JSONData!
    
    @IBAction func getActionButton(_ sender: Any) {
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        
        startFunc()
        
        cardsCollection.delegate = self
        cardsCollection.dataSource = self
        let nibCollection = UINib.init(nibName: "CollectionViewCell", bundle: nil)
        cardsCollection.register(nibCollection, forCellWithReuseIdentifier: "collectionCell")

        cardsCollection.reloadData()
    }
}

extension ViewController: CardDataDelegate {
    func updateData(status: String) {
        print("status is ", status)
        print("cardsData...",cardsData.dataCards.status)
        topTitle.text = cardsData.dataCards.result.title
        print("cardsData.cardsArray.count = ",cardsData.cardsArray.count)
        cardsCollection.reloadData()
    }
    
}

extension ViewController: UICollectionViewDataSource, UICollectionViewDelegate {
    func collectionView(_ collectionView: UICollectionView, numberOfItemsInSection section: Int) -> Int {
        print("cardsData.cardsArray.count = ",cardsData.cardsArray.count)
        return cardsData.cardsArray.count
        
    }
    
    func collectionView(_ collectionView: UICollectionView, cellForItemAt indexPath: IndexPath) -> UICollectionViewCell {
        let cell = collectionView.dequeueReusableCell(withReuseIdentifier: "collectionCell", for: indexPath) as! CollectionViewCell
        let cellData = cardsData.cardsArray[indexPath.row]
        let checkDescription : String
        if let _ = cellData.description {
            checkDescription = cellData.description! }
        else { checkDescription = " " }
        cell.commonInit(cellTopTitle: cellData.title ,
                        cellDescription: checkDescription ,
                        cellPrice: cellData.price //,
//                        cellImageProduct: cellData.icon,
//                        cellImageSelected: true
        )
        cell.layer.cornerRadius = 12
       return cell
    }
}

extension ViewController {
    func startFunc() {
        cardsData = JSONData(delegate: self)
        cardsCollection.reloadData()
    }
}
