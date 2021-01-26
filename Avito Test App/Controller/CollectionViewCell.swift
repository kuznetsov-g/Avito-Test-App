//
//  CollectionViewCell.swift
//  Avito Test App
//
//  Created by Георгий iMac on 25.01.2021.
//

import UIKit
import Foundation

class CollectionViewCell: UICollectionViewCell {

    @IBOutlet weak var cellTopTitle   : UILabel!
    @IBOutlet weak var cellDescription: UILabel?
    @IBOutlet weak var cellPrice      : UILabel!
    @IBOutlet weak var selectedIcon: UIImageView!
    @IBOutlet weak var customView: UIView!
    
    
    
    override func awakeFromNib() {
        super.awakeFromNib()
    }

    func commonInit(cellTopTitle: String, cellDescription: String, cellPrice: String)
//    , cellImageProduct: Dictionary<String, String>, cellImageSelected: Bool)
    {
        self.cellTopTitle.text    = cellTopTitle
        self.cellDescription?.text = cellDescription
        self.cellPrice.text       = cellPrice
        
    
}
}
