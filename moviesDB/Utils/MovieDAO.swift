//
//  MovieDAO.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 03/02/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit
import CoreData

class MovieDAO: NSObject {

    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    var managerOfResults:NSFetchedResultsController<Movies>?
    
    static func saveMovie(_ movie: MoviesModel) {
        
        var movieObject:NSManagedObject?
        
//        let entidade = NSEntityDescription.entity(forEntityName: "Tutorials", in: contexto)
//        tutorial = NSManagedObject(entity: entidade!, insertInto: contexto)
        
        print("\(movie.original_title)")
        
        movieObject?.setValue(movie.id, forKey: "id_API")
        movieObject?.setValue(movie.title, forKey: "title")
        movieObject?.setValue(movie.overview, forKey: "overview")
        movieObject?.setValue(movie.release_date, forKey: "release_date")
        
        
        
      //  updateContext()
    }
    
    
    func updateContext() {
        do {
            try context.save()
            print("salvo com sucesso")
        } catch  {
            print(error.localizedDescription)
            print("erro ao salvar")
        }
    }
    
    
}
