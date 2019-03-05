//
//  PeliculasViewController.swift
//  appFinalFranSalas
//
//  Created by Fran on 2/3/19.
//  Copyright © 2019 Fran. All rights reserved.
//

import UIKit


class PeliculasViewController: UIViewController,UITableViewDataSource,UITableViewDelegate, PelisListStorageDelegate {
    
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
       print("preguntando por numero de filas en la seccion")
        return datosPrueba.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
       
        let cell : PeliTableViewCell = tableView.dequeueReusableCell(withIdentifier: "celdaPeli") as! PeliTableViewCell
        
        cell.textLabel?.text = datosPrueba[indexPath.row]
        
        return cell
    }
    
    
    // @IBOutlet weak var tableView: UITableView!
    //var pelis:[Pelicula] = []
    
    let datosPrueba = ["uno","dos","tres","cuatro","cinco","seis","siete","ocho","nueve","diez"]
    
    private let pelisListStorage: PelisListStorage
    private var pelisCellControllers: [PelisCellController] = []
    
    
    init(pelisListStorage: PelisListStorage)
    {
         print("en  init")
        self.pelisListStorage = pelisListStorage
        super.init(nibName: nil, bundle: nil)
        self.pelisListStorage.delegate = self
    }
    
    required convenience init?(coder aDecoder: NSCoder)
    {
        print("en convenience init?")
        self.init(pelisListStorage: PelisListStorage())
    }

    override func viewDidLoad() {
        super.viewDidLoad()
      
        print("viewDidLoad en PeliculasViewController")

     
        
        // Do any additional setup after loading the view.
       // pelisListStorage.getPelis()
    }
    
    
    private func updateCellControllers()
    {
        print("en updateCellControllers")
        pelisCellControllers = pelisListStorage.pelis.map({ (peli: Pelicula) -> PelisCellController in
            return PelisCellController(peli: peli)
        })
    }
    
    //@IBOutlet weak var tableView: UITableView!
    
    
    func pelisListStorage(_: PelisListStorage, didAddPeli peli: Pelicula) {
        print("en pelisListStorage")
        //print(self.tableView)
        
        
    }
    
    
    /*
    func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        print("enganchado datasource tabla")
       // return pelisListStorage.pelis.count
        return datosPrueba.count
    }
    
    func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        print("enganchado datasource tabla")
        
        let cell : UITableViewCell = tableView.dequeueReusableCell(withIdentifier: "celdaPeli") as! PeliTableViewCell
        
        cell.textLabel?.text = "celda \(indexPath.row) "
        
        return cell
    }
    */
    /*
    func getPelis(){
        
        
        
        Alamofire.request("https://swapi.co/api/films/").responseJSON { response in
            //Aquí ya podremos trabajar con los datos de la respuesta
            
            do{
                let data = response.data
               // print("data--> \(data)")
                let results = try JSONDecoder().decode(Results.self, from: data!)
               
                    print("results--> \(results.results.count)")
                for peli in results.results{
                    print("titulo: \(peli.title)")
                    print("director: \(peli.director)")
                }
                
                /*
                for peli in results{
                    
                    print("Titulo-> \(peli.title)" )
                     print("Director-> \(peli.director)" )
                }*/
              
            }catch {
                print("Error: \(error)")
            }
        }
    }
    */

}

