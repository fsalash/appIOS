//
//  FavoritosTableViewController.swift
//  appFinalFranSalas
//
//  Created by Fran on 16/3/19.
//  Copyright © 2019 Fran. All rights reserved.
//

import UIKit
import CoreData

class FavoritosTableViewController: UITableViewController {

    var paisesFavoritos = [NSManagedObject]()
   

    override func viewDidLoad() {
        super.viewDidLoad()

        // Uncomment the following line to preserve selection between presentations
        // self.clearsSelectionOnViewWillAppear = false

        // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
        // self.navigationItem.rightBarButtonItem = self.editButtonItem
         
    }
    
    //CORE DATA
    override func viewWillAppear(_ animated: Bool) {
        super.viewWillAppear(animated)
        
        cargaFavoritosActuales()
        self.tableView.reloadData()
        
    }
    
    func cargaFavoritosActuales(){
        

        let appDelegate = UIApplication.shared.delegate as! AppDelegate
        
        let managedContext = appDelegate.managedObjectContext
        
        //2
        let fetchRequest = NSFetchRequest<PaisFavorito>(entityName: "PaisFavorito")
        
        //3
        do {
            paisesFavoritos = try managedContext.fetch(fetchRequest)
        } catch let error as NSError {
            print("Could not fetch \(error), \(error.userInfo)")
        }
        
    }

    // MARK: - Table view data source

    override func numberOfSections(in tableView: UITableView) -> Int {
        // #warning Incomplete implementation, return the number of sections
        return 1
    }

    override func tableView(_ tableView: UITableView, numberOfRowsInSection section: Int) -> Int {
        // #warning Incomplete implementation, return the number of rows
        return paisesFavoritos.count
    }

    
    override func tableView(_ tableView: UITableView, cellForRowAt indexPath: IndexPath) -> UITableViewCell {
        let cell = tableView.dequeueReusableCell(withIdentifier: "celdaPais", for: indexPath) as! FranTableViewCell

        // Configure the cell...

        let nombrePais = paisesFavoritos[indexPath.row].value(forKey: "nombre") as! String
        cell.lblTituloPaisFavorito.text = nombrePais
        return cell
    }

   
    override func tableView(_ tableView: UITableView, heightForRowAt indexPath: IndexPath) -> CGFloat {
        return 100
    }
    

    /*
    // MARK: - Navigation

    // In a storyboard-based application, you will often want to do a little preparation before navigation
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        // Get the new view controller using segue.destination.
        // Pass the selected object to the new view controller.
    }
    */
    
    
    override func tableView(_ tableView: UITableView, didSelectRowAt indexPath: IndexPath) {

        let paisSeleccionado = paisesFavoritos[indexPath.row]
        
        //segue para ir a detalle de pais. Reutilizo codigo, funcion y controller
        performSegue(withIdentifier: "segueMenuInfoFavorito", sender: paisSeleccionado)
    }
    
    
    override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
        
        if segue.identifier == "segueMenuInfoFavorito"
        {
            
            if let destinationVC = segue.destination as? DetallePaisViewController {
                
                //me construyo un objeto Pais a partir del NSManagedObject guardado para pasarlo a VC destino y asi poder reutilizar
                
                let pais = Pais()
                let paisNS = sender as! NSManagedObject
                
                pais.name = paisNS.value(forKey: "nombre") as! String
                pais.region = paisNS.value(forKey: "region") as! String
                pais.population = paisNS.value(forKey: "poblacion") as! Int
                pais.capital = paisNS.value(forKey: "capital") as! String
                pais.dataFlag = paisNS.value(forKey: "dataFlag") as! Data
                pais.languages = paisNS.value(forKey: "idiomas") as! [String]
                pais.currencies = paisNS.value(forKey: "monedas") as! [String]
                pais.lat = paisNS.value(forKey: "latitud") as! Double
                pais.long = paisNS.value(forKey: "longitud") as! Double
      
                destinationVC.pais = pais
                
            }
        }
    }

    
}

