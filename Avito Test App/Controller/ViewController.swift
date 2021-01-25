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
    
    
    
    @IBAction func getActionButton(_ sender: Any) {
    }
    
    
    
    
    
    
    
    
    
    override func viewDidLoad() {
        super.viewDidLoad()
        // Do any additional setup after loading the view.
        
        let _ = JSONData()
    }


}

