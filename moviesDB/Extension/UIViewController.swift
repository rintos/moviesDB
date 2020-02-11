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
    
    
    func showAlert(title: String?="Movies", message: String, closeTitle: String="OK", callback: ((UIAlertAction) -> Void)?=nil) {
    
        let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
        
        alertController.addAction(UIAlertAction(title: closeTitle, style: .default, handler: callback))
        
        present(alertController, animated: true, completion: nil)
    }
    
    


//
//       func showAlert(message: String, title: String = "LifeHeroes", continueTitle: String = "Sair", cancelTitle: String = "Cancelar", continueCallback: ((UIAlertAction) -> Void)?=nil, cancelCallback: ((UIAlertAction) -> Void)?=nil){
//
//               let alertController = UIAlertController(title: title, message: message, preferredStyle: .alert)
//
//               alertController.addAction(UIAlertAction(title: cancelTitle, style: .default, handler: cancelCallback))
//               alertController.addAction(UIAlertAction(title: continueTitle, style: .destructive, handler: continueCallback))
//
//               present(alertController, animated: true, completion: nil)
//          }
    
    
    func closeKeyboardOnOutsideTap() {
           let tap: UITapGestureRecognizer = UITapGestureRecognizer(target: self, action: #selector(UIViewController.dismissKeyboard))
           tap.cancelsTouchesInView = false
           view.addGestureRecognizer(tap)
       }
       
       @objc private func dismissKeyboard() {
           view.endEditing(true)
       }
}
