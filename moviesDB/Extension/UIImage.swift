//
//  UIImage.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 04/02/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

extension UIImage {
    func dowloadFromServer(url: URL) {
        URLSession.shared.dataTask(with: url) { data, response, error in
            guard
                let httpURLResponse = response as? HTTPURLResponse, httpURLResponse.statusCode == 200,
                let mimeType = response?.mimeType, mimeType.hasPrefix("image"),
                let data = data, error == nil,
                var image = UIImage(data: data)
                else { return }
            DispatchQueue.main.async() {
                image = image
            }
            }.resume()
    }
    func dowloadFromServer(link: String) {
        guard let url = URL(string: link) else { return }
        dowloadFromServer(url: url)
    }
}

