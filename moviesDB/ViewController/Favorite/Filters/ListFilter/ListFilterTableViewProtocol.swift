//
//  ListFilterTableViewProtocol.swift
//  moviesDB
//
//  Created by Victor Soares de Almeida on 06/02/20.
//  Copyright © 2020 Victor Soares de Almeida. All rights reserved.
//

import UIKit

extension ListFilterViewController: UITableViewDelegate, UITableViewDataSource {
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        return self.listTypeFilter.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "listFilterID", for: indexPath) as? ListFilterTableViewCell
        
        cell!.genresLabel.text = self.listTypeFilter[indexPath.row]
        
        return cell!
    }
    
    func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {
        let type = self.listTypeFilter[indexPath.row]
        print("Tipo selecionado:\(type)")
        self.selectedTypes.append(type)
        self.hasFilterIsEnable = true
    }
    
    func tableView(_ tableView: UITableView, didDeselectRowAt indexPath: IndexPath) {
        if let index = self.selectedTypes.firstIndex(of:
            self.listTypeFilter[indexPath.row]) {
            print("Tipo removido do array: \(self.listTypeFilter[indexPath.row])")
            self.selectedTypes.remove(at: index)
        }
    }
    
    
    func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 200
    }
    
    
}
