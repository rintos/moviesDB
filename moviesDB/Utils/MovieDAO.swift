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
    
    func saveMovie(_ movie: MoviesModel, _ genres: [String]) {
                        
        var movieObject:NSManagedObject?
//        guard let id = UUID(uuidString: tutorialSave.id as! String) else { return }
        let uuid = UUID().uuidString
        let idCoredata = NSUUID(uuidString: uuid)

        let entidade = NSEntityDescription.entity(forEntityName: "Movies", in: context)
        movieObject = NSManagedObject(entity: entidade!, insertInto: context)
        
//print("\(movie.original_title)")
        
//        let dateFormatter = DateFormatter()
//        dateFormatter.dateFormat = "yyyy'-'MM'-'dd'T'HH':'mm':'ssZZZ"
//        let date = dateFormatter.date(from: strDate)
//        let date = DateFormatter()
        
        let id = String(movie.id)
        let title = movie.title
        let overview = movie.overview
        let date = movie.release_date
        let posterPath = movie.poster_path
        let genre = genres as NSObject
        
        let year = date.prefix(4)
        
//        let dateFormartter = DateFormatter()
//        dateFormartter.dateFormat = "yyyy'-'MM'-'dd"
//        let datee = dateFormartter.date(from: date)
        

        
        movieObject?.setValue(id, forKey: "id_API")
        movieObject?.setValue(title, forKey: "title")
        movieObject?.setValue(overview, forKey: "overview")
        movieObject?.setValue(date, forKey: "release_date")
        movieObject?.setValue(posterPath, forKey: "poster_path")
        movieObject?.setValue(idCoredata, forKey: "id")
        movieObject?.setValue(genre, forKey: "genres")
        movieObject?.setValue(year, forKey: "year")
        
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
    
    
    func setupMovies(){
        
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
                
    }
    
    
    func updateContext() {
        do {
            try context.save()
        } catch  {
            print(error.localizedDescription)
            print("erro ao salvar")
        }
    }
    
    
    func deleteMovie(movie: Movies) {
        context.delete(movie)
        updateContext()
    }
    
}
