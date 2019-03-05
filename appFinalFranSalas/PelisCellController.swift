//
//  PelisCellController.swift
//  appFinalFranSalas
//
//  Created by Fran on 3/3/19.
//  Copyright © 2019 Fran. All rights reserved.
//

import UIKit

class PelisCellController
{
    // Model
    let peli: Pelicula
    
    // View
    var cell: UITableViewCell?
    {
        didSet
        {
              print("en didSet de pelisControllerCell")
            updateView()
        }
    }
    
    init(peli: Pelicula)
    {
          print("en init de pelisControllerCell")
        self.peli = peli
    }
    
    private func updateView()
    {
        
        print("en updateView de pelisControllerCell")
        guard let cell = self.cell else
        {
            return
        }
        
        cell.textLabel?.text = "\(peli.title) -> (\(peli.director) , \(peli.release_date)"
    }
}
