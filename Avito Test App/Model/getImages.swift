//
//  getImages.swift
//  Avito Test App
//
//  Created by Георгий iMac on 26.01.2021.
//

import Foundation
import UIKit

let imageCache = NSCache<NSString, UIImage>()

class CustomImageView: UIImageView {
    var imageUrlString: String?
//    private var alamofireManager: Session?
    
    func loadImageUsingUrlString(urlString: String){
        imageUrlString = urlString
        image = nil
        if let imageFromCache = imageCache.object(forKey: urlString as NSString) {
            self.image = imageFromCache
            return
        }
        let url = URL(string: urlString)!
        let session = URLSession(configuration: .default)
        let task = session.dataTask(with: url) { (data, response, error) in
            if error != nil {
                print(error!.localizedDescription)
                return
            }
            DispatchQueue.main.async {
                if let safeData = data {
                DispatchQueue.main.async {
                    guard let imageIcon = UIImage(data: safeData) else { return }
                        let imageToCache = imageIcon
                        if self.imageUrlString == urlString {
                            self.image = imageToCache
                        }
                    imageCache.setObject(imageToCache, forKey: urlString as NSString)
                }
            }
        }
    }
        task.resume()
}
}
