//
//  ImageView+Ext.swift
//  service
//
//  Created by Francisco Trinidad Aranda on 05/12/22.
//

import UIKit
extension UIImageView {
    func imageFromURL(_ imageURL: String) {
        if let url = URL(string: imageURL) {
            URLSession.shared.dataTask(with: url, completionHandler: { (data, response, error) in
                guard let data = data, error == nil else { return }
                DispatchQueue.main.async {
                    if let downloadedImage = UIImage(data: data) {
                        self.image = downloadedImage
                    }
                }
            }).resume()
        }
    }
}
