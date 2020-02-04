//
//  UIViewController.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 29/01/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

extension UIViewController {
    
    func goToViewWithPushNavController(storyboard: String, identifier: String, animated: Bool? = true) -> UIViewController {
        let view = UIStoryboard(name: storyboard, bundle: nil).instantiateViewController(identifier: identifier)
        navigationController?.pushViewController(view, animated: animated!)
        return view
    }
}
