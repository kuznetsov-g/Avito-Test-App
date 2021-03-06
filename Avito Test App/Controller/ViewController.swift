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
    @IBOutlet weak var closeImage: UIImageView!
    
    @IBOutlet var mainView: UIView!
    
    var cardsData : JSONData!
    var indexSelectedCell = -1
    
    @IBAction func getActionButton(_ sender: Any) {
        if indexSelectedCell == -1 {
            showAlert(title: "Уточните, пожалуйста:", message: "вы уверены, что не хотите пользоваться платными услугами?")
        } else {
            showAlert(title: "Вы выбрали услугу", message: cardsData.dataCards.result.list[indexSelectedCell].title)
        }
    }

    override func viewDidLoad() {
        super.viewDidLoad()
        actionButton.layer.cornerRadius = 12


        
//        let closeIcon = PDFData(fileName: "CloseIconTemplate", delegate: self)
//        closeImage.image = closeIcon.iconImage
        
        
        startFunc()
        cardsCollection.delegate = self
        cardsCollection.dataSource = self
        let nibCollection = UINib.init(nibName: "CollectionViewCell", bundle: nil)
        cardsCollection.register(nibCollection, forCellWithReuseIdentifier: "collectionCell")

        cardsCollection.reloadData()
    }
}



//extension ViewController: PDFDataProtocol {
//    func getPDFImage(icon: UIImage) {
//        closeImage.image = icon
//    }
//}



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
        else { checkDescription = "" }
        cell.commonInit(cellTopTitle   : cellData.title ,
                        cellDescription: checkDescription ,
                        cellPrice      : cellData.price,
                        productImage   : cellData.icon
        )
        
        cell.layer.cornerRadius = 12

        if indexPath.row == indexSelectedCell {
            cell.selectedIcon.isHidden = false
            cell.customView.backgroundColor = .white
            cell.customView.backgroundColor?.withAlphaComponent(0.5)
        } else
            if indexSelectedCell == -1 || indexPath.row != indexSelectedCell {
            cell.selectedIcon.isHidden = true
            cell.customView.backgroundColor = .gray
                cell.customView.backgroundColor?.withAlphaComponent(0.5)
        }
        
       return cell
    }
    
    func collectionView(_ collectionView: UICollectionView, didSelectItemAt indexPath: IndexPath) {
       
        

        if indexSelectedCell == indexPath.row {
            self.actionButton.setTitle(cardsData.dataCards.result.actionTitle  , for: .normal)
            indexSelectedCell = -1
        } else {
            indexSelectedCell = indexPath.row
            self.actionButton.setTitle(cardsData.dataCards.result.selectedActionTitle  , for: .normal)
        }
        
        cardsCollection.reloadData()
        self.cardsCollection.scrollToItem(at: IndexPath.init(row: indexPath.row , section: 1), at: .top, animated: true)
    }
    
    
}

extension ViewController {
    func startFunc() {
        cardsData = JSONData(delegate: self)
        cardsCollection.reloadData()
    }
}


extension ViewController {
    private func showAlert(title: String, message: String) {
        let alert = UIAlertController(          title: title
                                             ,message: message
                                      ,preferredStyle: .alert )
        let okAction = UIAlertAction(title: "OK", style: .default)
        alert.addAction(okAction)
        present(alert, animated: true)
    }
}
