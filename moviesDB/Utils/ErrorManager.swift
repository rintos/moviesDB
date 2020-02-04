//
//  ErrorManager.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 03/02/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

class ErrorManager: NSObject {
    
    static func createAnError(domain: String = "Movie", code: Int, message: String? = "gerou erro" ) -> NSError {
        
        let userInfo: [String: Any] = [
            NSLocalizedDescriptionKey: message!
        ]
        
        return NSError(domain: domain, code: 500, userInfo: userInfo)
    }

}
