//
//  PelisListStorage.swift
//  appFinalFranSalas
//
//  Created by Fran on 3/3/19.
//  Copyright © 2019 Fran. All rights reserved.
//
import UIKit
import Alamofire

class PelisListStorage
{
    var delegate: PelisListStorageDelegate?
    
    var pelis: [Pelicula] = []
    
    func getPelis()
    {
        
        
        Alamofire.request("https://swapi.co/api/films/").responseJSON { response in
            //Aquí ya podremos trabajar con los datos de la respuesta
            
            do{
                let data = response.data
                print("recibida respuesta api starWars--> \(data)")
                let results = try JSONDecoder().decode(Results.self, from: data!)
                
                //print("results--> \(results.results.count)")
                for peli in results.results{
                  //  print("titulo: \(peli.title)")
                   // print("director: \(peli.director)")
                    self.pelis.append(peli)
                    self.delegate?.pelisListStorage(self, didAddPeli: peli)
                  
                }
                
                
            }catch {
                print("Error: \(error)")
            }
        }
    }
    
  
}
        


protocol PelisListStorageDelegate: class
{
    func pelisListStorage(_: PelisListStorage, didAddPeli peli: Pelicula)
}
