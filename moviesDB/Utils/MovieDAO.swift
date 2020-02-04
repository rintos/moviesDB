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

    var movieFavoritList: [Movies] = []
    
    var context: NSManagedObjectContext {
        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        return appDelegate.persistentContainer.viewContext
    }
    
    var managerOfResults:NSFetchedResultsController<Movies>?
    
    func saveMovie(_ movie: MoviesModel, _ image: UIImage) {
        
        let images = image
        
        var movieObject:NSManagedObject?
//        guard let id = UUID(uuidString: tutorialSave.id as! String) else { return }
        let uuid = UUID().uuidString
        let idCoredata = NSUUID(uuidString: uuid)

        let entidade = NSEntityDescription.entity(forEntityName: "Movies", in: context)
        movieObject = NSManagedObject(entity: entidade!, insertInto: context)
        
        print("\(movie.original_title)")
        
        let id = String(movie.id)
        let title = movie.title
        let overview = movie.overview
        let date = movie.release_date
        let posterPath = movie.poster_path
        
        
        
        movieObject?.setValue(id, forKey: "id_API")
        movieObject?.setValue(title, forKey: "title")
        movieObject?.setValue(overview, forKey: "overview")
        movieObject?.setValue(date, forKey: "release_date")
        movieObject?.setValue(posterPath, forKey: "poster_path")
        movieObject?.setValue(idCoredata, forKey: "id")
        movieObject?.setValue(images, forKey: "image")
        
//        movieObject?.setValue("234234234", forKey: "id_API")
//        movieObject?.setValue("title", forKey: "title")
//        movieObject?.setValue("overview", forKey: "overview")
//        movieObject?.setValue("date", forKey: "release_date")
//        movieObject?.setValue("temp", forKey: "id")
//        movieObject?.setValue("posterPath", forKey: "poster_path")
        
    
        updateContext()
    }
    
    
    func getFavoriteMovies() -> Array<Movies> {
        
        let searchMovie:NSFetchRequest<Movies> = Movies.fetchRequest()
        let sortedName = NSSortDescriptor(key: "release_date", ascending: true)
        searchMovie.sortDescriptors = [sortedName]
        
        managerOfResults = NSFetchedResultsController(fetchRequest: searchMovie, managedObjectContext: context, sectionNameKeyPath: nil, cacheName: nil)
        
        managerOfResults?.delegate = self as? NSFetchedResultsControllerDelegate
        
        do {
            try managerOfResults?.performFetch()
        } catch {
            print(error.localizedDescription)
        }
        
        guard let listMovies = managerOfResults?.fetchedObjects else { return [] }
        
        return listMovies
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
